import 'package:dating_app/core/extensions/string_extension.dart';
import 'package:dating_app/data/repository/auth_repo.dart';
import 'package:dating_app/presentation/components/widgets/custom_button_widget.dart';
import 'package:dating_app/presentation/pages/auth/components/widgets/custom_text_field_widget.dart';
import 'package:dating_app/presentation/pages/auth/state/cubit/password_visibility_cubit.dart';
import 'package:dating_app/presentation/pages/auth/state/cubit/terms_checkbox_cubit.dart';
import 'package:dating_app/utils/pop_up_utils.dart';
import 'package:dating_app/utils/screen_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../components/widgets/social_media_group_widget.dart';

/// BU SAYFADA SİNGLECHİLD İLE KLAVYE AÇLDIĞINDA OLAN RESPONSİVİTY SAĞLARKEN
/// LOGİNDE WİDGETLARI SIKIŞTIRDIM İKİ YÖNTEMLEDE YAPABİLİRİM

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() async{
    if (_formKey.currentState!.validate()) {
      if (!context.read<TermsCheckBoxCubit>().state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Kullanım sözleşmesini kabul etmelisiniz'),
            backgroundColor: AppColors.primaryRed,
          ),
        );
        return;
      }

      // Kayıt işlemi burada yapılacak
      bool success = await AuthRepo.signUp(email: _emailController.text, password: _passwordController.text, name: _nameController.text);

      // Kayıt sonucu
      _showPopup(success);
    }
  }

  void _showPopup(bool success){
    if(mounted) {
      PopUpUtils.showPopup(context, success, successMessage: 'Kayıt başarılı!',
          failureMessage: 'Kayıt başarısız!');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtils.getScreenWidth(context) * 0.07),
          child: SizedBox(
            width: double.infinity,
            height: ScreenUtils.getScreenHeight(context),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Spacer(flex: 7),
            
                  // Logo ve Başlık
                  const Text(
                    'Hoşgeldiniz',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Tempus varius a vitae interdum id tortor\nelementum tristique eleifend at.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        height: 1.5,
                        fontWeight: FontWeight.w400),
                  ),
            
                  const Spacer(),
            
                  // Form Alanları
                  CustomTextFieldWidget(
                    controller: _nameController,
                    hintText: 'Ad Soyad',
                    labelText: 'Ad Soyad',
                    prefixIcon: Icons.person_outline,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ad soyad gerekli';
                      }
                      if (value.length < 2) {
                        return 'Ad soyad en az 2 karakter olmalı';
                      }
                      return null;
                    },
                  ),
            
                  const Spacer(),
                  CustomTextFieldWidget(
                    controller: _emailController,
                    hintText: 'E-Posta',
                    labelText: 'E-Posta',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'E-posta adresi gerekli';
                      }
                      if (!value.isValidEmail) {
                        return 'Geçerli bir e-posta adresi girin';
                      }
                      return null;
                    },
                  ),
            
                  const Spacer(),

                  BlocBuilder<PasswordVisibilityCubit, bool>(
                      builder: (context, isVisible) {
                      return CustomTextFieldWidget(
                        controller: _passwordController,
                        hintText: 'Şifre',
                        labelText: 'Şifre',
                        prefixIcon: Icons.lock_outline,
                        obscureText: !isVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                            color: AppColors.textSecondary,
                          ),
                          onPressed: () => context.read<PasswordVisibilityCubit>().changeVisibility(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Şifre gerekli';
                          }
                          if (value.length < 6) {
                            return 'Şifre en az 6 karakter olmalı';
                          }
                          return null;
                        },
                      );
                    }
                  ),
            
                  const Spacer(),
                  BlocBuilder<PasswordVisibilityCubit, bool>(
                      builder: (context, isVisible) {
                      return CustomTextFieldWidget(
                        controller: _confirmPasswordController,
                        hintText: 'Şifre Tekrar',
                        labelText: 'Şifre Tekrar',
                        prefixIcon: Icons.lock_outline,
                        obscureText: !isVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            isVisible ? Icons.visibility : Icons.visibility_off,
                            color: AppColors.textSecondary,
                          ),
                          onPressed: () => context.read<PasswordVisibilityCubit>().changeVisibility(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Şifre tekrarı gerekli';
                          }
                          if (value != _passwordController.text) {
                            return 'Şifreler eşleşmiyor';
                          }
                          return null;
                        },
                      );
                    }
                  ),
            
                  const Spacer(flex: 1,),
            
                  // Sözleşme Checkbox
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<TermsCheckBoxCubit,bool>(
                        builder: (context,isChecked) {
                          return Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              context.read<TermsCheckBoxCubit>().toggleCheck();
                            },
                            activeColor: AppColors.primaryRed,
                            checkColor: Colors.white,
                          );
                        }
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Kullanıcı sözleşmesini  ',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.4,
                                  ),
                                ),
                                TextSpan(
                                  text: 'okudum ve kabul ediyorum.',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.4,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("Kullanıcı sözleşmesi tıklandı!");
                                    },
                                ),
                                const TextSpan(
                                  text:
                                      'Bu sözleşmeyi okuyarak devam ediniz lütfen.',
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.4,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            
                  const Spacer(flex: 3,),
            
                  // Kayıt Ol Butonu
                  CustomButtonWidget(onPressed: _signUp, text: 'Şimdi Kaydol'),
            
                  const Spacer(flex: 2,),
            
                  // Sosyal Medya Butonları
                  const SocialMediaGroupWidget(),
            
                  const Spacer(flex: 2,),
            
                  // Giriş Yap
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Zaten bir hesabın var mı? ',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: const Text(
                          'Giriş Yap!',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(flex: 2,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



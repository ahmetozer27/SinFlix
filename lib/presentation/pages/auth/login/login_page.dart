import 'package:dating_app/core/extensions/string_extension.dart';
import 'package:dating_app/data/repository/auth_repo.dart';
import 'package:dating_app/presentation/components/widgets/custom_button_widget.dart';
import 'package:dating_app/presentation/pages/auth/components/widgets/social_media_group_widget.dart';
import 'package:dating_app/presentation/pages/auth/state/cubit/password_visibility_cubit.dart';
import 'package:dating_app/utils/pop_up_utils.dart';
import 'package:dating_app/utils/screen_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../data/repository/profile_repo.dart';
import '../../profile/state/cubit/profile_cubit.dart';
import '../components/widgets/custom_text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _navigateToRegister() {
    context.push('/register');
  }

  void _navigateToMain(bool success) {
    if (success) {
      context.go('/main');
    }
  }

  void _showPopup(bool success) {
    PopUpUtils.showPopup(context, success,
        successMessage: 'Giriş başarılı!', failureMessage: 'Giriş Başarısız!');
  }

  void _signIn() async {
    if (_formKey.currentState!.validate()) {

      // Giriş işlemi burada yapılacak
      var success = await AuthRepo.signIn(email: _emailController.text, password: _passwordController.text);
      if (mounted) {
        await ProfileRepo.fetchProfileData(context.read<ProfileCubit>()); // profil bilgierini getir
        _showPopup(success);
        _navigateToMain(success);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtils.getScreenWidth(context) * 0.07),
          child: Column(
            children: [
              const Spacer(flex: 17),
              // Logo ve Başlık
              Text(
                context.tr('hello'),
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'Tempus varius a vitae interdum id\ntortor elementum tristique eleifend at.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                    height: 1.5,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(
                flex: 3,
              ),
              // Form Alanları
              CustomTextFieldWidget(
                controller: _emailController,
                hintText: 'E-Posta',
                labelText: 'E-Posta',
                prefixIcon: FontAwesomeIcons.envelope,
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
              const Spacer(
                flex: 1,
              ),

              BlocBuilder<PasswordVisibilityCubit, bool>(
                  builder: (context, isVisible) {
                return CustomTextFieldWidget(
                  controller: _passwordController,
                  hintText: 'Şifre',
                  labelText: 'Şifre',
                  prefixIcon: Icons.lock_open,
                  obscureText: !isVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: () => context
                        .read<PasswordVisibilityCubit>()
                        .changeVisibility(),
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
              }),
              const Spacer(
                flex: 2,
              ),

              // Şifremi Unuttum
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {
                    // Şifre sıfırlama işlemi
                  },
                  child: const Text(
                    'Şifremi unuttum',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),

              // Giriş Butonu
              CustomButtonWidget(onPressed: _signIn, text: 'Giriş Yap'),

              const Spacer(
                flex: 4,
              ),

              // Sosyal Medya Butonları
              const SocialMediaGroupWidget(),
              const Spacer(
                flex: 3,
              ),
              // Kayıt Ol
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Bir hesabın yok mu? ',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: _navigateToRegister,
                    child: const Text(
                      'Kayıt Ol!',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

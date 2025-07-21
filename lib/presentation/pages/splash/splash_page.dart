import 'package:dating_app/data/repository/profile_repo.dart';
import 'package:dating_app/presentation/pages/profile/state/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _animationController.forward();
    _authGuard();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  void _navigateMain() {
    if (mounted) {
      context.go('/main');
    }
  }

  void _navigateLogin() {
    context.go('/login');
  }

  void _authGuard() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 3), () async{

        if(mounted){
          var success = await ProfileRepo.fetchProfileData(context.read<ProfileCubit>());
          if(success){
            _navigateMain();
          }
          else{
            _navigateLogin();
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'lib/resources/assets/images/SinFlixSplash.png',
                ),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 10,
              ),
              // Slogan
              AnimatedBuilder(
                animation: _fadeAnimation,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      'Harika deneyimler sizi bekliyor',
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                  );
                },
              ),
              const Spacer(
                flex: 1,
              ),
              // Yükleniyor animasyonu
              AnimatedBuilder(
                animation: _fadeAnimation,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: const CircularProgressIndicator(
                      color: AppColors.primaryRed,
                      strokeWidth: 3,
                    ),
                  );
                },
              ),
              const Spacer(
                flex: 1,
              ),
              // Durum mesajı
              AnimatedBuilder(
                animation: _fadeAnimation,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      "Bağlantı kuruluyor...",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              ),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

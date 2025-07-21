import 'package:dating_app/presentation/pages/auth/login/login_page.dart';
import 'package:dating_app/presentation/pages/auth/register/register_page.dart';
import 'package:dating_app/presentation/pages/home/home_page.dart';
import 'package:dating_app/presentation/pages/main/main_page.dart';
import 'package:dating_app/presentation/pages/notFound/notFound_page.dart';
import 'package:dating_app/presentation/pages/profile/components/pages/upload_photo/upload_photo_page.dart';
import 'package:dating_app/presentation/pages/profile/profile_page.dart';
import 'package:dating_app/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterUtils {
  static GoRouter routerConfig(){
    return GoRouter(
      initialLocation: '/splash',
      routes: <RouteBase>[
        GoRoute(
          path: '/splash',
          builder: (BuildContext context, GoRouterState state) {
            return const SplashPage();
          },
        ),
        GoRoute(
          path: '/main',
          builder: (BuildContext context, GoRouterState state) {
            return const MainPage();
          },
        ),
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: '/register',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterPage();
          },
        ),
        GoRoute(
          path: '/profile',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfilePage();
          },
        ),
        GoRoute(
          path: '/upload_photo',
          builder: (BuildContext context, GoRouterState state) {
            return const UploadPhotoPage();
          },
        ),
      ],
      errorBuilder: (context, state) => const NotFoundPage(),
    );

  }
}
import 'package:dating_app/presentation/pages/auth/state/cubit/password_visibility_cubit.dart';
import 'package:dating_app/presentation/pages/main/state/bottom_nav_cubit.dart';
import 'package:dating_app/presentation/pages/profile/state/bloc/favorite_movie_bloc.dart';
import 'package:dating_app/presentation/pages/profile/state/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../presentation/pages/auth/state/cubit/terms_checkbox_cubit.dart';
import '../../presentation/pages/home/components/state/bloc/movie_bloc.dart';
import '../state_management/cubit/language_cubit.dart';
import '../state_management/cubit/theme_cubit.dart';

class BlocInitialize extends StatelessWidget {
  final Widget child;
  final ThemeMode initialTheme;
  final Locale initialLocale;

  const BlocInitialize(
      {super.key,
      required this.child,
      required this.initialTheme,
      required this.initialLocale});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(initialTheme),
        ),
        BlocProvider(
          create: (_) => LanguageCubit(initialLocale),
        ),
        BlocProvider(
          create: (_) => BottomNavCubit(),
        ),
        BlocProvider(
          create: (_) => PasswordVisibilityCubit(),
        ),
        BlocProvider(
          create: (_) => TermsCheckBoxCubit(),
        ),
        BlocProvider(
          create: (_) => ProfileCubit(),
        ),
        BlocProvider(
          create: (_) => FavoriteMovieBloc(),
        ),
        BlocProvider(
          create: (_) => MovieBloc(),
        )

      ],
      child: child,
    );
  }
}

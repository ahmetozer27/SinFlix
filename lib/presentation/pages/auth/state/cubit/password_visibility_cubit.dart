import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordVisibilityCubit extends Cubit<bool>{
  PasswordVisibilityCubit() : super(false);

  void changeVisibility () => emit(!state);
}
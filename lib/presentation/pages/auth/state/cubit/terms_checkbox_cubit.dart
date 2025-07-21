import 'package:flutter_bloc/flutter_bloc.dart';

class TermsCheckBoxCubit extends Cubit<bool>{
  TermsCheckBoxCubit() : super(false);
  void toggleCheck() => emit(!state);
}
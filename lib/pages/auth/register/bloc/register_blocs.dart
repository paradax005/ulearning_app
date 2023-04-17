import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/auth/register/bloc/register_events.dart';
import 'package:ulearning_app/pages/auth/register/bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<UserNameEvent>(_userNameEvent);

    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);

    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(rePassword: event.rePassword));
  }
}

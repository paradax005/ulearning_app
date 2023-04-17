abstract class RegisterEvent {
  const RegisterEvent();
}

class UserNameEvent extends RegisterEvent {
  final String username;

  UserNameEvent(this.username);
}

class EmailEvent extends RegisterEvent {
  final String email;

  EmailEvent(this.email);
}

class PasswordEvent extends RegisterEvent {
  final String password;

  PasswordEvent(this.password);
}

class RePasswordEvent extends RegisterEvent {
  final String rePassword;

  RePasswordEvent(this.rePassword);
}

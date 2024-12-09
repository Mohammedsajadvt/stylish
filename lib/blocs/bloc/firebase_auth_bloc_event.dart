part of 'firebase_auth_bloc_bloc.dart';

abstract class FirebaseAuthEvent extends Equatable {
  const FirebaseAuthEvent();

  @override
  List<Object> get props => [];
}

class CheckLoginStatusEvent extends FirebaseAuthEvent{}


class LoginEvent extends FirebaseAuthEvent{
  final String email;
  final String password;
  const LoginEvent({required this.email,required this.password});
  
  @override
  List<Object> get props => [email,password];
}


class SignUpEvent extends FirebaseAuthEvent{
  final UserModel user;
  const SignUpEvent({required this.user});
    
  @override
  List<Object> get props => [user];
}

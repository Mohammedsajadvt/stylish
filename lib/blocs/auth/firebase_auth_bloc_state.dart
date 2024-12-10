part of 'firebase_auth_bloc_bloc.dart';

abstract class FirebaseAuthState extends Equatable {
  const FirebaseAuthState();
  
  @override
  List<Object> get props => [];
}

class FirebaseAuthInitial extends FirebaseAuthState {}

class AuthLoading extends FirebaseAuthState{}

class AuthendicatedState extends FirebaseAuthState{
  User user;
  AuthendicatedState(this.user);
    
  @override
  List<Object> get props => [user];
}

class UnAthendicated extends FirebaseAuthState{}

class AuthendicatedError extends FirebaseAuthState{
  final String message;
  const AuthendicatedError({required this.message});
}



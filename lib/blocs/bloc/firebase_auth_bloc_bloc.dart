import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stylish/data/models/user_model.dart';

part 'firebase_auth_bloc_event.dart';
part 'firebase_auth_bloc_state.dart';

class FirebaseAuthBloc extends Bloc<FirebaseAuthEvent, FirebaseAuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuthBloc() : super(FirebaseAuthInitial()) {
    on<CheckLoginStatusEvent>((event, emit)async {
      User? user;
    try{
    
    await Future.delayed(const Duration(seconds: 1),(){
      user = _auth.currentUser;
    });
    if(user!=null){
      emit(AuthendicatedState(user!));
    }else{
      emit(UnAthendicated());
    }
    }catch(e){
      emit(AthendicatedError(message: e.toString()));
    }
    });
  }
}

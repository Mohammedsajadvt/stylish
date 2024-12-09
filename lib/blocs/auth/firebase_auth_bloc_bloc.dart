import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stylish/data/models/user_model.dart';

part 'firebase_auth_bloc_event.dart';
part 'firebase_auth_bloc_state.dart';

class FirebaseAuthBloc extends Bloc<FirebaseAuthEvent, FirebaseAuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuthBloc() : super(FirebaseAuthInitial()) {
    on<CheckLoginStatusEvent>((event, emit) async {
      User? user;
      try {
        await Future.delayed(const Duration(seconds: 1), () {
          user = _auth.currentUser;
        });
        if (user != null) {
          emit(AuthendicatedState(user!));
        } else {
          emit(UnAthendicated());
        }
      } catch (e) {
        emit(AthendicatedError(message: e.toString()));
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final userCredential = await _auth.createUserWithEmailAndPassword(
            email: event.user!.email.toString(),
            password: event.user!.password.toString());
        final user = userCredential.user;
        if (user != null) {
          FirebaseFirestore.instance.collection("users").doc(user.uid).set({
            'uid': user.uid,
            'email': user.email,
            'createdAt': DateTime.now()
          });
          emit(AuthendicatedState(user));
        } else {
          emit(UnAthendicated());
        }
      } catch (e) {
        emit(AthendicatedError(message: e.toString()));
      }
    });
    on<LogoutEvent>((event, emit) async {
      try {
        await _auth.signOut();
        emit(UnAthendicated());
      } catch (e) {
        emit(AthendicatedError(message: e.toString()));
      }
    });
    on<LoginEvent>((event, emit)async {
      emit(AuthLoading());
      try{
        final userCredential = await _auth.signInWithEmailAndPassword(email: event.email, password: event.password);
        final user = userCredential.user;
        if(user!=null){
          emit(AuthendicatedState(user));
        }else{
          emit(UnAthendicated());
        }
      }catch(e){
      emit(AthendicatedError(message: e.toString()));
      }
    },);
  }
}

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
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
    on<LoginEvent>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final userCredential = await _auth.signInWithEmailAndPassword(
              email: event.email, password: event.password);
          final user = userCredential.user;
          if (user != null) {
            emit(AuthendicatedState(user));
          } else {
            emit(UnAthendicated());
          }
        } catch (e) {
          emit(AthendicatedError(message: e.toString()));
        }
      },
    );
    on<SignInWithGoogle>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final GoogleSignIn googleSignIn = GoogleSignIn();
          final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
          if (googleUser == null) {
            emit(UnAthendicated());
            return;
          }
          final GoogleSignInAuthentication googleAuth =
              await googleUser.authentication;
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          final userCredential = await _auth.signInWithCredential(credential);
          final user = userCredential.user;
          if (user != null) {
            emit(AuthendicatedState(user));
          } else {
            emit(UnAthendicated());
          }
        } catch (e) {
          emit(AthendicatedError(
              message: 'Google sign-in failed: ${e.toString()}'));
        }
      },
    );
    on<SignInApple>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final appleCredential =
              await SignInWithApple.getAppleIDCredential(scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ]);
          final AuthCredential credential =
              OAuthProvider('apple.com').credential(
            idToken: appleCredential.identityToken,
            accessToken: appleCredential.authorizationCode,
          );
          UserCredential userCredential =
              await _auth.signInWithCredential(credential);
          emit(AuthendicatedState(userCredential.user!));
        } catch (e) {
          emit(AthendicatedError(message: e.toString()));
        }
      },
    );
    on<SignInWithFacebook>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final result = await FacebookAuth.instance.login();
          if (result.status == LoginStatus.success) {
            final AuthCredential credential = FacebookAuthProvider.credential(
                result.accessToken!.tokenString);
            UserCredential userCredential =
                await _auth.signInWithCredential(credential);
            emit(AuthendicatedState(userCredential.user!));
          }
        } catch (e) {
          emit(AthendicatedError(message: e.toString()));
        }
      },
    );
    on<SignUpWithGoogle>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final GoogleSignIn googleSignIn = GoogleSignIn();
          final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
          if (googleUser == null) {
            emit(UnAthendicated());
            return;
          }
          final GoogleSignInAuthentication googleAuth =
              await googleUser.authentication;
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          final userCredential = await _auth.signInWithCredential(credential);
          final user = userCredential.user;
          if (user != null) {
            emit(AuthendicatedState(user));
          } else {
            emit(UnAthendicated());
          }
        } catch (e) {
          emit(AthendicatedError(
              message: 'Google sign-in failed: ${e.toString()}'));
        }
      },
    );
    on<SignUpWithApple>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final appleCredential =
              await SignInWithApple.getAppleIDCredential(scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ]);
          final AuthCredential credential =
              OAuthProvider('apple.com').credential(
            idToken: appleCredential.identityToken,
            accessToken: appleCredential.authorizationCode,
          );
          UserCredential userCredential =
              await _auth.signInWithCredential(credential);
          emit(AuthendicatedState(userCredential.user!));
        } catch (e) {
          emit(AthendicatedError(message: e.toString()));
        }
      },
    );
    on<SignUpWithFacebook>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final result = await FacebookAuth.instance.login();
          if (result.status == LoginStatus.success) {
            final AuthCredential credential = FacebookAuthProvider.credential(
                result.accessToken!.tokenString);
            UserCredential userCredential =
                await _auth.signInWithCredential(credential);
            emit(AuthendicatedState(userCredential.user!));
          }
        } catch (e) {
          emit(AthendicatedError(message: e.toString()));
        }
      },
    );
  }
}

import 'package:stylish/utils/index.dart';

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
        emit(AuthendicatedError(message: e.toString()));
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
        emit(AuthendicatedError(message: e.toString()));
      }
    });
    on<LogoutEvent>((event, emit) async {
      try {
        await _auth.signOut();
        emit(UnAthendicated());
      } catch (e) {
        emit(AuthendicatedError(message: e.toString()));
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
          emit(AuthendicatedError(message: e.toString()));
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
            FirebaseFirestore.instance.collection('users').doc(user.uid).set({
              'uid': user.uid,
              'email': user.email,
              'createdAt': DateTime.now()
            }, SetOptions(merge: true));
            emit(AuthendicatedState(user));
          } else {
            emit(UnAthendicated());
          }
        } catch (e) {
          emit(AuthendicatedError(
              message: 'Google sign-in failed: ${e.toString()}'));
        }
      },
    );

    on<SignInWithFacebook>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final result = await FacebookAuth.instance.login();
          if (result.status == LoginStatus.success) {
            final AuthCredential credential =
                FacebookAuthProvider.credential(result.accessToken!.token);
            UserCredential userCredential =
                await _auth.signInWithCredential(credential);
            FirebaseFirestore.instance
                .collection('users')
                .doc(userCredential.user!.uid)
                .set({
              'uid': userCredential.user!.uid,
              'email': userCredential.user!.email,
              'createdAt': DateTime.now()
            }, SetOptions(merge: true));
            emit(AuthendicatedState(userCredential.user!));
          }
        } catch (e) {
          emit(AuthendicatedError(message: e.toString()));
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
            FirebaseFirestore.instance.collection('users').doc(user.uid).set({
              'uid': user.uid,
              'email': user.email,
              'createdAt': DateTime.now()
            }, SetOptions(merge: true));
            emit(AuthendicatedState(user));
          } else {
            emit(UnAthendicated());
          }
        } catch (e) {
          emit(AuthendicatedError(
              message: 'Google sign-in failed: ${e.toString()}'));
        }
      },
    );
    on<SignUpWithFacebook>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final result = await FacebookAuth.instance.login();
          if (result.status == LoginStatus.success) {
            final AuthCredential credential =
                FacebookAuthProvider.credential(result.accessToken!.token);
            UserCredential userCredential =
                await _auth.signInWithCredential(credential);
            FirebaseFirestore.instance.doc(userCredential.user!.uid).set({
              'uid': userCredential.user!.uid,
              'email': userCredential.user!.email,
              'createdAt': DateTime.now()
            }, SetOptions(merge: true));
            emit(AuthendicatedState(userCredential.user!));
          }
        } catch (e) {
          emit(AuthendicatedError(message: e.toString()));
        }
      },
    );
    on<SignupWithGithub>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final GitHubSignIn gitHubSignIn = GitHubSignIn(
              clientId: "Ov23ligjnk9Qg539ymRo",
              clientSecret: "e196c6b37c7565bc41a5301c574d4b9b93adb169",
              redirectUrl:
                  "https://stylish-3f9c2.firebaseapp.com/__/auth/handler");
          final result = await gitHubSignIn.signIn(event.context!);
          final githubAuthCredential =
              GithubAuthProvider.credential(result.token!);

          final signInWithCredential = await FirebaseAuth.instance
              .signInWithCredential(githubAuthCredential);
          FirebaseFirestore.instance.doc('users').set({
            'uid': signInWithCredential.user!.uid,
            'email': signInWithCredential.user!.email,
            'createdAt': DateTime.now()
          }, SetOptions(merge: true));
          emit(AuthendicatedState(signInWithCredential.user!));
        } catch (e) {
          emit((AuthendicatedError(message: e.toString())));
        }
      },
    );
    on<SigninWithGithub>(
      (event, emit) async {
        emit(AuthLoading());
        try {
          final GitHubSignIn gitHubSignIn = GitHubSignIn(
              clientId: "Ov23ligjnk9Qg539ymRo",
              clientSecret: "e196c6b37c7565bc41a5301c574d4b9b93adb169",
              redirectUrl:
                  "https://stylish-3f9c2.firebaseapp.com/__/auth/handler");
          final result = await gitHubSignIn.signIn(event.context!);
          final githubAuthCredential =
              GithubAuthProvider.credential(result.token!);

          final signInWithCredential = await FirebaseAuth.instance
              .signInWithCredential(githubAuthCredential);
          FirebaseFirestore.instance.doc('users').set({
            'uid': signInWithCredential.user!.uid,
            'email': signInWithCredential.user!.email,
            'createdAt': DateTime.now()
          }, SetOptions(merge: true));
          emit(AuthendicatedState(signInWithCredential.user!));
        } catch (e) {
          emit((AuthendicatedError(message: e.toString())));
        }
      },
    );
  }
}

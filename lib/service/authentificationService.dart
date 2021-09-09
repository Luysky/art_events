import 'package:firebase_auth/firebase_auth.dart';
import '../models/modelUser.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthenticationService();

  ModelUser? _userFromFirebaseUser(User user) {
    if(user == null) return null;
    ModelUser modelUser = ModelUser();
    modelUser.setEmail(_auth.currentUser!.email.toString());
    modelUser.setId(user.uid);
    modelUser.populateFirestore();
    return modelUser;
  }

  Future _populateUserInfoFromCollection(User user) async {
    return null;
  }

  Stream<ModelUser?> get user {
    return _auth.authStateChanges().map((User? user) {
      return _userFromFirebaseUser(user!);
    });
  }

  Future signIn({required String email, required String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      print("AuthenticationService - signIn - returned user uid = " + user!.uid);
      //MyUser? tmp = ;
      //tmp!.setEmail(email);
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print("AuthenticationService - signIn - FireBaseAuthException message = " +e.message.toString());
      return e.message;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

Future signUp({required String email, required String password, required ModelUser modelUser}) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      //MyUser user = MyUser(uid: result.user!.uid);
      modelUser.setId(result.user!.uid);
      print(modelUser);
      await modelUser.save();
      return modelUser;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
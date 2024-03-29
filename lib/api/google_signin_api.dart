// google_signin_api.dart

import 'package:google_sign_in/google_sign_in.dart';
import 'package:piratoon/providers/user_provider.dart';

class GoogleSignInApi {
  static GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<void> login(UserProvider userProvider) async {
    try {
      GoogleSignInAccount? user = await _googleSignIn.signIn();
      if (user != null) {
        GoogleSignInAuthentication googleSignInAuth = await user.authentication;

        // Use googleSignInAuth.idToken as an identifier (it is unique for each user)
        userProvider.setUser(
          isLoggedIn: true,
          id: googleSignInAuth.idToken,
          name: user.displayName ?? "",
        );
      }
    } catch (error) {
      print(error);
    }
  }
}

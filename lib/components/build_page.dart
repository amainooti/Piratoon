import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:piratoon/api/google_signin_api.dart';
import 'package:piratoon/pages/select_avatar_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:piratoon/providers/user_provider.dart';





class PageBuild extends StatefulWidget {
  String title;
  String imageUrl;

  PageBuild({Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  State<PageBuild> createState() => _PageBuildState();
}

class _PageBuildState extends State<PageBuild> {
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // navigation dots and skip button
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Text(
              widget.title,
              style: GoogleFonts.russoOne(color: Colors.white, fontSize: 30),
            ),
          ),
          Image.asset(
            widget.imageUrl,
            height: 290,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                try {
                  UserProvider userProvider = UserProvider();
                  // Call the signIn function which triggers Google Sign-In
                  await signIn(userProvider);

                  // Get the UserProvider instance and check if the user is logged in
                  // UserProvider userProvider =
                  // Provider.of<UserProvider>(context, listen: false);
                  print(userProvider?.user?.name);
                  if (userProvider.user != null) {
                    // Navigate to the Avatar page with the required data
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectAvatarPage(),
                      ),
                    );
                  }else {
                    // Handle the case where the user is not logged in
                    // Redirect or show an error message as needed
                    print("User not logged in");
                  }
                } catch (error) {
                  print(error);
                }
              },
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                child: Center(
                  child: Text(
                    "Continue with email",
                    style: GoogleFonts.russoOne(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Make sure this is an async function
  Future<void> signIn(UserProvider userProvider) async {
    await GoogleSignInApi.login(userProvider);
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:piratoon/api/google_signin_api.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PageBuild extends StatelessWidget {
  String title;
  String imageUrl;

   PageBuild({Key? key, required this.title, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //  navigation dots and skip button
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Text(title,
              style: GoogleFonts.russoOne(
                  color: Colors.white,
                  fontSize: 30
              ),
            ),
          ),
          Image.asset(imageUrl, height: 369,),
          Expanded(child: GestureDetector(
            onTap:  () async {
            GoogleSignInAccount? result = await signIn();
              if (result != null) {
            // Successfully signed in, you can handle the result here
              print("Successfully signed in: ${result.displayName}");
          } else {
                // Failed to sign in, handle the error
                print("Sign in failed");
              }
          },
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              child: Center(
                  child: Text("Continue with email",
                    style: GoogleFonts.russoOne(),
                  )
              ),
            ),
          ))
        ],
      ),
    );
  }
}

Future signIn() async{
  await GoogleSignInApi.login();
}
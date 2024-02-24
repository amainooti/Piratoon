import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
          Image.asset(imageUrl, height: 400,),
          Expanded(child: GestureDetector(
            onTap: (){
              print("google Oauth page");
            },
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              child: Center(child: Text("Continue with email", style: GoogleFonts.russoOne(),)),
            ),
          ))
        ],
      ),
    );
  }
}

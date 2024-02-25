import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class GenrePage extends StatefulWidget {
  const GenrePage({Key? key}) : super(key: key);

  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Text(
        "Pick At Least 5 genre",
        style: GoogleFonts.russoOne(
          color: Colors.white
        ),
      )
    );
  }
}

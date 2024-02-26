import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piratoon/components/genre_tile.dart';
import 'package:piratoon/models/genre_model.dart';
import 'package:piratoon/providers/genre_provider.dart';
import 'package:provider/provider.dart';
import 'package:piratoon/pages/home_page.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({Key? key}) : super(key: key);

  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  List<Interest> _interests = [
    Interest(emoji: "👊🏼", genre: "action"),
    Interest(emoji: "🗻", genre: "adventure"),
    Interest(emoji: "🧒", genre: "children"),
    Interest(emoji: "🤣", genre: "comedy"),
    Interest(emoji: "😫", genre: "drama"),
    Interest(emoji: "🕵🏼", genre: "crime"),
    Interest(emoji: "🧝🏼", genre: "fantasy"),
    Interest(emoji: "🏛️", genre: "historical"),
    Interest(emoji: "👻", genre: "horror"),
    Interest(emoji: "🧙🏼‍♂️", genre: "magic"),
    Interest(emoji: "💓", genre: "romance"),
    Interest(emoji: "👽", genre: "sci-fi"),
    Interest(emoji: "🦸🏼", genre: "superhero"),
    Interest(emoji: "⚔️️", genre: "war"),
    Interest(emoji: "🧟", genre: "zombie"),
  ];

  int maxSelections = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 30),
            child: Text(
              'Pick at least \n5 favourite genres',
              textAlign: TextAlign.center,
              style: GoogleFonts.russoOne(
                fontSize: 26,
              ),
            ),
          ),
          Expanded(
            child: Consumer<GenreProvider>(
              builder: (context, provider, child) {
                return GridView.builder(
                  itemCount: _interests.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.5, // Adjust this ratio as needed
                  ),
                  itemBuilder: (context, index) {
                    final interest = _interests[index];
                    final isSelected = provider.selectedIndices.contains(index);

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              provider.toggleIndex(index);
                            } else {
                              if (provider.selectedIndices.length < maxSelections) {
                                provider.toggleIndex(index);
                              }
                            }
                          });
                        },
                        child: GenreTile(
                          emoji: interest.emoji,
                          title: interest.genre,
                          isSelected: isSelected,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Positioned(
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
            child: ElevatedButton(
              onPressed: () {
                if (Provider.of<GenreProvider>(context, listen: false).selectedIndices.length >= 5) {
                  // At least 5 genres selected, navigate to HomePage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  // Less than 5 genres selected, print a message
                  print("Select at least 5 genres");
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                minimumSize: const Size.fromHeight(80),
              ),
              child: Text(
                "Continue",
                style: GoogleFonts.russoOne(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

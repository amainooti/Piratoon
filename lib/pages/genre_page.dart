import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piratoon/components/genre_tile.dart';
import 'package:piratoon/models/genre_model.dart';

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

  List<int> selectedIndices = [];
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
            child: GridView.builder(
              itemCount: _interests.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 20,
                childAspectRatio: 1.5, // Adjust this ratio as needed
              ),
              itemBuilder: (context, index) {
                final interest = _interests[index];
                final isSelected = selectedIndices.contains(index);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedIndices.remove(index);
                        } else {
                          if (selectedIndices.length < maxSelections) {
                            selectedIndices.add(index);
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
            ),
          ),
          Positioned(
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
            child: ElevatedButton(
              onPressed: () {
                if (selectedIndices.length < 5) {
                  print("Select at least 5 genres");
                } else {
                  final selectedGenres =
                  selectedIndices.map((index) => _interests[index]).toList();

                  // Handle continue button press with selectedGenres
                  print("Continue button pressed with genres: $selectedGenres");
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                minimumSize: const Size.fromHeight(82),
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

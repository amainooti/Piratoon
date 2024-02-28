import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piratoon/components/Brand.dart';
import 'package:piratoon/components/recommended_tile.dart';
import 'package:piratoon/providers/user_provider.dart';
import 'package:provider/provider.dart';


class ComicPage extends StatefulWidget {
  const ComicPage({Key? key}) : super(key: key);

  @override
  State<ComicPage> createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage> {
  TextEditingController _controller = TextEditingController();
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    // Set up a timer to automatically scroll the PageView
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        // Assuming 3 pages (adjust the condition based on the number of pages)
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      } else {
        _pageController.jumpToPage(0); // Go back to the first page
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO: fetch from backend rather than provider i.e also a dead code
                    Text("${userProvider.user?.name},",
                      style: TextStyle(
                      color: Color(0xFF7C8185)
                    ),),
                    Text("Welcombe Back", style: GoogleFonts.russoOne(
                      fontSize: 16
                    ),),
                  ],

                ),
                //TODO:Change Place holder image to Image stored in provider
                CircleAvatar(
                  // below here lies a dead code that is never executed, I'd change it tho when connected to a DB
                  backgroundImage: AssetImage( 'lib/images/${userProvider.user?.selectedImageUrl}' ?? 'lib/images/batman_icon.png'),
                  radius: 40,
                  backgroundColor: Colors.transparent,
                )
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(top:8.0, left: 24, right: 24),
            child: TextField(
              decoration:  InputDecoration(
                hintText: "Search comics, movies, series...",
                filled: true,
                  fillColor: Theme.of(context).colorScheme.tertiary,
                  prefixIcon: Image.asset('lib/images/search_icon.png',width: 18,),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12)
                )
              ),
              controller: _controller,
              onSubmitted: (String value) {
                debugPrint(value);
              },
            ),
          ),
          const SizedBox(height: 20,),

          // TODO: Recommended for you section is going to take the selected genre array and show matching genre
          Padding(
            padding: const EdgeInsets.only(top:8.0, left: 20),
            child: Text("Recommended for you", style: GoogleFonts.russoOne(
              fontSize: 20
            ),),
          ),
          SizedBox(
            height: 147,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                RecommendedTile(recommendText: "Action packed \ncollection"),
                RecommendedTile(recommendText: "Lorem Ipsum \ncollection"),
                RecommendedTile(recommendText: "Lorem Ipsum \ncollection"),
                RecommendedTile(recommendText: "Lorem Ipsum \ncollection"),

              ],
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4, // Number of pages in PageView TODO: refactor to have RecommendedTile in List to get the length here
                  (index) => buildDotIndicator(index),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: Text(
              "Explore brands",
              style: GoogleFonts.russoOne(
                fontSize: 20
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 13, left: 26.0, right: 26.0),
            child: SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Brand(
                    brandTitle: "DC",
                    brandImage: "lib/images/Dc.png",
                  ),
                  SizedBox(width: 20,),
                  Brand(
                    brandTitle: "Marvel",
                    brandImage: "lib/images/marvel.png",
                  ),
                  SizedBox(width: 20,),
                  Brand(
                    brandImage: "lib/images/darkhorse.png",
                    brandTitle: "Dark Horse",
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Newest Releases", style: GoogleFonts.russoOne(
                  fontSize: 20
                )),
                Icon(Icons.arrow_forward)
              ],

            ),
          ),
        ],
      )
    );
  }
  Widget buildDotIndicator(int index) {
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.tertiary
      ),
    );
  }
}

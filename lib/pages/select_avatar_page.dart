import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piratoon/pages/genre_page.dart';
import 'package:piratoon/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SelectAvatarPage extends StatefulWidget {
  SelectAvatarPage({Key? key}) : super(key: key);

  @override
  State<SelectAvatarPage> createState() => _SelectAvatarPageState();
}

class _SelectAvatarPageState extends State<SelectAvatarPage> {
  final List<String> _imageUrl = [
    "aquaman_icon.png",
    "atom_icon.png",
    "atomsmasher_icon.png",
    "batgirl_icon.png",
    "batman_icon.png",
    "batwoman_icon.png",
    "blackadam_icon.png",
    "blackcanary_icon.png",
    "blacklightening_icon.png",
    "bluebeetle_icon.png",
    "catwoman_icon.png",
    "deadstroke_icon.png",
    "flash_icon.png",
    "wonderwoman_icon.png",
    "martialmanhunter_icon.png"
  ];

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    UserProvider _userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 60),
            child: Text(
              "Select your alter ego",
              style: GoogleFonts.russoOne(fontSize: 26),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: _imageUrl.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index; // Update selected index
                    });
                    print("Selected image: ${_imageUrl[index]}");
                  },
                  child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: _selectedIndex == index
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Image.asset(
                        'lib/images/${_imageUrl[index]}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (_selectedIndex == index)
                      Icon(
                        Icons.check_box_rounded,
                        color: Theme.of(context).colorScheme.primary,
                        size: 30.0,
                      ),
                  ],
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
                // Check if an image is selected
                if (_selectedIndex != -1) {
                  // Update the user information in the UserProvider
                  _userProvider.setUser(
                    // Replace with the actual user name
                    isLoggedIn: true,
                    selectedImageUrl: _imageUrl[_selectedIndex],
                  );

                  // Navigate to next page...
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GenrePage(),
                    ),
                  );
                  // Handle button press
                  print("Continue button pressed");
                } else {
                  // Inform the user that they need to select an image
                  print("Please select an image before continuing.");
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)
                ),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                minimumSize: const Size.fromHeight(75),
              ),

              child: Text("Continue",
                style: GoogleFonts.russoOne(
                color: Colors.white,
              ),),
            ),
          ),
        ],
      ),
    );
  }
}

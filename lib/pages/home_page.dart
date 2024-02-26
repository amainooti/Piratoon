import 'package:flutter/material.dart';
import 'package:piratoon/pages/comic_page.dart';
import 'package:piratoon/pages/movie_page.dart';
import 'package:piratoon/pages/party_room.dart';
import 'package:piratoon/pages/shop_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MoviePage(),
    ComicPage(),
    PartyPage(),
    ShopPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _pages,
        onPageChanged: (index) {
          print("Page changed to index: $index");
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.book, color: Colors.white,),
              label: 'Comics'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined, color: Colors.white,),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, color: Colors.white,),
            label: 'Party',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.white,),
            label: 'Shop',
          )
        ],
      ),
    );
  }
}

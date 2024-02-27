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
  late PageController _pageController;

  final List<Widget> _pages = [
    ComicPage(),
    MoviePage(),
    PartyPage(),
    ShopPage(),
  ];

  final List<Color> _colors = [
    Color(0xFFE1F2CD),
    Color(0xFFC9A7F4),
    Color(0xFFEBDB86),
    Color(0xFFCBDFF3),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
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
            _pageController.jumpToPage(index);
          });
        },
        selectedItemColor: _colors[_currentIndex],
        // unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? ColorFiltered(
              colorFilter: ColorFilter.mode(
                _colors[0],
                BlendMode.srcIn,
              ),
              child: Image.asset('lib/images/comic_icon.png'),
            )
                : Image.asset('lib/images/comic_icon.png'),
            label: 'Comics',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? ColorFiltered(
              colorFilter: ColorFilter.mode(
                _colors[1],
                BlendMode.srcIn,
              ),
              child: Image.asset('lib/images/movies_icon.png'),
            )
                : Image.asset('lib/images/movies_icon.png'),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? ColorFiltered(
              colorFilter: ColorFilter.mode(
                _colors[2],
                BlendMode.srcIn,
              ),
              child: Image.asset('lib/images/party_icon.png'),
            )
                : Image.asset('lib/images/party_icon.png'),
            label: 'Party',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? ColorFiltered(
              colorFilter: ColorFilter.mode(
                _colors[3],
                BlendMode.srcIn,
              ),
              child: Image.asset('lib/images/shop_icon.png'),
            )
                : Image.asset('lib/images/shop_icon.png'),
            label: 'Shop',
          ),
        ],
      ),
    );
  }
}

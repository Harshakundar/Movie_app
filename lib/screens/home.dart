import 'package:flutter/material.dart';
import 'package:movie_app/screens/pages/Movies_pages.dart';
import 'package:movie_app/screens/pages/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          Center(
            child: HomePage(),
          ),
          Center(
            child: MoviesPages(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blueGrey,
        onTap: (index) => {
          setState(() {
            _selectedIndex = index;
            pageController.jumpToPage(index);
          })
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies')
        ],
      ),
    );
  }
}

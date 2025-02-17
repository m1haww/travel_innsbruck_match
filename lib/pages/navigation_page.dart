import 'package:flutter/material.dart';
import 'package:travel_innsbruck_match/pages/alfa.dart';
import 'package:travel_innsbruck_match/pages/beta.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const Alfa(), const Beta(), const Alfa()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'images/salut.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: _pages[_selectedIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              backgroundColor: const Color(0xffF2A8A8),
              currentIndex: _selectedIndex,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.assignment_outlined,
                    color: _selectedIndex == 0
                        ? const Color(0xffFF2727)
                        : Colors.white, // Color based on selection
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.play_circle_fill,
                    color: _selectedIndex == 1
                        ? const Color(0xffFF2727)
                        : Colors.white, // Color based on selection
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: _selectedIndex == 2
                        ? const Color(0xffFF2727)
                        : Colors.white, // Color based on selection
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

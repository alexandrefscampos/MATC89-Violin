import 'package:flutter/material.dart';
import 'package:violin/core/colors.dart';
import 'package:violin/pages/profile/profile_page.dart';
import 'package:violin/pages/search/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _actualIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VColors.primary,
      drawer: const Drawer(
        backgroundColor: VColors.primary,
        child: Column(children: []),
      ),
      appBar: AppBar(
        backgroundColor: VColors.primary,
        elevation: 0,
        actions: const [CircleAvatar()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _actualIndex,
        onTap: (value) => setState(() {
          _actualIndex = value;
        }),
        backgroundColor: VColors.primary,
        selectedItemColor: VColors.secondary,
        unselectedItemColor: VColors.white.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: ''),
        ],
      ),
      body: IndexedStack(
        index: _actualIndex,
        children: screenList,
      ),
    );
  }
}

final screenList = [Container(), const SearchPage(), const ProfilePage()];

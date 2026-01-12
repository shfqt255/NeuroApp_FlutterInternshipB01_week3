import 'package:flutter/material.dart';
import 'package:navigation_app/profile_screen.dart';

import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 11. Manage selected index with setState()
  int selectedIndex = 0;

  // 12. Switch between screens based on index
  final List<Widget> screens = [HomeBody(), ProfileScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),

      body: screens[selectedIndex],

      // 10. Create BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.lightBlue, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.lightBlue, size: 30),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.lightBlue, size: 30),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Home Screen', style: TextStyle(fontSize: 22)),

          const SizedBox(height: 20),

          // 5. Implement Navigator.push()
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ProfileScreen(username: 'Shafqat'),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
            ),
            child: Text('Go to Profile (push)'),
          ),

          const SizedBox(height: 10),

          // 8. Use Navigator.pushNamed()
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/settings',
                arguments: 'Reached to Settings Screen',
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
            ),
            child: Text('Go to Settings (pushNamed)'),
          ),
        ],
      ),
    );
  }
}

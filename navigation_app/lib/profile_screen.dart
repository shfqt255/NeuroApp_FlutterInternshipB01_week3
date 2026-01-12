import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String? username;

  // 9. Pass data using constructor
  const ProfileScreen({super.key, this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Profile')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'Profile Screen',
              style: TextStyle(fontSize: 22),
            ),

            const SizedBox(height: 10),

            Text(
              'Username: ${username ?? "No Data"}',
            ),

            const SizedBox(height: 20),

            // 6. Use Navigator.pop()
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
                  style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white
            ),
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// 1. Create new Flutter project 
// 2. Create ProfileCard class extending StatelessWidget

class ProfileCard extends StatelessWidget{
  const ProfileCard({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileCard'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        // 3. Use Container with BoxDecoration 3. Use Container with BoxDecoration 
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
//  4. Add borderRadius and boxShadow            
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 8,
                offset: Offset(0, 4)
              )
            ]
          ),
          // 5. Use Column for vertical layout
          child: Column(
            children: [
              // 6. Add CircleAvatar with NetworkImage
              const CircleAvatar(
                backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/211864992?s=400&u=2a4e96f8eeda7dcc19c68695e3ce1aaeb2912220&v=4'),
              ),
              // 7. Add Text widgets with custom TextStyle
              Text('Shafqat Ullah', style: TextStyle(fontWeight: .bold,),),
              Text('Flutter Developer', style: TextStyle(fontSize: 12),),
              // 10. Implement Padding and SizedBox for spacing
              SizedBox(height: 15,),
              SocialIconsRow()
            ],
          ),
        ),
      ),
    );
  }
}
// 8. Use Row for social media icons
// 9. Add Icon widgets 
// 11. Create separate widget classes for sections 
class SocialIconsRow extends StatelessWidget {
  const SocialIconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        Icon(Icons.facebook, color: Colors.blue),
        Icon(Icons.linked_camera, color: Colors.blueAccent),
        Icon(Icons.alternate_email, color: Colors.lightBlue),
      ],
    );
  }
}
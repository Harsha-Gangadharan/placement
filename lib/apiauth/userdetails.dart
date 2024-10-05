import 'package:flutter/material.dart';
 
 class UserDetailsPage extends StatelessWidget {
   final dynamic user;

  UserDetailsPage({required this.user});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
     
       appBar: AppBar(title: Text('${user['first_name']} ${user['last_name']}')),
       body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
      
          children: [
            Image.network(user['avatar'], height: 100, width: 100),
            SizedBox(height: 16),
            Text('${user['first_name']} ${user['last_name']}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text(user['email'], style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

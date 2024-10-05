import 'package:flutter/material.dart';
import 'package:placement/apimachinetest/provider/userprovider.dart';
import 'package:placement/apimachinetest/userdetails.dart';
import 'package:provider/provider.dart';

class UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (userProvider.users.isEmpty) {
            return Center(
              child: Text('No users found'),
            );
          }

          return ListView.builder(
            itemCount: userProvider.users.length,
            itemBuilder: (context, index) {
              final user = userProvider.users[index];
              return ListTile(
                leading: Image.network(user['avatar']),
                title: Text('${user['first_name']} ${user['last_name']}'),
                subtitle: Text(user['email']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailsPage(user: user),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

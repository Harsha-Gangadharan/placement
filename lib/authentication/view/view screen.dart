import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ViewScreen extends StatefulWidget {
  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  String? _name;
  String? _imageUrl;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    
  }

  Future<void> _fetchUserData() async {
    try {
      // Get the current user ID
      String userId = FirebaseAuth.instance.currentUser!.uid;

      // Fetch the user document from the 'user' collection
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('user')
          .doc(userId)
          .get();

      // Extract the data
      setState(() {
        _name = userDoc['name'];
        _imageUrl = userDoc['imageUrl'];
        _isLoading = false;
      });
    } catch (e) {
      // Handle error
      print('Error fetching user data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('View Person')),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator() // Show loading indicator while fetching data
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    backgroundImage: _imageUrl != null
                        ? NetworkImage(_imageUrl!)
                        : AssetImage('assets/default_user.png')
                            as ImageProvider, // Display fetched image or default image
                  ),
                  SizedBox(height: 20),
                  Text(
                    _name ?? 'Name not found',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
      ),
    );
  }
}

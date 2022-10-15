import 'package:flutter/material.dart';
import 'package:movie_database/utils/text.dart';
import 'package:movie_database/widgets/navbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 0;

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ModifiedText(text: 'Profile'),
      ),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 18.0,
        ),
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Icon(
                    Icons.person_rounded,
                    size: 160.0,
                  ),
                  Text('Mamat',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500])),
                  SizedBox(height: 20.0),
                  ListTile(
                    title: Text('Email'),
                    subtitle: Text('mamat@gmail.com'),
                  ),
                  ListTile(
                    title: Text('Phone'),
                    subtitle: Text('+62-000-0000-000'),
                  ),
                  ListTile(
                    title: Text('Account Type'),
                    subtitle: Text('Premium'),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
      bottomNavigationBar:
          Navbar(onClicked: onClicked, selectedIndex: selectedIndex),
    );
  }
}

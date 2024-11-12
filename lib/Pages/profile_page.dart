import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String uid;

  const ProfilePage({super.key,
  required this.uid
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('P R O F I L E'),
      ),
      body: Center(
        child: Text(
          widget.uid
        ),
      ),
    );
  }
}

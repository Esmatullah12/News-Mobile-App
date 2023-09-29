import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          color: Colors.white,
          child: AppBar(
            title: const Text(
              "My Profile",
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            backgroundColor: Colors.white,
            elevation: 1,
            iconTheme: const IconThemeData(
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'images/profile.jpeg'), // Replace with your profile image
            ),
          ),
          _profileInfo('Username:', 'SilkRoad'),
          _separator(),
          _profileInfo('Name:', 'Esmatullah'),
          _separator(),
          _profileInfo('Email:', 'esmat@gamil.com'),
          _separator(),
          _profileInfo('Phone Number:', '+1 123-456-7890'),
          _separator(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF388E01),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 22)),
              child: const Text(
                "Logout",
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _profileInfo(String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Edit",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _separator() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 0.2,
          ),
        ),
      ),
    );
  }
}

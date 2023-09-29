import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Admin_panel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  List<String> dropdownItems = ['User', 'Admin'];
  late String selectedItem = "User";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          color: Colors.white,
          child: AppBar(
            title: Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 18, color: Color(0xFF388E01)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Color(0xFF388E01)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF388E01),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Color(0xFF388E01)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedItem,
              onChanged: (String? newValue) {
                setState(() {
                  selectedItem = newValue!;
                });
              },
              items:
                  dropdownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    padding: EdgeInsets.all(10.0), // Adjust padding as needed
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ),
                );
              }).toList(),
              style: TextStyle(fontSize: 16.0, color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.blue, // Add your preferred underline color here
              ),
              isExpanded:
                  true, // Ensures the dropdown expands to fit its contents
            ),
            SizedBox(height: 20),
            ElevatedButton(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF388E01),
                  // Set the text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 24.0), // Set button padding
                ),
                onPressed: () async {

                    try {
                      print(selectedItem);
                      print(email);
                      print(password);
                      if(selectedItem == "User"){
                        _auth.signInWithEmailAndPassword(email: email, password: password).then((value) {Navigator.pushNamed(context, "/home");});
                      }else if(selectedItem == "Admin" && email == "admin12@gmail.com" && password == "admin12"){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AdminDashboard()),
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
                }),
          ],
        ),
      ),
    );
  }
}

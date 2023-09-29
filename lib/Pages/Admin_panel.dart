import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/Widgets/news_data.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  String newsTitle = "";
  String newsText = "";
  String newsCategory = "";
  String predictCategory = "";
  DateTime date = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  NewsData newsData = NewsData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('News Form'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'News Title'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter news title';
                    }
                    return null;
                  },
                  onSaved: (value) => newsData.newsTitle = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'News Text'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter news text';
                    }
                    return null;
                  },
                  onSaved: (value) => newsData.newsText = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'News Category'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter news category';
                    }
                    return null;
                  },
                  onSaved: (value) => newsData.setNewsCategory = value!,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: (){
                    print("submit");
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

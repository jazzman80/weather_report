import 'package:flutter/material.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select city'),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.location_city),
            hintText: 'Enter city name',
          ),
          onEditingComplete: () {},
        ),
      ),
    );
  }
}

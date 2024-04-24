import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';

class RehabCenterRegistrationScreen extends StatefulWidget {
  @override
  _RehabCenterRegistrationScreenState createState() => _RehabCenterRegistrationScreenState();
}

class _RehabCenterRegistrationScreenState extends State<RehabCenterRegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final TextEditingController _numDoctorsController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  void _registerCenter() async {
    try {
      // Convert address to latitude and longitude
      List<Location> locations = await locationFromAddress(_addressController.text);
      if (locations.isNotEmpty) {
        // Save center details to Firestore
        await _firestore.collection('rehab_centers').add({
          // 'email': _emailController.text,
          // 'password': _passwordController.text,
          'name': _nameController.text,
          'address': _addressController.text,
          'latitude': locations[0].latitude,
          'longitude': locations[0].longitude,
          'capacity': int.tryParse(_capacityController.text) ?? 0,
          'num_doctors': int.tryParse(_numDoctorsController.text) ?? 0,
          'rating': double.tryParse(_ratingController.text) ?? 0.0,
        });

        // Show success message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Rehab center registered successfully'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Registration failed
      print('Failed to register rehab center: $e');
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to register rehab center: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Rehab Center'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // TextFormField(
            //   controller: _nameController,
            //   decoration: InputDecoration(labelText: 'Email'),
            // ),
            // TextFormField(
            //   controller: _nameController,
            //   decoration: InputDecoration(labelText: 'Set Password'),
            // ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
               ),

            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 10),

            TextFormField(
              controller: _capacityController,
              decoration: InputDecoration(labelText: 'Capacity',
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),

            TextFormField(
              controller: _numDoctorsController,
              decoration: InputDecoration(labelText: 'Number of Doctors',
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),

            TextFormField(
              controller: _ratingController,
              decoration: InputDecoration(labelText: 'Rating',
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 10),


        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _registerCenter,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[900],
            minimumSize: Size(320, 50),
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text('Register Center',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)
          ),
        )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RehabCenterRegistrationScreen(),
  ));
}

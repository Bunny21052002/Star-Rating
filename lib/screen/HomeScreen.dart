import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:star_rating/constants/Constants.dart';

import 'starScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController myController = TextEditingController();
  late double rating;
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Star Rating"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Enter the Value",
              style: font1,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: myController,
                decoration: InputDecoration(
                  hintText: "Enter the rating",
                  hintStyle: font2,
                  fillColor: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {

                rating = double.parse(myController.text);
                if (rating <= 5 && rating>=0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => starScreen(
                        size: size,
                        rating: rating,
                      ),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                        content: Text("Enter correct value!!"),
                      );
                    },
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                color: Colors.pink[100],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Stars",
                    style: font1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

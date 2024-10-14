import 'package:flutter/material.dart';

void main() {
  runApp(GradeCalculatorApp());
}

class GradeCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grade Calculator',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _scoreController = TextEditingController();
  String result = '';

  // Function to calculate the grade
  void calculateGrade(String scoreInput) {
    // Remove '%' if it's included in the input
    scoreInput = scoreInput.replaceAll('%', '').trim();
    double score = double.tryParse(scoreInput) ?? 0; // the quick fix did it

    if (score >= 90) {
      // to calculate the cal
      result = 'A';
    } else if (score >= 80) {
      result = 'B';
    } else if (score >= 70) {
      result = 'C';
    } else if (score >= 60) {
      result = 'D';
    } else {
      result = 'F';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background
      appBar: AppBar(
        title: Text(
          'Grade calculator',
          style: TextStyle(
            color: Colors.white, // White font
            fontWeight: FontWeight.bold, // Bold font
          ),
        ),
        backgroundColor: Colors.pinkAccent, // Pink AppBar
        toolbarHeight: 80, // Increase AppBar height
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Vertically center the column content
          crossAxisAlignment: CrossAxisAlignment
              .center, // Horizontally center the content to be in the center
          children: [
            // TextField with % inside and medium width
            SizedBox(
                height:
                    20), // Add some space from the app bar to the input field

            // TextField with only % icon in pink and smaller width
            SizedBox(
              width: 200, // Small width for the input field
              child: TextField(
                controller: _scoreController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.percent,
                      color: Colors.pinkAccent), // Pink percentage icon
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded border
                  ),
                  labelText: 'Type your score',
                  labelStyle:
                      TextStyle(color: Colors.grey), // Neutral label color
                ),
                style: TextStyle(
                    fontSize: 18, color: Colors.black), // Black text input
              ),
            ),
            SizedBox(height: 10),

            // Pink button with smaller width and rounded corners
            SizedBox(
              width: 150, // Button width
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    String scoreInput = _scoreController.text;

                    if (scoreInput.isNotEmpty && !scoreInput.endsWith('%')) {
                      scoreInput += '%';
                    } // checks whether the input string in this case, scoreInput
                    calculateGrade(scoreInput);
                  });
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Making the font bold
                    color: Colors.white, // Text color
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 245, 8, 87), // Pink button background
                  padding: EdgeInsets.symmetric(
                      vertical:
                          20.0), // Increase vertical padding for larger button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded button
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Result text
            Text(
              result.isEmpty
                  ? ''
                  : result, // Check if result is empty instead of using if statement
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent, // Pink font result
              ),
            ),
          ],
        ),
      ),
    );
  }
}

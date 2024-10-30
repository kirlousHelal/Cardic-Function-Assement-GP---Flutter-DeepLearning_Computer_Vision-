import 'package:flutter/material.dart';

import 'api_result.dart';
import 'final_result_screen.dart';

class ResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.1, // Dynamic toolbar height
        leading: const SizedBox.shrink(),
        title: const Center(
          child: Text(
            'Results',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24, // Adjusted font size for better scaling
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: const [
          Icon(
            Icons.more_vert_rounded,
            color: Colors.white,
          ),
          SizedBox(width: 15),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "TRANSFORMER",
              style: TextStyle(
                fontSize: 24, // Adjusted font size for scaling
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.4,
                      child: APIResult.imageES_Transfomrer,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Expanded(
                    child: Container(
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.4,
                      child: APIResult.imageED_Transfomrer,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "ES Frame",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    "ED Frame",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            const Text(
              "U-NET",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.4,
                      child: APIResult.imageES_UNet,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Expanded(
                    child: Container(
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.4,
                      child: APIResult.imageED_UNet,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "ES Frame",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    "ED Frame",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            Align(
              alignment: Alignment.bottomRight,
              child: MaterialButton(
                minWidth: screenWidth * 0.4,
                height: screenHeight * 0.07,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return FinalResultsScreen();
                    },
                  ));
                },
                color: Colors.blueAccent,
                child: Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.06, // Responsive font size
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

import 'package:cardic_function_assement_2/login_screen.dart';
import 'package:cardic_function_assement_2/video_upload_screen.dart';
import 'package:flutter/material.dart';

import 'api_result.dart';

class FinalResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get the height and width
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.1, // Adaptive height for AppBar
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Center(
          child: Text(
            'Results CON.',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24, // Reduced size for better scaling
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.08),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueAccent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildResultRow(
                        "ESV:", "${APIResult.value_ESV}", screenWidth),
                    SizedBox(height: screenHeight * 0.03),
                    buildResultRow(
                        "EDV:", "${APIResult.value_EDV}", screenWidth),
                    SizedBox(height: screenHeight * 0.03),
                    buildResultRow(
                        "EF%:", "${APIResult.value_EF}", screenWidth),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Text(
                50 < (APIResult?.value_EF ?? 60) &&
                        (APIResult?.value_EF ?? 60) < 70
                    ? "Normal..🥳"
                    : "AbNormal..😔",
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.w900,
                  color: 50 < (APIResult?.value_EF ?? 60) &&
                          (APIResult?.value_EF ?? 60) < 70
                      ? Colors.green
                      : Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            buildButton(
              context,
              label: "Analyze Another Echo",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoUploadScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: screenHeight * 0.03),
            buildButton(
              context,
              label: "Log Out",
              fontSize: screenWidth * 0.06,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create the rows displaying results
  Widget buildResultRow(String label, String value, double screenWidth) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: screenWidth * 0.08, // Responsive font size
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: screenWidth * 0.08,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  // Helper method to create buttons with responsive design
  Widget buildButton(
    BuildContext context, {
    required String label,
    required VoidCallback onPressed,
    double fontSize = 20,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        minWidth: double.infinity,
        height: screenHeight * 0.07,
        onPressed: onPressed,
        color: Colors.blueAccent,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

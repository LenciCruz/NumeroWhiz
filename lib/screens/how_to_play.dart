import 'package:flutter/material.dart';

void main() {
  runApp(howToPlay());
}

class howToPlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How to Play'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Header
            Text(
              'Title Header',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Paragraph for Title Header
            Text(
              'This is the paragraph for the title header. Add your content here.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            // Sub-header 1
            Text(
              'Game 1: Higher Lower',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Paragraph for Sub-header 1
            Text(
              'This is the paragraph for sub-header 1. Add your content here.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            // Sub-header 2
            Text(
              'Game 2: Numberdle',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Paragraph for Sub-header 2
            Text(
              'This is the paragraph for sub-header 2. Add your content here.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            // Sub-header 3
            Text(
              'Game 3: Peek-a-Digit',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Paragraph for Sub-header 3
            Text(
              'This is the paragraph for sub-header 3. Add your content here.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

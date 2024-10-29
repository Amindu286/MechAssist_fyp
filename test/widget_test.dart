import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mech_assist/main.dart'; // Ensure you have the correct import for your main app
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  // Test 2: Chatbot interaction test
  testWidgets('Chatbot interaction test', (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Simulate tapping a button/icon to navigate to the chatbot page
    await tester.tap(find.byIcon(Icons
        .chat)); // Adjust this to the actual button that navigates to page_b
    await tester.pumpAndSettle(); // Wait for navigation

    // Verify the chatbot page is displayed
    expect(find.text('Chatbot'), findsOneWidget);

    // Enter a query in the chatbot's input field
    await tester.enterText(find.byType(TextField), 'Hello');
    await tester.tap(find.byIcon(Icons.send)); // Assuming you have a send icon
    await tester.pump();

    // Verify the chatbot responded
    expect(find.text('Hello'), findsOneWidget); // User input
    expect(find.text('Welcome to MechAssist! How can I help you?'),
        findsOneWidget); // Example response
  });

  // Test 3: Map page test
  testWidgets('Map page test', (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Simulate tapping a button/icon to navigate to the maps page
    await tester.tap(find.byIcon(Icons
        .map)); // Adjust this to the actual button that navigates to page_c
    await tester.pumpAndSettle(); // Wait for navigation

    // Verify the map page is displayed
    expect(find.text('Nearby Garages'), findsOneWidget);

    // Check if the map widget exists (assuming you use GoogleMap)
    expect(find.byType(GoogleMap), findsOneWidget);
  });

  // Test 4: FAQ cards display test
  testWidgets('FAQ cards display test', (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Simulate tapping a button/icon to navigate to the FAQ page
    await tester.tap(find.byIcon(Icons
        .info)); // Adjust this to the actual button that navigates to page_a
    await tester.pumpAndSettle(); // Wait for navigation

    // Verify that the FAQ page is displayed
    expect(find.text('FAQ'), findsOneWidget);

    // Verify that at least one FAQ card is present
    expect(find.byType(Card),
        findsWidgets); // Assuming you're using `Card` for FAQ entries

    // Optionally, you can interact with the FAQ card (e.g., tapping to expand/collapse)
    await tester.tap(find.text('What is MechAssist?')); // Example FAQ question
    await tester.pump();

    // Verify the answer is shown
    expect(find.text('MechAssist is a vehicle maintenance assistant.'),
        findsOneWidget); // Example answer
  });
}

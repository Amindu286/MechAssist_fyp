import 'package:flutter/material.dart';

class PageAScreen extends StatelessWidget {
  PageAScreen({super.key});

final List<Map<String, dynamic>> problems = [
    {
      'title': 'Flat Tire',
      'steps': [
        'Find a safe location to park.',
        'Loosen the lug nuts using a tire iron.',
        'Use a jack to lift the vehicle.',
        'Remove the flat tire and replace it with the spare tire.',
        'Tighten the lug nuts and lower the vehicle.',
        'Check tire pressure before driving.'
      ],
      'image': 'assets/images/flat_tire.png',
    },
    {
      'title': 'Dead Battery',
      'steps': [
        'Find jumper cables and a working car.',
        'Connect the red jumper cable to the positive terminal of both batteries.',
        'Connect the black cable to the negative terminal on the working battery.',
        'Attach the other black cable to an unpainted metal surface on your car.',
        'Start the working car and then your car.',
        'Remove cables in reverse order.'
      ],
      'image': 'assets/images/flat_tire.png',
    },
    {
      'title': 'Overheating Engine',
      'steps': [
        'Pull over and turn off the engine.',
        'Let the engine cool for at least 30 minutes.',
        'Check the coolant level in the radiator.',
        'Add coolant if necessary.',
        'Restart the car and monitor the temperature.'
      ],
      'image': 'assets/images/flat_tire.png',
    },
    {
      'title': 'Brake Squeaking',
      'steps': [
        'Inspect brake pads for wear.',
        'Clean brake components.',
        'Apply anti-squeal lubricant to the brake pads.',
        'Replace rotors if necessary.'
      ],
      'image': 'assets/images/flat_tire.png',
    },
    {
      'title': 'Engine Oil Change',
      'steps': [
        'Warm up the engine and park the car.',
        'Lift the car and locate the oil drain plug.',
        'Drain the old oil and replace the filter.',
        'Add new oil and check the dipstick.'
      ],
      'image': 'assets/images/flat_tire.png',
    },
    {
      'title': 'Headlight Bulb Replacement',
      'steps': [
        'Open the hood and locate the headlight assembly.',
        'Remove the old bulb by twisting it counterclockwise.',
        'Install the new bulb and secure the electrical connector.',
        'Test the headlights.'
      ],
      'image': 'assets/images/flat_tire.png',
    },
    {
      'title': 'Air Filter Replacement',
      'steps': [
        'Open the hood and locate the air filter box.',
        'Remove the old air filter and insert the new one.',
        'Secure the air filter box and close the hood.'
      ],
      'image': 'assets/images/flat_tire.png',
    },
    {
      'title': 'Car Won\'t Start',
      'steps': [
        'Check the battery terminals for corrosion.',
        'Ensure the car is in park or neutral.',
        'Check the fuel level.',
        'Try jump-starting the car if necessary.'
      ],
      'image': 'assets/images/flat_tire.png',
    },
    {
      'title': 'Windshield Wiper Replacement',
      'steps': [
        'Lift the wiper arm away from the windshield.',
        'Remove the old wiper blade by pressing the tab and sliding it off.',
        'Attach the new wiper blade and test it.'
      ],
      'image': 'assets/images/flat_tire.png',
    },
    {
      'title': 'Low Tire Pressure',
      'steps': [
        'Check tire pressure with a gauge.',
        'Inflate the tires to the recommended PSI.',
        'Monitor the pressure regularly.'
      ],
      'image': 'assets/images/flat_tire.png',
    },
    {
      'title': 'Check Engine Light',
      'steps': [
        'Use an OBD-II scanner to retrieve the error code.',
        'Look up the code and determine the issue.',
        'Take the car to a mechanic for further diagnosis if needed.'
      ],
      'image': 'assets/images/flat_tire.png',
    },
    {
      'title': 'Broken Side Mirror',
      'steps': [
        'Remove the broken side mirror.',
        'Install the new side mirror and ensure it is secure.',
        'Test the mirror if it is powered.'
      ],
      'image': 'assets/images/flat_tire.png',
    },
    {
      'title': 'Car Pulling to One Side',
      'steps': [
        'Check tire pressure for all tires.',
        'Inspect for uneven tire wear.',
        'Get a wheel alignment if necessary.'
      ],
      'image': 'assets/images/flat_tire.png',
    },
    {
      'title': 'Exhaust Smoke',
      'steps': [
        'Identify the color of the exhaust smoke (blue, black, white).',
        'Determine if the issue is oil, fuel, or coolant-related.',
        'Take the car to a mechanic for further diagnosis.'
      ],
      'image': 'assets/images/flat_tire.png',
    },
    {
      'title': 'Car Not Shifting Properly',
      'steps': [
        'Check transmission fluid level.',
        'Add fluid if necessary.',
        'Inspect for transmission leaks.',
        'Take the car to a mechanic if the issue persists.'
      ],
      'image': 'assets/images/flat_tire.png',
    },
  ];

  void _showProblemDialog(BuildContext context, String title, List<String> steps) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: steps.map((step) => Text('• $step')).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: problems.length,
        itemBuilder: (context, index) {
          final problem = problems[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(problem['title']),
              onTap: () {
                _showProblemDialog(context, problem['title'], List<String>.from(problem['steps']));
              },
            ),
          );
        },
      ),
    );
  }
}

// Similar for PageBScreen, PageCScreen, PageDScreen with appropriate changes

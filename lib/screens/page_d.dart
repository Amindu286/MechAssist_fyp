import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PageDScreen extends StatefulWidget {
  const PageDScreen({super.key});

  @override
  State<PageDScreen> createState() => _SettingsPage2State();
}

class _SettingsPage2State extends State<PageDScreen> {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Settings",
            style: TextStyle(color: Colors.black), // Set text color here
          ),
          backgroundColor: Colors.white, // Set background color here
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView(
              children: [
                _SingleSection(
                  title: "General",
                  children: [
                    _CustomListTile(
                        title: "Dark Mode",
                        icon: Icons.dark_mode_outlined,
                        trailing: Switch(
                            value: _isDark,
                            onChanged: (value) {
                              setState(() {
                                _isDark = value;
                              });
                            })),
                    const _CustomListTile(
                        title: "Notifications",
                        icon: Icons.notifications_none_rounded),
                    const _CustomListTile(
                        title: "Emergency Contact",
                        icon: Icons.person_outline_rounded),
                  ],
                ),
                const Divider(),
                _SingleSection(
                  children: [
                    _CustomListTile(
                      title: "Help & Feedback",
                      icon: Icons.help_outline_rounded,
                      onTap: () async {
                        const url =
                            'https://www.linkedin.com/in/amindu-weerawardhana-8a2993241/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    ),
                    _CustomListTile(
                      title: "About",
                      icon: Icons.info_outline_rounded,
                      onTap: () {
                        showAboutModal(context); // Call the modal function
                      },
                    ),
                    _CustomListTile(
                      title: "Exit",
                      icon: Icons.exit_to_app_rounded,
                      onTap: () {
                        showExitConfirmation(
                            context); // Call the exit confirmation function
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Custom ListTile Widget with onTap functionality
class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _CustomListTile({
    super.key,
    required this.title,
    required this.icon,
    this.trailing,
    this.onTap, // Add the onTap parameter
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing,
      onTap: onTap, // Ensure the onTap functionality is defined here
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const _SingleSection({
    super.key,
    this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: children,
        ),
      ],
    );
  }
}

// About Modal
void showAboutModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('About MechAssist'),
        content: const Text(
          'MechAssist is your trusted companion for vehicle maintenance and support. '
          'Get expert advice, step-by-step guides, and personalized recommendations.',
        ),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the modal
            },
          ),
        ],
      );
    },
  );
}

// Exit Confirmation Modal
void showExitConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Exit Confirmation'),
        content: const Text('Are you sure you want to exit?'),
        actions: [
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop(); // Stay in the app
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the modal
              Navigator.of(context)
                  .maybePop(); // Optionally, exit the current screen
            },
          ),
        ],
      );
    },
  );
}

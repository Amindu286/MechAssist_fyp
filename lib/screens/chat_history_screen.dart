import 'package:flutter/material.dart';

class ChatHistoryScreen extends StatelessWidget {
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat History'),
      ),
      body: ListView.builder(
        itemCount: chatHistory.length,
        itemBuilder: (context, index) {
          final chat = chatHistory[index];
          return ListTile(
            title: Text(chat['title']!),
            subtitle: Text(chat['subtitle']!),
            onTap: () {
              // Navigate to detailed chat history if needed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailScreen(chat: chat),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Example chat history data
final List<Map<String, String>> chatHistory = [
  {'title': 'Chat with MechAssist', 'subtitle': '12/09/2024 3:45 PM'},
  {'title': 'Engine Issue Reported', 'subtitle': '11/09/2024 1:30 PM'},
  {'title': 'Brake Maintenance Help', 'subtitle': '10/09/2024 5:00 PM'},
  // Add more chat history entries as needed
];

class ChatDetailScreen extends StatelessWidget {
  final Map<String, String> chat;

  const ChatDetailScreen({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chat['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Details for: ${chat['title']} \n\n${chat['subtitle']}'),
      ),
    );
  }
}

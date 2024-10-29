import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PageBScreen extends StatefulWidget {
  const PageBScreen({super.key});

  @override
  _PageBScreenState createState() => _PageBScreenState();
}

class _PageBScreenState extends State<PageBScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = []; // Store messages here
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false; // Add loading state

  // Send message to the chatbot API
  Future<void> _sendMessage() async {
    final message = _controller.text.trim();
    if (message.isEmpty) return; 

    setState(() {
      _messages.add({"text": message, "isUser": true}); 
      _isLoading = true; 
    });
    _controller.clear();

    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);

    final url = Uri.parse('http://192.168.8.152:8001/generate/');  

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"input_text": message}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);  
        
        if (data.containsKey('generated_text')) {
          setState(() {
            _messages.add({"text": data['generated_text'], "isUser": false}); 
            _isLoading = false; 
          });
        } else {
          setState(() {
            _messages.add({"text": "Error: Key 'generated_text' not found", "isUser": false});
            _isLoading = false; 
          });
        }
      } else {
        setState(() {
          _messages.add({"text": "Error: ${response.statusCode}", "isUser": false});
          _isLoading = false; 
        });
      }
    } catch (e) {
      setState(() {
        _messages.add({"text": "Failed to connect to chatbot: $e", "isUser": false});
        _isLoading = false; // Stop loading
      });
    }

    // Scroll to the bottom after receiving the response
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);

    // Save messages to cache
    _saveMessagesToCache();
  }

  // Save messages to shared preferences (cache)
  Future<void> _saveMessagesToCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('chatMessages', jsonEncode(_messages));
  }

  // Load messages from cache
  Future<void> _loadMessagesFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cachedMessages = prefs.getString('chatMessages');
    if (cachedMessages != null) {
      setState(() {
        _messages = List<Map<String, dynamic>>.from(jsonDecode(cachedMessages));
      });
    }
  }

  // Clear cache when the app is exited
  Future<void> _clearCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('chatMessages');
  }

  // Clear chat history
  Future<void> _clearChat() async {
    setState(() {
      _messages.clear();  // Clear current messages in the UI
    });
    await _clearCache();  // Clear cached messages
  }

  @override
  void initState() {
    super.initState();
    _loadMessagesFromCache();
  }

  @override
  void dispose() {
    _clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),  // Add a refresh button
            onPressed: _clearChat,  // Clear chat when the button is pressed
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message['isUser'];
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[200] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message['text'],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),  // Loader displayed while waiting for the response
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,  // Send message to the chatbot
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}

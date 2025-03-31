import 'package:flutter/material.dart';
import 'package:brainboot/main.dart';
import 'package:brainboot/screens/community_screen.dart';

class BrainBotScreen extends StatefulWidget {
  const BrainBotScreen({super.key});

  @override
  _BrainBotScreenState createState() => _BrainBotScreenState();
}

class _BrainBotScreenState extends State<BrainBotScreen> {
  final TextEditingController _messageController = TextEditingController();
  bool _isRecording = false;
  String _selectedLanguage = 'English';
  bool _isVideoMode = false;
  List<Map<String, dynamic>> _chatHistory = [];

  void _handleMessage(String message) {
    setState(() {
      _chatHistory.add({
        'isBot': false,
        'message': message,
        'timestamp': DateTime.now(),
      });

      // Simulate bot response
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _chatHistory.add({
            'isBot': true,
            'message': 'I understand you\'re saying: $message',
            'sentiment': _analyzeSentiment(message),
            'timestamp': DateTime.now(),
          });
        });
      });
    });
  }

  String _analyzeSentiment(String message) {
    // Simple sentiment analysis simulation
    if (message.toLowerCase().contains(RegExp(r'happy|great|good|excellent'))) {
      return 'positive';
    } else if (message.toLowerCase().contains(
      RegExp(r'sad|bad|awful|terrible'),
    )) {
      return 'negative';
    }
    return 'neutral';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BrainBot',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            icon: Icon(_isVideoMode ? Icons.videocam : Icons.videocam_off),
            onPressed: () => setState(() => _isVideoMode = !_isVideoMode),
            tooltip: 'Toggle video mode',
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.language),
            tooltip: 'Select language',
            onSelected: (String value) {
              setState(() => _selectedLanguage = value);
            },
            itemBuilder: (BuildContext context) {
              return [
                'English',
                'Spanish',
                'French',
                'German',
                'Hindi',
                'Chinese',
              ].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (_isVideoMode)
            Container(
              height: 200,
              color: Colors.grey[900],
              child: Center(
                child: Icon(Icons.video_call, size: 50, color: Colors.white),
              ),
            ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: _chatHistory.length,
                itemBuilder: (context, index) {
                  final chat = _chatHistory[index];
                  return chat['isBot']
                      ? _buildBotMessage(
                        chat['message'],
                        sentiment: chat['sentiment'],
                      )
                      : _buildUserMessage(chat['message']);
                },
              ),
            ),
          ),
          _buildInputSection(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text('Background Mode'),
                  content: Text(
                    'BrainBot will continue running in the background',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'BrainBot is now running in background',
                            ),
                          ),
                        );
                      },
                      child: Text('Enable'),
                    ),
                  ],
                ),
          );
        },
        child: Icon(Icons.headphones),
        tooltip: 'Enable background mode',
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'BrainBot'),
        ],
        currentIndex: 2,
        onTap: (index) {
          if (index != 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        index == 0 ? const HomePage() : const CommunityScreen(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildInputSection() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 4,
              color: Colors.black12,
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(_isRecording ? Icons.stop : Icons.mic),
              onPressed: () {
                setState(() => _isRecording = !_isRecording);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      _isRecording ? 'Recording started' : 'Recording stopped',
                    ),
                  ),
                );
              },
              tooltip: 'Voice input',
            ),
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                if (_messageController.text.isNotEmpty) {
                  _handleMessage(_messageController.text);
                  _messageController.clear();
                }
              },
              tooltip: 'Send message',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBotMessage(String message, {String sentiment = 'neutral'}) {
    IconData sentimentIcon =
        {
          'positive': Icons.sentiment_satisfied,
          'negative': Icons.sentiment_dissatisfied,
          'neutral': Icons.sentiment_neutral,
        }[sentiment]!;

    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Card(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                sentimentIcon,
                size: 20,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserMessage(String message) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8, left: 40),
      child: Card(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Text(message, style: Theme.of(context).textTheme.bodyLarge),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(String title, IconData icon) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Opening $title feature')));
        },
      ),
    );
  }
}

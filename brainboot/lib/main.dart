import 'package:flutter/material.dart';
import 'screens/community_screen.dart';
import 'screens/brain_bot_screen.dart';

void main() {
  runApp(const BrainBootApp());
}

class BrainBootApp extends StatelessWidget {
  const BrainBootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BrainBoot',
      theme: ThemeData(
        primaryColor: Color(0xFF5B4DA7),
        scaffoldBackgroundColor: Color(0xFFF5F3FF),
        colorScheme: ColorScheme.light(
          primary: Color(0xFF5B4DA7),
          secondary: Color(0xFF9C27B0),
          surface: Color(0xFFF5F3FF),
          tertiary: Color(0xFF2E7D32),
          error: Color(0xFFD32F2F),
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            height: 1.3,
            letterSpacing: -0.5,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            height: 1.3,
          ),
          bodyLarge: TextStyle(fontSize: 16, height: 1.5, letterSpacing: 0.15),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF5B4DA7),
          unselectedItemColor: Colors.grey[600],
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        ),
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _handleMoodSelection(BuildContext context, String mood) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('You are feeling $mood')));
  }

  void _handleQuickAction(BuildContext context, String action) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Opening $action')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BrainBoot',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          IconButton(icon: Icon(Icons.person), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWelcomeSection(context),
              SizedBox(height: 20),
              _buildQuickActions(context),
              SizedBox(height: 20),
              _buildUpcomingSection(context),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: Text('SOS Activated'),
                  content: Text(
                    'Emergency contacts will be notified. Do you want to proceed?',
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
                            content: Text('Emergency contacts notified'),
                          ),
                        );
                      },
                      child: Text('Confirm'),
                    ),
                  ],
                ),
          );
        },
        label: Text('SOS'),
        icon: Icon(Icons.emergency),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'BrainBot'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Schedule',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Navigating to ${['Home', 'BrainBot', 'Schedule'][index]}',
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back, Alex',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 8),
            Text(
              'How are you feeling today?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMoodButton(context, '😊', 'Great'),
                _buildMoodButton(context, '😐', 'Okay'),
                _buildMoodButton(context, '😔', 'Low'),
                _buildMoodButton(context, '😰', 'Anxious'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            _buildActionCard(context, 'Therapy\nSessions', Icons.psychology),
            _buildActionCard(context, 'Medication\nTracker', Icons.medication),
            _buildActionCard(context, 'Learn\n& Grow', Icons.school),
            _buildActionCard(context, 'Job\nSearch', Icons.work),
          ],
        ),
      ],
    );
  }

  Widget _buildUpcomingSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Schedule',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 16),
            _buildScheduleItem(context, '10:00 AM', 'Therapy Session'),
            _buildScheduleItem(context, '02:00 PM', 'Job Interview'),
            _buildScheduleItem(context, '05:00 PM', 'Medication Reminder'),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodButton(BuildContext context, String emoji, String label) {
    return Column(
      children: [
        TextButton(
          onPressed: () => _handleMoodSelection(context, label),
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(12),
            shape: CircleBorder(),
          ),
          child: Text(emoji, style: TextStyle(fontSize: 32)),
        ),
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }

  Widget _buildActionCard(BuildContext context, String title, IconData icon) {
    return Card(
      child: InkWell(
        onTap: () => _handleQuickAction(context, title.replaceAll('\n', ' ')),
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Theme.of(context).primaryColor),
              SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleItem(
    BuildContext context,
    String time,
    String activity,
  ) {
    return InkWell(
      onTap: () => _handleQuickAction(context, '$time - $activity'),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Text(time, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 16),
            Text(activity),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' show lerpDouble;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  bool _isDarkMode = false;
  double _fontSize = 1.0;

  // Add screen widgets
  final List<Widget> _screens = [
    const HomeScreen(),
    const CommunityScreen(),
    const ScheduleScreen(),
    const BrainBotScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BrainBoot',
      theme: ThemeData(
        primaryColor: const Color(0xFF7C4DFF),
        scaffoldBackgroundColor:
            _isDarkMode ? const Color(0xFF1A1A1A) : const Color(0xFFF8F9FA),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadowColor: Colors.black.withOpacity(0.1),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: _isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
          foregroundColor: _isDarkMode ? Colors.white : Colors.black,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 8,
          backgroundColor: _isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
          selectedItemColor: const Color(0xFF7C4DFF),
          unselectedItemColor: Colors.grey,
        ),
        colorScheme:
            _isDarkMode
                ? const ColorScheme.dark(
                  primary: Color(0xFF7C4DFF),
                  secondary: Color(0xFF64B5F6),
                  surface: Color(0xFF2A2A2A),
                  background: Color(0xFF1A1A1A),
                )
                : const ColorScheme.light(
                  primary: Color(0xFF7C4DFF),
                  secondary: Color(0xFF64B5F6),
                  surface: Colors.white,
                  background: Color(0xFFF8F9FA),
                ),
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Inter',
          fontSizeFactor: _fontSize,
          bodyColor: _isDarkMode ? Colors.white : Colors.black,
          displayColor: _isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BrainBoot'),
          actions: [
            IconButton(
              icon: const Icon(Icons.sos),
              onPressed: () => _handleSOS(),
            ),
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () => _toggleTheme(),
            ),
            IconButton(icon: const Icon(Icons.person), onPressed: () {}),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF7C4DFF)),
                child: Text(
                  'BrainBoot Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.assessment),
                title: const Text('Progress'),
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProgressScreen(),
                      ),
                    ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Schedule'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Support'),
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SupportScreen(),
                      ),
                    ),
              ),
              ListTile(
                leading: const Icon(Icons.accessibility_new),
                title: const Text('Accessibility'),
                onTap: () => _showAccessibilitySettings(),
              ),
              ListTile(
                leading: const Icon(Icons.medication),
                title: const Text('Medication Tracker'),
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MedicationTrackerScreen(),
                      ),
                    ),
              ),
              ListTile(
                leading: const Icon(Icons.work),
                title: const Text('Job Listings'),
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JobListingsScreen(),
                      ),
                    ),
              ),
              ListTile(
                leading: const Icon(Icons.school),
                title: const Text('Educational Resources'),
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => const EducationalResourcesScreen(),
                      ),
                    ),
              ),
              ListTile(
                leading: const Icon(Icons.chat),
                title: const Text('BrainBot AI Assistant'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF7C4DFF),
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.smart_toy),
              label: 'BrainBot',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showChatBot(),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
            child: const Icon(Icons.chat_bubble, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _handleSOS() {
    // Implement SOS functionality
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _showAccessibilitySettings() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Accessibility Settings'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Text Size'),
                  trailing: Slider(
                    value: _fontSize,
                    min: 0.8,
                    max: 1.4,
                    onChanged: (value) {
                      setState(() {
                        _fontSize = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
    );
  }

  void _showChatBot() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder:
          (context) => DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.4,
            maxChildSize: 0.95,
            builder:
                (context, scrollController) => Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.smart_toy),
                            const SizedBox(width: 8),
                            const Text(
                              'BrainBot Assistant',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          controller: scrollController,
                          padding: const EdgeInsets.all(16),
                          children: const [
                            ChatMessage(
                              text: "Hello! How can I help you today?",
                              isBot: true,
                            ),
                            ChatMessage(
                              text: "I need help managing my daily routine.",
                              isBot: false,
                            ),
                            ChatMessage(
                              text:
                                  "I can help you create a structured schedule. Would you like to start with morning, afternoon, or evening activities?",
                              isBot: true,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Type a message...',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          ),
    );
  }
}

// Home Screen Widgets
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        WelcomeCard(),
        SizedBox(height: 16),
        TasksSection(),
        SizedBox(height: 16),
        RemindersSection(),
        SizedBox(height: 16),
        ResourcesGrid(),
      ],
    );
  }
}

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back!',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your daily progress is on track.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 16),
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.7,
                      minHeight: 8,
                      backgroundColor: Colors.white.withOpacity(0.2),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '70%',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TasksSection extends StatelessWidget {
  const TasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Today\'s Tasks', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        _buildTasksList(),
      ],
    );
  }

  Widget _buildTasksList() {
    return Column(
      children: const [
        TaskItem(
          title: 'Morning Meditation',
          time: '9:00 AM',
          isCompleted: true,
        ),
        TaskItem(
          title: 'Therapy Session',
          time: '11:00 AM',
          isCompleted: false,
        ),
        TaskItem(title: 'Take Medication', time: '2:00 PM', isCompleted: false),
      ],
    );
  }
}

class TaskItem extends StatelessWidget {
  final String title;
  final String time;
  final bool isCompleted;

  const TaskItem({
    required this.title,
    required this.time,
    required this.isCompleted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:
                isCompleted
                    ? Colors.green.withOpacity(0.1)
                    : Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            isCompleted ? Icons.check_circle : Icons.circle_outlined,
            color: isCompleted ? Colors.green : Colors.grey,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            decoration: isCompleted ? TextDecoration.lineThrough : null,
            color: isCompleted ? Colors.grey : null,
          ),
        ),
        subtitle: Text(time),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ),
    );
  }
}

class RemindersSection extends StatelessWidget {
  const RemindersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Reminders', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            _buildRemindersList(),
          ],
        ),
      ),
    );
  }

  Widget _buildRemindersList() {
    return Column(
      children: const [
        ReminderItem(
          title: 'Take Medication',
          time: '2:00 PM',
          priority: 'High',
        ),
        ReminderItem(
          title: 'Therapy Session',
          time: '4:00 PM',
          priority: 'Medium',
        ),
      ],
    );
  }
}

class ReminderItem extends StatelessWidget {
  final String title;
  final String time;
  final String priority;

  const ReminderItem({
    required this.title,
    required this.time,
    required this.priority,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.notifications_active, color: _getPriorityColor()),
      title: Text(title),
      subtitle: Text(time),
      trailing: Chip(
        label: Text(priority),
        backgroundColor: _getPriorityColor().withOpacity(0.2),
      ),
    );
  }

  Color _getPriorityColor() {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }
}

class ResourcesGrid extends StatelessWidget {
  const ResourcesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: const [
        ResourceCard(
          title: 'Educational',
          icon: Icons.school,
          color: Colors.blue,
        ),
        ResourceCard(
          title: 'Employment',
          icon: Icons.work,
          color: Colors.green,
        ),
        ResourceCard(
          title: 'Therapy',
          icon: Icons.psychology,
          color: Colors.purple,
        ),
        ResourceCard(
          title: 'Community',
          icon: Icons.people,
          color: Colors.orange,
        ),
      ],
    );
  }
}

class ResourceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const ResourceCard({
    required this.title,
    required this.icon,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}

// Community Screen Widgets
class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Professionals'),
              Tab(text: 'Community'),
              Tab(text: 'Events'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildProfessionalsList(),
                _buildCommunityFeed(),
                _buildEventsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfessionalsList() {
    final professionals = [
      {
        'name': 'Dr. Sarah Wilson',
        'specialty': 'Neurodevelopmental Specialist',
        'rating': 4.8,
        'isAvailable': true,
      },
      {
        'name': 'Prof. James Chen',
        'specialty': 'Special Education Expert',
        'rating': 4.7,
        'isAvailable': true,
      },
      {
        'name': 'Ms. Rachel Green',
        'specialty': 'Occupational Therapist',
        'rating': 4.6,
        'isAvailable': true,
      },
      {
        'name': 'Dr. Emily Martinez',
        'specialty': 'Autism Specialist',
        'rating': 4.9,
        'isAvailable': false,
      },
      {
        'name': 'Dr. Michael Brown',
        'specialty': 'ADHD Specialist',
        'rating': 4.7,
        'isAvailable': true,
      },
      {
        'name': 'Mrs. Lisa Thompson',
        'specialty': 'Special Education Teacher',
        'rating': 4.5,
        'isAvailable': true,
      },
      {
        'name': 'Dr. David Park',
        'specialty': 'Child Psychologist',
        'rating': 4.8,
        'isAvailable': true,
      },
    ];

    return ListView.builder(
      itemCount: professionals.length,
      itemBuilder: (context, index) {
        final prof = professionals[index];
        return ProfessionalCard(
          name: prof['name'] as String,
          specialty: prof['specialty'] as String,
          rating: prof['rating'] as double,
          isAvailable: prof['isAvailable'] as bool,
        );
      },
    );
  }

  Widget _buildCommunityFeed() {
    final posts = [
      {
        'author': 'Alex',
        'content':
            'Just discovered a great app for managing sensory overload! It helps me track triggers and provides calming exercises. What tools do you use?',
        'likes': 45,
        'comments': 12,
      },
      {
        'author': 'Sarah',
        'content':
            'Looking for recommendations for noise-canceling headphones that are comfortable for long periods. My current ones hurt after 2 hours.',
        'likes': 32,
        'comments': 28,
      },
      {
        'author': 'Mike',
        'content':
            'Proud moment! Successfully gave a presentation at work using the strategies my occupational therapist taught me. Small steps lead to big victories! 🎉',
        'likes': 89,
        'comments': 15,
      },
      {
        'author': 'Emma',
        'content':
            'Started a new job that accommodates neurodiversity. They provided a quiet workspace and flexible hours. It\'s amazing how small adjustments make such a big difference!',
        'likes': 67,
        'comments': 23,
      },
      {
        'author': 'David',
        'content':
            'Weekly reminder: Your different way of thinking is your superpower. Embrace your unique perspective! 💪',
        'likes': 120,
        'comments': 45,
      },
    ];

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return CommunityPost(
          author: post['author'] as String,
          content: post['content'] as String,
          likes: post['likes'] as int,
          comments: post['comments'] as int,
        );
      },
    );
  }

  Widget _buildEventsList() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return EventCard(
          title: 'Neurodiversity Meetup ${index + 1}',
          date: DateTime.now().add(Duration(days: index * 2)),
          location: 'Community Center',
          attendees: 15 + index,
        );
      },
    );
  }
}

class ProfessionalCard extends StatelessWidget {
  final String name;
  final String specialty;
  final double rating;
  final bool isAvailable;

  const ProfessionalCard({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.isAvailable,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        leading: CircleAvatar(child: Text(name[0])),
        title: Text(name),
        subtitle: Text(specialty),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: Colors.amber),
            Text(rating.toString()),
            const SizedBox(width: 8),
            Icon(
              Icons.circle,
              color: isAvailable ? Colors.green : Colors.grey,
              size: 12,
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Contact Information:'),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text(
                    'Email: ${name.toLowerCase().replaceAll(' ', '.')}@brainboot.com',
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: const Text('Phone: (555) 123-4567'),
                ),
                const SizedBox(height: 8),
                const Text('About:'),
                const Text(
                  'Experienced professional specializing in neurodiversity support...',
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Schedule Appointment'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommunityPost extends StatelessWidget {
  final String author;
  final String content;
  final int likes;
  final int comments;

  const CommunityPost({
    required this.author,
    required this.content,
    required this.likes,
    required this.comments,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(author, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(content),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.favorite, size: 16),
                Text(' $likes'),
                const SizedBox(width: 16),
                const Icon(Icons.comment, size: 16),
                Text(' $comments'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final DateTime date;
  final String location;
  final int attendees;

  const EventCard({
    required this.title,
    required this.date,
    required this.location,
    required this.attendees,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text('$location • ${attendees.toString()} attending'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date.day.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(date.month.toString()),
          ],
        ),
      ),
    );
  }
}

// Schedule Screen Widgets
class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [CalendarWidget(), Expanded(child: AppointmentsList())],
    );
  }
}

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'April 2024',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1,
                ),
                itemCount: 31,
                itemBuilder:
                    (context, index) => InkWell(
                      onTap: () => _showAddNoteDialog(context, index + 1),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(child: Text('${index + 1}')),
                            if (_hasNote(index + 1))
                              const Positioned(
                                right: 2,
                                top: 2,
                                child: Icon(Icons.note, size: 8),
                              ),
                          ],
                        ),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddNoteDialog(BuildContext context, int day) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Add Note for April $day'),
            content: const TextField(
              maxLines: 3,
              decoration: InputDecoration(hintText: 'Enter your note here...'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Save note logic here
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
    );
  }

  bool _hasNote(int day) {
    // Check if day has note logic here
    return false;
  }
}

class AppointmentsList extends StatelessWidget {
  const AppointmentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ExpansionTile(
            leading: const CircleAvatar(child: Icon(Icons.event)),
            title: Text('Appointment ${index + 1}'),
            subtitle: Text('April ${index + 1}, 2024 • 10:00 AM'),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Provider: Dr. Sarah Wilson'),
                    const Text('Location: 123 Medical Center'),
                    const Text('Duration: 1 hour'),
                    const Text('Notes: Initial consultation'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton.icon(
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit'),
                          onPressed: () {},
                        ),
                        TextButton.icon(
                          icon: const Icon(Icons.cancel),
                          label: const Text('Cancel'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// BrainBot Screen Widgets
class BrainBotScreen extends StatefulWidget {
  const BrainBotScreen({super.key});

  @override
  State<BrainBotScreen> createState() => _BrainBotScreenState();
}

class _BrainBotScreenState extends State<BrainBotScreen>
    with SingleTickerProviderStateMixin {
  bool _isPoweredOn = false;
  late AnimationController _eyeController;
  late Point _targetPoint;
  Point _currentEyePosition = const Point(0.5, 0.5);
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _targetPoint = _getRandomPoint();
    _eyeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
      setState(() {
        _currentEyePosition = Point(
          lerpDouble(_currentEyePosition.x, _targetPoint.x, 0.02) ?? 0.5,
          lerpDouble(_currentEyePosition.y, _targetPoint.y, 0.02) ?? 0.5,
        );
      });
      if (_eyeController.value >= 1.0) {
        _targetPoint = _getRandomPoint();
        _eyeController.reset();
        _eyeController.forward();
      }
    });
  }

  Point _getRandomPoint() {
    return Point(
      0.2 + _random.nextDouble() * 0.6,
      0.2 + _random.nextDouble() * 0.6,
    );
  }

  @override
  void dispose() {
    _eyeController.dispose();
    super.dispose();
  }

  void _togglePower() {
    setState(() {
      _isPoweredOn = !_isPoweredOn;
      if (_isPoweredOn) {
        _eyeController.forward();
      } else {
        _eyeController.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!_isPoweredOn) ...[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _togglePower,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(48),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Icon(
                    Icons.power_settings_new,
                    size: 64,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.settings, size: 32),
                      iconSize: 32,
                      onPressed: () {},
                      tooltip: 'Settings',
                      padding: const EdgeInsets.all(16),
                    ),
                    const SizedBox(width: 32),
                    IconButton(
                      icon: const Icon(Icons.info_outline, size: 32),
                      iconSize: 32,
                      onPressed: () {},
                      tooltip: 'Info',
                      padding: const EdgeInsets.all(16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        if (_isPoweredOn)
          Container(
            color: Colors.black,
            child: Center(
              child: PixelatedEyes(
                position: _currentEyePosition,
                color: Colors.cyan,
              ),
            ),
          ),
      ],
    );
  }
}

class Point {
  final double x;
  final double y;

  const Point(this.x, this.y);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

class PixelatedEyes extends StatelessWidget {
  final Point position;
  final Color color;

  const PixelatedEyes({required this.position, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 100),
      painter: PixelatedEyePainter(position: position, color: color),
    );
  }
}

class PixelatedEyePainter extends CustomPainter {
  final Point position;
  final Color color;
  static const pixelSize = 4.0;

  PixelatedEyePainter({required this.position, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    // Draw left eye
    _drawPixelatedEye(
      canvas,
      Offset(size.width * 0.25, size.height * 0.5),
      size.height * 0.4,
      position,
      paint,
    );

    // Draw right eye
    _drawPixelatedEye(
      canvas,
      Offset(size.width * 0.75, size.height * 0.5),
      size.height * 0.4,
      position,
      paint,
    );
  }

  void _drawPixelatedEye(
    Canvas canvas,
    Offset center,
    double radius,
    Point lookAt,
    Paint paint,
  ) {
    for (double x = -radius; x < radius; x += pixelSize) {
      for (double y = -radius; y < radius; y += pixelSize) {
        // Fixed loop syntax
        if (x * x + y * y < radius * radius) {
          final pixelCenter = Offset(
            center.dx + x + (lookAt.x - 0.5) * radius * 0.5,
            center.dy + y + (lookAt.y - 0.5) * radius * 0.5,
          );
          canvas.drawRect(
            Rect.fromCenter(
              center: pixelCenter,
              width: pixelSize,
              height: pixelSize,
            ),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(PixelatedEyePainter oldDelegate) =>
      position != oldDelegate.position || color != oldDelegate.color;
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isBot;

  const ChatMessage({required this.text, required this.isBot, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isBot) ...[
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.smart_toy, color: Colors.white),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:
                    isBot
                        ? Colors.grey[200]
                        : Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                text,
                style: TextStyle(color: isBot ? Colors.black87 : Colors.black),
              ),
            ),
          ),
          if (!isBot) ...[
            const SizedBox(width: 8),
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(Icons.person, color: Colors.white),
            ),
          ],
        ],
      ),
    );
  }
}

// New Screens
class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Tracking')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProgressCard('Weekly Goals', 0.8),
          _buildProgressCard('Monthly Goals', 0.6),
          _buildProgressCard('Yearly Goals', 0.4),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildProgressCard(String title, double progress) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Stack(
              alignment: Alignment.center,
              children: [
                LinearProgressIndicator(value: progress, minHeight: 10),
                Text('${(progress * 100).round()}%'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Support')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSupportCard(
            'Emergency Contacts',
            Icons.emergency,
            'Access emergency contact numbers',
          ),
          _buildSupportCard(
            'Crisis Helpline',
            Icons.phone,
            '24/7 support line available',
          ),
          _buildSupportCard(
            'Support Groups',
            Icons.group,
            'Find local support groups',
          ),
        ],
      ),
    );
  }

  Widget _buildSupportCard(String title, IconData icon, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(title),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {},
      ),
    );
  }
}

class MedicationTrackerScreen extends StatelessWidget {
  const MedicationTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medication Tracker')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMedicationCard('Morning Medication', '8:00 AM'),
          _buildMedicationCard('Afternoon Medication', '2:00 PM'),
          _buildMedicationCard('Evening Medication', '8:00 PM'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMedicationCard(String title, String time) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: const Icon(Icons.medication),
        title: Text(title),
        subtitle: Text(time),
        trailing: IconButton(
          icon: const Icon(Icons.check_circle_outline),
          onPressed: () {},
        ),
      ),
    );
  }
}

class JobListingsScreen extends StatelessWidget {
  const JobListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Listings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildJobCard('Software Developer', 'Tech Company Inc.', 'Remote', [
            'Flutter',
            'Dart',
            'Firebase',
          ]),
          _buildJobCard('UI Designer', 'Design Studio', 'Hybrid', [
            'Figma',
            'Adobe XD',
          ]),
          _buildJobCard('Project Manager', 'Management Solutions', 'On-site', [
            'Agile',
            'Scrum',
          ]),
        ],
      ),
    );
  }

  Widget _buildJobCard(
    String title,
    String company,
    String location,
    List<String> skills,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 18)),
            Text(company),
            Text(location),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children:
                  skills.map((skill) => Chip(label: Text(skill))).toList(),
            ),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: () {}, child: const Text('Apply Now')),
          ],
        ),
      ),
    );
  }
}

class EducationalResourcesScreen extends StatelessWidget {
  const EducationalResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Educational Resources')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildResourceCard(
            'Online Courses',
            'Learn at your own pace',
            Icons.school,
          ),
          _buildResourceCard(
            'Workshops',
            'Interactive learning sessions',
            Icons.group,
          ),
          _buildResourceCard(
            'Learning Materials',
            'Download study materials',
            Icons.book,
          ),
        ],
      ),
    );
  }

  Widget _buildResourceCard(String title, String description, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(title),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {},
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:brainboot/main.dart';
import 'package:brainboot/screens/brain_bot_screen.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Community',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Connect & Share',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 20),
            _buildCommunitySection(
              context,
              'Medical Professionals',
              Icons.medical_services,
              'Connect with psychiatrists, therapists, and specialists',
            ),
            _buildCommunitySection(
              context,
              'Education Support',
              Icons.school,
              'Interact with special education teachers and counselors',
            ),
            _buildCommunitySection(
              context,
              'Peer Support',
              Icons.group,
              'Connect with others who share similar experiences',
            ),
            _buildCommunitySection(
              context,
              'Support Groups',
              Icons.favorite,
              'Join moderated group discussions',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Create new post')));
        },
        child: Icon(Icons.edit),
        tooltip: 'Create Post',
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'BrainBot'),
        ],
        currentIndex: 1,
        onTap: (index) {
          if (index != 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder:
                    (context) =>
                        index == 0 ? const HomePage() : const BrainBotScreen(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildCommunitySection(
    BuildContext context,
    String title,
    IconData icon,
    String description,
  ) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Opening $title section')));
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 24, color: Theme.of(context).primaryColor),
                  SizedBox(width: 12),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(description, style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: [
                  Chip(label: Text('Online: 23')),
                  Chip(label: Text('Posts: 156')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

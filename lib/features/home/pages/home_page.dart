import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  final String email;

  const HomePage({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LMS Dashboard"),
      ),

      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Welcome User"),

              accountEmail: Text(email),
              currentAccountPicture: const CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile Me"),
              onTap: () {
                Navigator.pop(context);
                context.push('/profile-me');
              },
            ),

             ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Trainer Profile"),
              onTap: () {
                Navigator.pop(context);
                context.push('/trainer-profile');
              },
            ),

            ListTile(
              leading: const Icon(Icons.school),
              title: const Text("Apply for Trainer"),
              onTap: () {
                Navigator.pop(context);
                context.push('/trainer-apply');
              },
            ),

            const Spacer(),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                context.go('/login');
              },
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Text(
              "Welcome to LMS Dashboard",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email: $email",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
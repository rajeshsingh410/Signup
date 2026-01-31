import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserModel user;
  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6366F1), // Indigo
              Color(0xFF22D3EE), // Cyan
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              /// 🌈 Gradient AppBar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Text(
                        'User Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // balance back button
                  ],
                ),
              ),

              /// 📄 Content Card
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        _infoTile(
                          icon: Icons.login,
                          label: 'Signup Type',
                          value: user.signupType,
                        ),
                        _infoTile(
                          icon: Icons.person,
                          label: 'Full Name',
                          value: user.fullName,
                        ),
                        if (user.username != null)
                          _infoTile(
                            icon: Icons.alternate_email,
                            label: 'Username',
                            value: user.username!,
                          ),
                        if (user.dob != null)
                          _infoTile(
                            icon: Icons.calendar_today,
                            label: 'Date of Birth',
                            value: user.dob!,
                          ),
                        if (user.gender != null)
                          _infoTile(
                            icon: Icons.people,
                            label: 'Gender',
                            value: user.gender!,
                          ),
                        if (user.instagram != null)
                          _infoTile(
                            icon: Icons.camera_alt,
                            label: 'Instagram',
                            value: user.instagram!,
                          ),
                        if (user.youtube != null)
                          _infoTile(
                            icon: Icons.play_circle_fill,
                            label: 'YouTube',
                            value: user.youtube!,
                          ),
                        if (user.email != null)
                          _infoTile(
                            icon: Icons.email,
                            label: 'Email',
                            value: user.email!,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🎯 Reusable info tile
  Widget _infoTile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF6366F1),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}

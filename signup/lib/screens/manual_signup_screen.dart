import 'package:flutter/material.dart';
import 'user_details_screen.dart';
import '../models/user_model.dart';
import 'package:intl/intl.dart';

class ManualSignupScreen extends StatefulWidget {
  const ManualSignupScreen({super.key});

  @override
  State<ManualSignupScreen> createState() => _ManualSignupScreenState();
}

class _ManualSignupScreenState extends State<ManualSignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _dobController = TextEditingController();
  String? _gender;
  final _instagramController = TextEditingController();
  final _youtubeController = TextEditingController();

  bool get _isFormValid => _formKey.currentState?.validate() ?? false;

  void _pickDOB() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18),
      firstDate: DateTime(1900),
      lastDate: DateTime(now.year - 13),
    );
    if (picked != null) {
      _dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {});
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final user = UserModel(
        signupType: 'Manual',
        fullName: _fullNameController.text.trim(),
        username: _usernameController.text.trim(),
        dob: _dobController.text,
        gender: _gender,
        instagram: _instagramController.text.trim(),
        youtube: _youtubeController.text.trim(),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => UserDetailsScreen(user: user)),
      );
    }
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    final theme = Theme.of(context);
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: theme.colorScheme.primary),
      filled: true,
      fillColor: Colors.white.withOpacity(0.95),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              /// 📄 Form Card
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: screenWidth > 600 ? 500 : double.infinity,
                      ),
                      child: Card(
                        elevation: 12,
                        shadowColor: Colors.black26,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                            key: _formKey,
                            onChanged: () => setState(() {}),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Manual Signup",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo,
                                      ),
                                ),
                                const SizedBox(height: 24),

                                TextFormField(
                                  controller: _fullNameController,
                                  decoration: _inputDecoration(
                                      'Full Name', Icons.person),
                                  validator: (val) =>
                                      val == null || val.isEmpty
                                          ? 'Required'
                                          : null,
                                ),
                                const SizedBox(height: 16),

                                TextFormField(
                                  controller: _usernameController,
                                  decoration: _inputDecoration(
                                      'Username',
                                      Icons.alternate_email),
                                  validator: (val) =>
                                      val != null && val.length < 3
                                          ? 'Minimum 3 characters'
                                          : null,
                                ),
                                const SizedBox(height: 16),

                                TextFormField(
                                  controller: _dobController,
                                  decoration: _inputDecoration(
                                      'Date of Birth',
                                      Icons.calendar_month),
                                  readOnly: true,
                                  onTap: _pickDOB,
                                  validator: (val) =>
                                      val == null || val.isEmpty
                                          ? 'Required'
                                          : null,
                                ),
                                const SizedBox(height: 16),

                                DropdownButtonFormField<String>(
                                  value: _gender,
                                  decoration: _inputDecoration(
                                      'Gender', Icons.people),
                                  items: ['Male', 'Female', 'Other']
                                      .map(
                                        (g) => DropdownMenuItem(
                                          value: g,
                                          child: Text(g),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (val) =>
                                      setState(() => _gender = val),
                                  validator: (val) =>
                                      val == null ? 'Required' : null,
                                ),
                                const SizedBox(height: 16),

                                TextFormField(
                                  controller: _instagramController,
                                  decoration: _inputDecoration(
                                      'Instagram Username',
                                      Icons.camera_alt),
                                  validator: (val) =>
                                      val == null || val.isEmpty
                                          ? 'Required'
                                          : null,
                                ),
                                const SizedBox(height: 16),

                                TextFormField(
                                  controller: _youtubeController,
                                  decoration: _inputDecoration(
                                      'YouTube Channel',
                                      Icons.play_circle),
                                  validator: (val) =>
                                      val == null || val.isEmpty
                                          ? 'Required'
                                          : null,
                                ),
                                const SizedBox(height: 32),

                                /// 🚀 Gradient Button
                                SizedBox(
                                  height: 52,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      gradient:
                                          const LinearGradient(
                                        colors: [
                                          Color(0xFF6366F1),
                                          Color(0xFF22D3EE),
                                        ],
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(14),
                                    ),
                                    child: ElevatedButton(
                                      onPressed:
                                          _isFormValid ? _submit : null,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.transparent,
                                        shadowColor:
                                            Colors.transparent,
                                      ),
                                      child: const Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
}

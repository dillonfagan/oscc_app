import 'package:flutter/material.dart';
import 'package:oscc_app/layouts/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignupPageState();
  }
}

class _SignupPageState extends State<SignupPage> {
  bool _isLoading = false;
  String? _error;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _signUp(BuildContext context) async {
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() => _error =
          'Passwords do not match. Make sure they match before signing up.');
      return;
    }

    setState(() => _isLoading = true);

    final supabase = Supabase.instance.client;
    final response = await supabase.auth
        .signUp(_emailController.text, _passwordController.text);

    if (response.error != null) {
      setState(() {
        _error = response.error?.message;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.error!.message),
          duration: const Duration(seconds: 3),
        ));
      });
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Sign up',
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          TextFormField(
            controller: _confirmPasswordController,
            decoration: const InputDecoration(labelText: 'Confirm Password'),
          ),
          const SizedBox(height: 32),
          if (_error != null)
            Text(
              _error!,
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: _isLoading ? null : () => _signUp(context),
        child: _isLoading
            ? CircularProgressIndicator(color: Colors.blue[100])
            : const Text('Sign Up'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}

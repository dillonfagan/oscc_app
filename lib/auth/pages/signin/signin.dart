import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oscc_app/common/layouts/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SigninPageState();
  }
}

class _SigninPageState extends State<SigninPage> {
  bool _isLoading = false;
  String? _error;
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signIn(BuildContext context) async {
    setState(() => _isLoading = true);

    final supabase = Supabase.instance.client;
    final response = await supabase.auth.signIn(
      phone: _phoneController.text,
      password: _passwordController.text,
    );

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
      title: 'Login',
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        children: [
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(labelText: 'Phone'),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
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
        onPressed: _isLoading ? null : () => _signIn(context),
        child: _isLoading
            ? CircularProgressIndicator(color: Colors.blue[100])
            : const Text('Log In'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}

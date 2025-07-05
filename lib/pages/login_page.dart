import 'package:flutter/material.dart';
import 'package:login/pages/age_group_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _obscurePassword = true;
  String? _passwordError;
  String? _emailError;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromRGBO(201, 162, 255, 1),
              const Color.fromRGBO(188, 165, 255, 1),
              const Color.fromRGBO(161, 169, 254, 1),
              const Color.fromRGBO(141, 174, 254, 1),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome,',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Glad to see you!',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 70),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child:  TextField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white  ),
                  decoration: InputDecoration(
                    hintText: 'Enter your username',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    fillColor: Color.fromARGB(104, 210, 156, 228),
                    filled: true,
                    errorText: _emailError,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    fillColor: const Color.fromARGB(104, 210, 156, 228),
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    errorText: _passwordError,
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _emailError = null;
                    _passwordError = null;
                    if (_emailController.text.isEmpty) {
                      _emailError = 'Username cannot be empty';
                    } 
                    if (_passwordController.text.length < 8) {
                      _passwordError = 'Password must be at least 8 characters';
                    } else {
                      _passwordError = null;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AgeGroupPage(),
                        ),
                      );
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 20, 8, 8),
                    fontWeight: FontWeight.bold,
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

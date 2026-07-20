import 'package:flutter/material.dart';
import 'package:mavazi/screens/login_screan.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() {
    return _SignupScreenState();
  }
}

class _SignupScreenState extends State<SignupScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfController = TextEditingController();
  bool _hidePasswordConf = true;
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    @override
    void dispose(){
      _firstNameController.dispose();
      _lastNameController.dispose();
      _emailController.dispose();
      _passwordConfController.dispose();
      _passwordController.dispose();
      super.dispose();

    }
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),          
          child: Form(
            key: _signUpFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    prefixIcon: Icon(Icons.person_2_outlined),
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 17,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _lastNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    prefixIcon: Icon(Icons.person_2_outlined),
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    // if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value))
                    if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 24),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _hidePassword = !_hidePassword;
                        });
                      },
                      //icon:Icon(_hidePasswordConf ? Icons.visibility_outlined: Icons.visibility_off_outlined,),
                    ),
                  ),
                  obscureText: _hidePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your your password ';
                    }
                    if (value != _passwordController.text) {
                      return 'password do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                TextFormField(
                  controller: _passwordConfController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                  
                    suffixIcon: IconButton(
                      icon: Icon(
                        _hidePasswordConf
                            ? Icons.visibility_outlined
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _hidePasswordConf = !_hidePasswordConf;
                        });
                      },
                    ),
                  ),

                  obscureText: _hidePasswordConf,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your confirm password ';
                    }
                    if (value != _passwordController.text) {
                      return 'password do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_signUpFormKey.currentState!.validate()) {
                      //perform login the navigate to home screen
                    }
                  },
                  child: Text("signup", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    fixedSize: Size(400, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "sign in",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:mavazi/screens/signup_screen.dart';
class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState()
{
  return _LoginScreenState();
}
}
class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidePassword = true;

  @override
    Widget build(BuildContext context){
      @override
      void dispose(){
      _emailController.dispose();
      _passwordController.dispose();
      super.dispose();

    }
      return Scaffold(
        body: SafeArea(child: SingleChildScrollView(
          padding: EdgeInsets.all(24) ,
          child:Form(
           key: _loginFormKey,
          
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,          
          children: [
          Image.asset(
            "assets/images/logo.png",
            width:160,
            height:160,
            fit: BoxFit.contain,
          ),
          Text("Login",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign:TextAlign.center),
          SizedBox(height: 16),

          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email',
              border:OutlineInputBorder(),
            ),
            validator: (value){
              if (value == null || value.isEmpty){
                return 'Please enter email';
              }
              if (!value.contains('@')){
                return 'Please enter a valid email address';
              }
              return null;
            }
          ),

          SizedBox( height: 24),
          TextFormField(
            controller:  _passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              labelText: 'Password',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(onPressed: (){ setState(() {
                _hidePassword = !_hidePassword; });
              },
              icon:Icon( 
                _hidePassword 
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
              ),),
            ),
            obscureText: _hidePassword,
            validator: (value){
              if (value==null || value.isEmpty){
                return 'Enter your password';
              }
              return null;
            },
          ),
          SizedBox(height:24),
          ElevatedButton(onPressed:(){
            if(_loginFormKey.currentState!.validate()){
              //perform login the navigate to home screen
            }
          },
          child: Text("login", style: TextStyle(color: Colors.white),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),),
            ),
            SizedBox(height: 24),

            Row( 
              mainAxisAlignment: MainAxisAlignment.center,children:[
              Text("Don't have an account?"),
              TextButton(onPressed: (){Navigator.push(context,MaterialPageRoute(
            builder: (context) => const SignupScreen(),
            ),
            );
            }, 
            child: Text("Sign Up", style:TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
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

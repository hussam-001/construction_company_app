import 'package:construction_company_app/api/auth_api.dart';
import 'package:construction_company_app/constants.dart';
import 'package:construction_company_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool showSpinner = false;
  String email = '';
  String password = '';
  String? errorMessage;

  final _formKey = GlobalKey<FormState>();

  void handleSignIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        showSpinner = true;
      });
      try {
        String? deviceToken = await FirebaseMessaging.instance.getToken();

        if (deviceToken != null) {
          await signIn(email, password, deviceToken);

          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          setState(() {
            errorMessage = 'Can~t get Device token';
          });
        }
      } catch (e) {
        setState(() {
          errorMessage = e.toString();
        });
      } finally {
        setState(() {
          showSpinner = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.sizeOf(context).height / 2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/images/logo3.png',
                      fit: BoxFit.contain,
                      height: 300,
                    ),
                  ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.sizeOf(context).height / 2,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              textDirection: TextDirection.ltr,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                email = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                alignLabelWithHint: true,
                                labelText: "Email",
                                prefixIcon: const Icon(Icons.person),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15.0),
                            TextFormField(
                              textDirection: TextDirection.ltr,
                              obscureText: true,
                              onChanged: (value) {
                                password = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                labelText: "Password",
                                prefixIcon: const Icon(Icons.lock),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                            ),
                            errorMessage != null
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15.0,
                                    ),
                                    child: Text(
                                      errorMessage!,
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  )
                                : const SizedBox(height: 15),
                            showSpinner
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: kPrimaryColor,
                                    ),
                                  )
                                : ElevatedButton(
                                    onPressed: handleSignIn,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kPrimaryColor,
                                      foregroundColor: Colors.white,
                                      minimumSize: const Size.fromHeight(40),
                                    ),
                                    child: const Text(
                                      "Sign In",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
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

import 'package:construction_company_app/api/auth_api.dart';
import 'package:construction_company_app/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;
  final Widget fallback;

  const AuthGuard({
    super.key,
    required this.child,
    this.fallback = const SignInScreen(),
  });

  Future<bool> _isAuthenticated() async {
    final token = await getUserToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isAuthenticated(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData && snapshot.data == true) {
          return child;
        } else {
          return fallback;
        }
      },
    );
  }
}

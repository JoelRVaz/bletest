
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp2/layout/app_page.dart';
import 'package:watertcmapp2/providers/auth_provider/auth_provider.dart';

class AuthPage extends ConsumerWidget {
  final void Function(bool success)? isAuthenticated;
  const AuthPage({Key? key, this.isAuthenticated}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider.notifier);
    return AppPage(
      title: 'Login',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              auth.login(
                email: "cathy123@promagenviro.ca", 
                password: "Prom@g123"
              ).then((value) { 
                isAuthenticated?.call(true);
                context.router.navigateNamed('/');
              }).onError(
                (error, stackTrace) { 
                  print(error.toString());
                  isAuthenticated?.call(false);
                }
              );
            }, 
            child: const Text('Submit')
          )
        ],
      )
    );
  }
}


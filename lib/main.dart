import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp2/locator.dart';
import 'package:watertcmapp2/login_radius/login_radius_api.dart';
import 'package:watertcmapp2/navigation/auth_guard.dart';
import 'package:watertcmapp2/navigation/main_router.gr.dart';


void main() {
  setuplocator();
  LoginRadius _loginRadius = LoginRadius.instance;
  _loginRadius.init(
    apiKey: "a2eeacac-f39e-4dc6-a192-e809ebe81e77",
    appName: "promagenviro-dijaxiro",
    sott:
        "leRoNBICptJKSyMTBFGA9DQTSRtevQA7oDL0zh8ZW61E3gLvw5Slc1LjblCCX5o5+6h5VWndzoCKgxcyLrATXu2C95Kyu3ZFIBVbZWhw1po=*dbfc906a46312764495795575c4842ff",
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter(
    authGuard: AuthGuard()
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

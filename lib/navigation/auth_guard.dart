import 'package:auto_route/auto_route.dart';
import 'package:watertcmapp2/locator.dart';
import 'package:watertcmapp2/navigation/main_router.gr.dart';
import 'package:watertcmapp2/providers/auth_provider/auth_provider.dart';

class AuthGuard extends AutoRedirectGuard {
  bool isAuthenticated = false;
  AuthNotifier auth = locator<AuthNotifier>();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    print("dfgdfgdfgdfg");
    if (auth.state.isAuthenticated) {
      resolver.next();
    } else {
      // we redirect the user to our login page
      print("==============");
      router.push(AuthPageRoute(isAuthenticated: (success) {
        router.pop();
        print("objectfffffff");
        resolver.next(success);
      }));
    }
  }

  @override
  Future<bool> canNavigate(RouteMatch route) {
    // TODO: implement canNavigate
    throw UnimplementedError();
  }
}

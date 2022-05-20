            
// @CupertinoAutoRouter            
// @AdaptiveAutoRouter            
// @CustomAutoRouter            
import 'package:auto_route/auto_route.dart';
import 'package:watertcmapp2/layout/layout.dart';
import 'package:watertcmapp2/navigation/auth_guard.dart';
import 'package:watertcmapp2/pages/auth_page.dart';
import 'package:watertcmapp2/pages/devices_page.dart';
import 'package:watertcmapp2/pages/device_page.dart';

@MaterialAutoRouter(            
  replaceInRouteName: 'Page,Route',            
  routes: <AutoRoute>[            
    AutoRoute(page: AuthPage, path: '/Auth', name: 'AuthPageRoute'),   
    AutoRoute(page: Layout, guards: [AuthGuard], initial: true, children: [
      AutoRoute(page: DevicesPage, path: '', name: 'DevicesPageRoute'),
      AutoRoute(page: DevicePage, path: 'device', name: 'DevicePageRoute')
    ]),   
  ],            
)            
class $AppRouter {}            
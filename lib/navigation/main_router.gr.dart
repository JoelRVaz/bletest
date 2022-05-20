// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../layout/layout.dart' as _i2;
import '../models/device.dart' as _i8;
import '../pages/auth_page.dart' as _i1;
import '../pages/devices_page.dart' as _i3;
import '../pages/device_page.dart' as _i4;
import 'auth_guard.dart' as _i7;

class AppRouter extends _i5.RootStackRouter {
  AppRouter(
      {_i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i7.AuthGuard authGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AuthPageRoute.name: (routeData) {
      final args = routeData.argsAs<AuthPageRouteArgs>(
          orElse: () => const AuthPageRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.AuthPage(
              key: args.key, isAuthenticated: args.isAuthenticated));
    },
    Layout.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.Layout());
    },
    DevicesPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.DevicesPage());
    },
    DevicePageRoute.name: (routeData) {
      final args = routeData.argsAs<DevicePageRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.DevicePage(key: args.key, device: args.device));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(AuthPageRoute.name, path: '/Auth'),
        _i5.RouteConfig(Layout.name, path: '/', guards: [
          authGuard
        ], children: [
          _i5.RouteConfig(DevicesPageRoute.name, path: '', parent: Layout.name),
          _i5.RouteConfig(DevicePageRoute.name,
              path: 'device', parent: Layout.name)
        ])
      ];
}

/// generated route for
/// [_i1.AuthPage]
class AuthPageRoute extends _i5.PageRouteInfo<AuthPageRouteArgs> {
  AuthPageRoute({_i6.Key? key, void Function(bool)? isAuthenticated})
      : super(AuthPageRoute.name,
            path: '/Auth',
            args:
                AuthPageRouteArgs(key: key, isAuthenticated: isAuthenticated));

  static const String name = 'AuthPageRoute';
}

class AuthPageRouteArgs {
  const AuthPageRouteArgs({this.key, this.isAuthenticated});

  final _i6.Key? key;

  final void Function(bool)? isAuthenticated;

  @override
  String toString() {
    return 'AuthPageRouteArgs{key: $key, isAuthenticated: $isAuthenticated}';
  }
}

/// generated route for
/// [_i2.Layout]
class Layout extends _i5.PageRouteInfo<void> {
  const Layout({List<_i5.PageRouteInfo>? children})
      : super(Layout.name, path: '/', initialChildren: children);

  static const String name = 'Layout';
}

/// generated route for
/// [_i3.DevicesPage]
class DevicesPageRoute extends _i5.PageRouteInfo<void> {
  const DevicesPageRoute() : super(DevicesPageRoute.name, path: '');

  static const String name = 'DevicesPageRoute';
}

/// generated route for
/// [_i4.DevicePage]
class DevicePageRoute extends _i5.PageRouteInfo<DevicePageRouteArgs> {
  DevicePageRoute({_i6.Key? key, required _i8.Device device})
      : super(DevicePageRoute.name,
            path: 'device',
            args: DevicePageRouteArgs(key: key, device: device));

  static const String name = 'DevicePageRoute';
}

class DevicePageRouteArgs {
  const DevicePageRouteArgs({this.key, required this.device});

  final _i6.Key? key;

  final _i8.Device device;

  @override
  String toString() {
    return 'DevicePageRouteArgs{key: $key, device: $device}';
  }
}

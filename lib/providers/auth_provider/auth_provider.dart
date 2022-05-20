import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watertcmapp2/login_radius/login_radius_client.dart';
import 'package:watertcmapp2/locator.dart';
import 'package:watertcmapp2/providers/auth_provider/auth_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return locator<AuthNotifier>();
});


class AuthNotifier extends StateController<AuthState> {
  AuthNotifier() : super(AuthState());
  LRClient lrClient = LRClient();


  Future<String?> login({required String email, required String password}) async {
    try {
      Response loginResponse = await lrClient.post(
        endPoint: 'login',
        data: {
          'email' : email,
          'password': password
        }
      );
      state = state.update(userData: loginResponse.data, isAuthenticated: true);
      print(loginResponse.data);
      return state.userData['Profile']['FullName'];
    } catch (e) {
      rethrow;
    }
  }

  void test() {
    state = state.update(isAuthenticated: false);
  }

  Future<bool> registerUser({
    required firstName,
    required lastName,
    required email,
    required password,
    required companyName
  }) async {
    try {
      // ignore: unused_local_variable
      Response registerUserResponse = await lrClient.post(
        endPoint: 'register',
        data: {
          'firstName' : firstName,
          'lastName' : lastName,
          'email' : email,
          'password' : password,
          'companyName' : companyName
        }
      );
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> forgotPassword({ required email }) async {
    try {
      // ignore: unused_local_variable
      Response forgotPasswordResponse = await lrClient.post(
        endPoint: 'password',
        data: {
          'email' : email,
        },
        params: {
          'resetpasswordurl': lrClient.lrCredentials.resetPasswordUrl,
        }
      );
      return true;
    } catch (e) {
      rethrow;
    }
  }

  void logOut() {
    state = AuthState();
  }
}

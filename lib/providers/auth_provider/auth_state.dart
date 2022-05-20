
class AuthState {
  dynamic userData = {};
  bool isAuthenticated;
  String get accessToken => userData?['access_token'] ?? '';
  List<String> bluetothAcessTokens;
  
  //create accessToken based on userData in instance
  AuthState({
    this.userData, 
    this.isAuthenticated = false,
    this.bluetothAcessTokens = const []
  });

  AuthState update({
    dynamic userData,
    bool? isAuthenticated,
    List<String>? bluetothAcessTokens
  }) {
    return AuthState(
      userData: userData ?? this.userData,
      isAuthenticated: isAuthenticated ?? (userData?['acessToken'] != null),
      bluetothAcessTokens: bluetothAcessTokens ?? userData?['bluetoothTokens'] ?? this.bluetothAcessTokens
    );
  }
}

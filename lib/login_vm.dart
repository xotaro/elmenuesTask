
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'package:http/http.dart' as http;

@injectable
class LoginViewModel extends ChangeNotifier{
  final FlutterAppAuth appAuth = FlutterAppAuth();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  bool connecting = false;
  bool loggedIn = false;
   String errorMessage="";
   String name="";
   LoginViewModel(){
     initAction();
   }
  void initAction() async {
    final storedRefreshToken = await secureStorage.read(key: 'refresh_token');
    if (storedRefreshToken == null) return;
    connecting=true;
    notifyListeners();
    try {
      final response = await appAuth.token(TokenRequest(
        AUTH0_CLIENT_ID,
        AUTH0_REDIRECT_URI,
        issuer: AUTH0_ISSUER,
        refreshToken: storedRefreshToken,
      ));

      final idToken = parseIdToken(response!.idToken!);
      // final profile = await getUserDetails(response!.accessToken!);
      secureStorage.write(key: 'refresh_token', value: response.refreshToken);
        connecting = false;
        loggedIn = true;
        name = idToken['name'];
        notifyListeners();

    } catch (e, s) {
      print('error on refresh token: $e - stack: $s');
      logoutAction();
    }
  }
  Future<void> loginAction() async {
    connecting = true;
    errorMessage = '';
    notifyListeners();

    try {
      final AuthorizationTokenResponse? result =
      await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          AUTH0_CLIENT_ID,
          AUTH0_REDIRECT_URI,
          issuer: 'https://$AUTH0_DOMAIN',
          scopes: ['openid', 'profile', 'offline_access'],
          promptValues: ['login']
        ),
      );

      final idToken = parseIdToken(result!.idToken!);
      // final profile = await getUserDetails(result.accessToken!);

      await secureStorage.write(
          key: 'refresh_token', value: result.refreshToken);
      connecting = false;
      loggedIn = true;
      name = idToken['name'];
      notifyListeners();

    } catch (e, s) {
      print('login error: $e - stack: $s');
      connecting = false;
      loggedIn = false;
      errorMessage = e.toString();
      notifyListeners();


    }
  }
  Map<String, dynamic> parseIdToken(String idToken) {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  }
  void logoutAction() async {

    await secureStorage.delete(key: 'refresh_token');
    loggedIn = false;
    connecting = false;
    notifyListeners();
  }

  Future<Map<String, dynamic>> getUserDetails(String accessToken) async {
    const url = 'https://$AUTH0_DOMAIN/userinfo';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }}
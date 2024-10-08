import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user_model.dart';
import '../../domain/usecases/login_use_case.dart';

@injectable
class AuthViewModel extends ChangeNotifier {
  final LoginUseCase _loginUseCase;

  AuthViewModel(this._loginUseCase);

  UserModel? _user;

  UserModel? get user => _user;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<UserCredential?> login(String? email, String? password, BuildContext context) async {
    setLoading(true);

    final result = await _loginUseCase.login(email, password, context);

    setLoading(false);

    return result;
  }

  Future<UserCredential?> googleLogin() async {
    setLoading(true);

    final result = await _loginUseCase.googleLogin();

    setLoading(false);

    return result;
  }

  Future<UserCredential?> signUp(UserModel users, BuildContext context) async {
    setLoading(true);

    final result = await _loginUseCase.signUp(users, context);

    setLoading(false);

    return result;
  }
}

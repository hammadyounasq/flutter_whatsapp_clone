import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_again/feature/auth/repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  final authReposit = ref.read(authRepositoryProvider);
  return AuthController(authRepository: authReposit, ref: ref);
});

class AuthController {
  final AuthRepository _authRepository;
  final Ref _ref;

  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref;

  void signInwithPhone(BuildContext context, String phoneName) {
    _authRepository.signInwithPhone(context, phoneName);
  }

  void verifyOTP(BuildContext context, String verifyId, String userOTP) {
    _authRepository.verifyOTP(context, verifyId, userOTP);
  }
}

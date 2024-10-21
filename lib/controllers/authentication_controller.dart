import 'package:flutter/material.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/messages/snack_bar_message.dart';
import 'package:template_app/services/storage_service.dart';

class AuthenticationController {
  AuthenticationController._();

  static Future<void> signUp({
    required BuildContext context,
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      // TODO: Traitement à faire.

      if (!context.mounted) return;
      SnackBarMessage.show(context: context, message: TextsConstant.kSnacBarLoggedUp);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      // TODO: Traitement à faire.

      if (!context.mounted) return;
      SnackBarMessage.show(context: context, message: TextsConstant.kSnacBarLoggedIn);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> signOut({
    required BuildContext context,
  }) async {
    try {
      // TODO: Traitement à faire.

      await StorageService.removeKey(key: StorageService.kUserConnected);
      if (!context.mounted) return;
      SnackBarMessage.show(context: context, message: TextsConstant.kSnacBarLoggedOut);
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:flutter/material.dart';
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
      SnackBarMessage.show(context: context, message: "Logged up!");
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
      SnackBarMessage.show(context: context, message: "Logged in!");
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
      SnackBarMessage.show(context: context, message: "Logged out!");
    } catch (e) {
      rethrow;
    }
  }
}

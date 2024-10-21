import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/common/constants/abouts_constant.dart';
import 'package:template_app/common/constants/routes_constant.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/enums/messages_enum.dart';
import 'package:template_app/common/extensions/string_extensions.dart';
import 'package:template_app/common/messages/snack_bar_message.dart';
import 'package:template_app/common/themes/buttons_theme.dart';
import 'package:template_app/common/themes/colors_theme.dart';
import 'package:template_app/common/themes/gradients_theme.dart';
import 'package:template_app/controllers/authentication_controller.dart';
import 'package:template_app/services/storage_service.dart';
import 'package:template_app/views/widgets/divers/rotated_text.dart';
import 'package:template_app/views/widgets/form/by_usual/text_form_field_email.dart';
import 'package:template_app/views/widgets/form/by_usual/text_form_field_fullname.dart';
import 'package:template_app/views/widgets/form/by_usual/text_form_field_password.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final GlobalKey<FormState> _formKeySignInUp = GlobalKey<FormState>();

  bool _swithAuthentication = true; // true => SignIn, false => SignUp.

  late String _email;
  late String _fullName;
  late String _password;

  void _resetForm() {
    _email = "";
    _fullName = "";
    _password = "";
    _formKeySignInUp.currentState!.reset();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(gradient: GradientsTheme.linearGradientContainer),
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 15.0,
                top: 15.0,
                child: Text(
                  "${AboutsConstant.kAppName.toUpperCase()} ...",
                  style: const TextStyle(
                    color: ColorsTheme.kOnPrimary,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              Positioned(
                left: 10.0,
                top: 80.0,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        if (_swithAuthentication) return;
                        _resetForm();
                        setState(() => _swithAuthentication = true);
                      },
                      child: RotatedText(
                        title: TextsConstant.kAuthenticationSignIn.toUpperCase(),
                        color: (_swithAuthentication) ? Colors.white : Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const RotatedText(title: "|", color: Colors.white70),
                    const SizedBox(height: 20.0),
                    GestureDetector(
                      onTap: () {
                        if (!_swithAuthentication) return;
                        _resetForm();
                        setState(() => _swithAuthentication = false);
                      },
                      child: RotatedText(
                        title: TextsConstant.kAuthenticationSignUp.toUpperCase(),
                        color: (!_swithAuthentication) ? Colors.white : Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 45.0,
                top: 60.0,
                right: 0.0,
                bottom: 0.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                    ),
                    color: ColorsTheme.kOnPrimary,
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKeySignInUp,
                      child: Column(
                        children: <Widget>[
                          TextFormFieldEmail(onSave: (email) => _email = email),
                          if (!_swithAuthentication) TextFormFieldFullname(onSave: (fullName) => _fullName = fullName),
                          TextFormFieldPassword(onSave: (password) => _password = password),
                          const SizedBox(height: 15.0),
                          FilledButton(
                            style: ButtonsTheme.filledButtonDefault,
                            onPressed: () async {
                              if (_formKeySignInUp.currentState!.validate()) {
                                try {
                                  EasyLoading.show(status: (_swithAuthentication) ? "${TextsConstant.kAuthenticationSignIn.capitalize()} ..." : "${TextsConstant.kAuthenticationSignUp.capitalize()} ...");
                                  _formKeySignInUp.currentState!.save();

                                  if (_swithAuthentication) {
                                    await AuthenticationController.signIn(context: context, email: _email, password: _password);
                                    await StorageService.setBool(key: StorageService.kUserConnected, value: true);
                                    if (!context.mounted) return;
                                    EasyLoading.dismiss();
                                    GoRouter.of(context).go(RoutesConstant.kRouteMain);
                                  } else {
                                    await AuthenticationController.signUp(context: context, email: _email, fullName: _fullName, password: _password);
                                    if (!context.mounted) return;
                                    EasyLoading.dismiss();
                                    _resetForm();
                                    setState(() => _swithAuthentication = true);
                                  }
                                } catch (e) {
                                  if (!context.mounted) return;
                                  EasyLoading.dismiss();
                                  SnackBarMessage.show(context: context, typeMessage: TypeMessage.typeError, message: e.toString());
                                }
                              }
                            },
                            child: Text((_swithAuthentication) ? "${TextsConstant.kAuthenticationSignIn.toUpperCase()}!" : "${TextsConstant.kAuthenticationSignUp.toUpperCase()}!"),
                          ),
                          const SizedBox(height: 30.0),
                          Text(
                            (_swithAuthentication) ? TextsConstant.kAuthenticationSignUpQuestion : TextsConstant.kAuthenticationSignInQuestion,
                            style: const TextStyle(fontSize: 12.0),
                          ),
                          TextButton(
                            style: ButtonsTheme.textButtonDefault,
                            onPressed: () {
                              _resetForm();
                              setState(() => _swithAuthentication = !_swithAuthentication);
                            },
                            child: Text(TextsConstant.kBtnText.replaceFirst("%1", (_swithAuthentication) ? TextsConstant.kAuthenticationSignUp.toUpperCase() : TextsConstant.kAuthenticationSignIn.toUpperCase())),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

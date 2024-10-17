// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/common/constants/routes_constant.dart';
import 'package:template_app/common/constants/texts_constant.dart';
import 'package:template_app/common/enums/messages_enum.dart';
import 'package:template_app/common/messages/snack_bar_message.dart';
import 'package:template_app/common/themes/buttons_theme.dart';
import 'package:template_app/views/widgets/card/window_card.dart';
import 'package:template_app/views/widgets/form/by_type/text_form_field_type_double.dart';
import 'package:template_app/views/widgets/form/by_type/text_form_field_type_int.dart';
import 'package:template_app/views/widgets/form/by_type/text_form_field_type_memo.dart';
import 'package:template_app/views/widgets/form/by_type/text_form_field_type_string.dart';
import 'package:template_app/views/widgets/form/by_usual/switch_lock_unlock.dart';
import 'package:template_app/views/widgets/scaffold/app_bar/background_app_bar.dart';
import 'package:template_app/views/widgets/scaffold/app_bar/button_back_app_bar.dart';
import 'package:template_app/views/widgets/scaffold/app_bar/title_app_bar.dart';
import 'package:template_app/views/widgets/scaffold/bottom_bar/background_line_bottom_bar.dart';

class FormDiversScreen extends StatefulWidget {
  const FormDiversScreen({super.key});

  @override
  State<FormDiversScreen> createState() => _FormDiversScreenState();
}

class _FormDiversScreenState extends State<FormDiversScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _intController = TextEditingController(text: "0");
  final TextEditingController _doubleController = TextEditingController(text: "0.0");
  final TextEditingController _stringController = TextEditingController(text: "");
  final TextEditingController _memoController = TextEditingController(text: "");

  late int _intValue;
  late double _doubleValue;
  late String _stringValue;
  late String _memoValue;

  bool _switchValue = false;

  void _resetForm() {
    _intValue = 0;
    _doubleValue = 0.0;
    _stringValue = "";
    _memoValue = "";
    _switchValue = false;
    _formKey.currentState!.reset();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            const BackgroundAppBar(),
            const TitleAppBar(),
            ButtonBackAppBar(onPressed: () => GoRouter.of(context).go(RoutesConstant.kRouteHome)),
            Positioned(
              left: 0.0,
              top: 110.0,
              right: 0.0,
              bottom: 0.0,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: WindowCard(
                      title: TextsConstant.kTitleScreenFormDivers,
                      children: <Widget>[
                        TextFormFieldTypeInt(controller: _intController, labelText: "labelText", hintText: "hintText", onSave: (value) => _intValue = value),
                        TextFormFieldTypeDouble(controller: _doubleController, labelText: "labelText", hintText: "hintText", onSave: (value) => _doubleValue = value),
                        TextFormFieldTypeString(controller: _stringController, labelText: "labelText", hintText: "hintText", onSave: (value) => _stringValue = value),
                        TextFormFieldTypeMemo(controller: _memoController, labelText: "labelText", hintText: "hintText", onSave: (value) => _memoValue = value),
                        SwitchLockUnlock(active: _switchValue, labelText: "labelText:", onChanged: (value) => setState(() => _switchValue = value)),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FilledButton(
                              style: ButtonsTheme.filledButtonDefault,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    // Début du traitement ...
                                    EasyLoading.show(status: TextsConstant.kEasyLoadingWaiting);

                                    // Traitement ici je temporise pour l'exemple ...
                                    await Future.delayed(const Duration(seconds: 5), () {
                                      // On attend 5 secondes ...
                                    });

                                    // Sinon je fais ça et je sauve après ...
                                    _formKey.currentState!.save();
                                    // ...
                                    _resetForm();

                                    EasyLoading.dismiss();

                                    if (!context.mounted) return;
                                    SnackBarMessage.show(context: context, message: TextsConstant.kSnacBarDataSaved);
                                  } catch (e) {
                                    if (!context.mounted) return;
                                    EasyLoading.dismiss();
                                    SnackBarMessage.show(context: context, typeMessage: TypeMessage.typeError, message: e.toString());
                                  }
                                }
                              },
                              child: const Text(TextsConstant.kBtnSave),
                            ),
                            FilledButton(
                              style: ButtonsTheme.filledButtonDefault,
                              onPressed: () => _resetForm(),
                              child: const Text(TextsConstant.kBtnReset),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const BackgroundLineBottomBar(),
          ],
        ),
      ),
    );
  }
}

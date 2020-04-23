import 'package:flutter/cupertino.dart';

class FormFieldController {
  final focusNode = FocusNode();
  final textController = TextEditingController();

  String get text => textController.text;

  set text(String value) => textController.text = value;

  void dispose() {
    focusNode.dispose();
    textController.dispose();
  }
}

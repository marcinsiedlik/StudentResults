import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

mixin AppFormsMixin {
  Widget buildFormField({
    @required TextEditingController controller,
    @required FocusNode node,
    TextInputAction textInputAction = TextInputAction.next,
    TextInputType keyboardType = TextInputType.text,
    @required FormFieldValidator<String> validator,
    @required VoidCallback onEditingComplete,
    @required String labelText,
    IconData prefixIcon,
    bool obscureText = false,
    int maxLines = 1,
    int minLines,
    int maxLength,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: node,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      cursorColor: AppColors.colorPrimary,
      validator: validator,
      onEditingComplete: onEditingComplete,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(12))),
        labelText: labelText,
      ),
    );
  }

  validateNick(BuildContext context, String field) {
    final localizations = AppLocalizations.of(context);
    if (field.isEmpty) {
      return localizations.get('validation_empty_field');
    }
    if (field.length < 4) {
      return localizations.get('too_short_nick');
    }
    return null;
  }

  validatePassword(BuildContext context, String field) {
    final localizations = AppLocalizations.of(context);
    if (field.isEmpty) {
      return localizations.get('validation_empty_field');
    }
    if (field.length < 6) {
      return localizations.get('password_to_short');
    }
    return null;
  }

  validateRepeatPassword(BuildContext context, String field, String passwordFiled) {
    final localizations = AppLocalizations.of(context);
    if (field.isEmpty) {
      return localizations.get('validation_empty_field');
    }
    if (field.length < 6) {
      return localizations.get('password_to_short');
    }
    if (field != passwordFiled) {
      return localizations.get('passwords_not_equal');
    }
    return null;
  }

  validateIsEmpty(BuildContext context, String field) {
    final localizations = AppLocalizations.of(context);
    if (field.isEmpty) {
      return localizations.get('validation_empty_field');
    }
    return null;
  }
}

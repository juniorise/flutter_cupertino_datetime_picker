import 'package:flutter/material.dart';

import '../date_picker_constants.dart';
import '../date_picker_theme.dart';
import '../i18n/date_picker_i18n.dart';

/// DatePicker's title widget.
///
/// @author dylan wu
/// @since 2019-05-16
class DatePickerTitleWidget extends StatelessWidget {
  const DatePickerTitleWidget({
    Key? key,
    required this.pickerTheme,
    required this.locale,
    required this.onCancel,
    required this.onConfirm,
  }) : super(key: key);

  final DateTimePickerTheme pickerTheme;
  final DateTimePickerLocale locale;
  final DateVoidCallback onCancel, onConfirm;

  @override
  Widget build(BuildContext context) {
    if (pickerTheme.title != null) {
      return pickerTheme.title!;
    }
    return Container(
      height: pickerTheme.titleHeight,
      decoration: BoxDecoration(color: pickerTheme.backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _renderCancelWidget(context),
          _renderConfirmWidget(context),
        ],
      ),
    );
  }

  /// render cancel button widget
  Widget _renderCancelWidget(BuildContext context) {
    if (isCustomTitleWidget()) {
      // has custom title button widget
      if (pickerTheme.cancel == null) {
        return Offstage();
      }
    }

    Widget? cancelWidget = pickerTheme.cancel;
    if (cancelWidget == null) {
      TextStyle textStyle = pickerTheme.cancelTextStyle ??
          TextStyle(
            color: Theme.of(context).unselectedWidgetColor,
            fontSize: 17.0,
          );
      cancelWidget = Text(
        DatePickerI18n.getLocaleCancel(locale),
        style: textStyle,
      );
    }

    return SizedBox(
      height: pickerTheme.titleHeight,
      child: TextButton(
        child: cancelWidget,
        style: pickerTheme.buttonStyle,
        onPressed: () => onCancel(),
      ),
    );
  }

  /// render confirm button widget
  Widget _renderConfirmWidget(BuildContext context) {
    if (isCustomTitleWidget()) {
      // has custom title button widget
      if (pickerTheme.confirm == null) {
        return Offstage();
      }
    }

    Widget? confirmWidget = pickerTheme.confirm;
    if (confirmWidget == null) {
      TextStyle textStyle = pickerTheme.confirmTextStyle ??
          TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 17.0,
          );
      confirmWidget = Text(
        DatePickerI18n.getLocaleDone(locale),
        style: textStyle,
      );
    }

    return SizedBox(
      height: pickerTheme.titleHeight,
      child: TextButton(
        child: confirmWidget,
        style: pickerTheme.buttonStyle,
        onPressed: () => onConfirm(),
      ),
    );
  }

  bool isCustomTitleWidget() {
    return pickerTheme.cancel != null || pickerTheme.confirm != null || pickerTheme.title != null;
  }
}

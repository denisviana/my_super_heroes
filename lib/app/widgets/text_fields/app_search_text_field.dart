import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/app/styles/app_border_radius.dart';
import 'package:my_app/app/styles/app_color_scheme.dart';
import 'package:my_app/app/styles/app_font_size.dart';
import 'package:my_app/app/styles/app_font_weight.dart';
import 'package:my_app/app/styles/app_spacing.dart';

import '../../../generated/l10n.dart';

class AppSearchTextField extends StatelessWidget {
  final bool isEditing;
  final ValueChanged<String> onChanged;
  final FocusNode? focusNode;
  final TextEditingController editingController;
  final Color? color;

  const AppSearchTextField({
    required this.editingController,
    required this.onChanged,
    this.isEditing = false,
    this.focusNode,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: AppSpacing.medium),
        height: 40,
        decoration: BoxDecoration(
          color: color ?? AppColorScheme.primary,
          borderRadius: AppBorderRadius.small,
          border: Border.all(color: AppColorScheme.border),
        ),
        child: TextField(
          cursorColor: AppColorScheme.emphasis,
          controller: editingController,
          autocorrect: false,
          focusNode: focusNode,
          textCapitalization: TextCapitalization.words,
          style: TextStyle(
              fontWeight: AppFontWeight.semiBold,
              fontSize: AppFontSize.primary,
              color: AppColorScheme.emphasis),
          enabled: isEditing,
          textInputAction: TextInputAction.search,
          keyboardType: TextInputType.name,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: S.of(context).search_placeholder,
            hintStyle: TextStyle(color: AppColorScheme.emphasisLight),
            contentPadding: const EdgeInsets.only(top: AppSpacing.extraTiny),
            border: InputBorder.none,
            suffixIcon: isEditing
                ? Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColorScheme.emphasisLight.withOpacity(0.2),
                    ),
                    child: Icon(
                      Icons.clear_rounded,
                      color: AppColorScheme.emphasis,
                      size: 16,
                    ),
                  )
                : Icon(
                    Icons.search_rounded,
                    color: AppColorScheme.emphasis,
                  ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isEditing', isEditing));
    properties.add(DiagnosticsProperty<TextEditingController>(
        'editingController', editingController));
    properties.add(ColorProperty('color', color));
    properties.add(DiagnosticsProperty<FocusNode?>('focusNode', focusNode));
    properties.add(
        ObjectFlagProperty<ValueChanged<String>>.has('onChanged', onChanged));
  }
}

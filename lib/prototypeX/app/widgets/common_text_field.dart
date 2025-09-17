import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_testing/prototypeX/core/values/app_sizes.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    required this.controller,
    required this.node,
    required this.hintText,
    this.obscureText,
    this.onChanged,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.suffixMargin,
    this.suffixText,
    this.validator,
    this.borderRadius,
    this.borderSide,
    this.textInputAction,
    this.suffixStyle,
    this.prefixText,
    this.prefixStyle,
    this.prefixIconConstraints,
    this.prefixIcon,
    this.prefix,
    this.keyboardType,
    this.cursorColor,
    this.suffix,
    this.autofocus,
    this.readOnly,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final FocusNode node;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final String? hintText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? suffixMargin;
  final String? suffixText;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final String? Function(String?)? validator;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final TextInputType? keyboardType;
  final Color? cursorColor;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffix;
  final Widget? prefix;
  final TextStyle? suffixStyle;
  final TextStyle? prefixStyle;
  final bool? autofocus;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      controller: controller,
      focusNode: node,
      obscureText: obscureText ?? false,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: keyboardType,
      readOnly: readOnly ?? false,
      autofocus: autofocus ?? false,
      cursorColor: cursorColor,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction ?? TextInputAction.next,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(AppSizes.dimenToPx10)),
          borderSide: borderSide ?? BorderSide(width: AppSizes.dimenToPx2, color: Colors.purple.shade200),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixText: suffixText,
        prefixText: prefixText,
        suffix: suffix,
        prefix: prefix,
        suffixStyle: suffixStyle,
        prefixStyle: prefixStyle,
        prefixIconConstraints: prefixIconConstraints,
        suffixIconConstraints: suffixIconConstraints,
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}

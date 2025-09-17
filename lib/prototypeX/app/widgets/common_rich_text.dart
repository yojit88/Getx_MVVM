import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class InlineLinkText extends StatelessWidget {
  const InlineLinkText({
    super.key,
    required this.prefixText,
    required this.linkText,
    required this.onTap,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.underlineLink = false,
  });

  final String prefixText;
  final String linkText;
  final VoidCallback onTap;

  /// Base style for the whole line (falls back to DefaultTextStyle).
  final TextStyle? style;

  /// Style for the link part (merges on top of [style]).
  final TextStyle? linkStyle;

  /// Alignment of the whole text.
  final TextAlign textAlign;

  /// Whether to add a space between prefix and link.

  /// Underline the link text.
  final bool underlineLink;

  @override
  Widget build(BuildContext context) {
    final TextStyle base =
        style ?? DefaultTextStyle.of(context).style.copyWith(fontSize: 14);

    final TextStyle link = (linkStyle ?? base.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.w600,
    )).copyWith(
      decoration: underlineLink ? TextDecoration.underline : TextDecoration.none,
    );

    return Text.rich(
      TextSpan(
        style: base,
        children: [
          TextSpan(text: prefixText),
          TextSpan(
            text: linkText,
            style: link,
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
      textAlign: textAlign,
    );
  }
}

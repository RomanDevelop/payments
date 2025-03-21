import 'package:flutter/material.dart';
import 'payment_method.dart';

/// Widget for selecting payment methods
/// Follows SOLID principles by composing UI from smaller parts
class PaymentMethodSelector extends StatelessWidget {
  final List<PaymentMethod> paymentMethods;
  final String headerText;
  final String? footerText;
  final TextStyle? headerStyle;
  final TextStyle? footerStyle;
  final VoidCallback? onFinish;

  const PaymentMethodSelector({
    Key? key,
    required this.paymentMethods,
    this.headerText = 'Метод оплати',
    this.footerText,
    this.headerStyle,
    this.footerStyle,
    this.onFinish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text(
              headerText,
              style: headerStyle ??
                  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
            ),
          ),

          // Divider
          const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),

          // Payment method cards
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: paymentMethods
                  .map(
                    (method) => PaymentMethodCard(
                      paymentMethod: method,
                    ),
                  )
                  .toList(),
            ),
          ),

          // Divider
          if (footerText != null)
            const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),

          // Optional footer text (terms & conditions)
          if (footerText != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: Text(
                footerText!,
                style: footerStyle ??
                    TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}

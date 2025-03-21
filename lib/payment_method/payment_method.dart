import 'package:flutter/material.dart';

/// Interface for payment methods
abstract class PaymentMethod {
  String get title;
  Widget buildIcon(BuildContext context);
  String? get subtitle;
  Widget? buildTrailing(BuildContext context);
  bool get isSelected;
  void onSelect();
}

/// Base payment method card widget that can be reused
class PaymentMethodCard extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final VoidCallback? onTap;

  const PaymentMethodCard({
    Key? key,
    required this.paymentMethod,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: paymentMethod.isSelected
              ? const Color(0xFFE77600)
              : Colors.grey.shade300,
          width: paymentMethod.isSelected ? 1.5 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: ListTile(
        onTap: onTap ?? paymentMethod.onSelect,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        dense: true,
        leading: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: paymentMethod.buildIcon(context),
        ),
        title: Text(
          paymentMethod.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: paymentMethod.subtitle != null
            ? Text(
                paymentMethod.subtitle!,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              )
            : null,
        trailing: paymentMethod.buildTrailing(context),
      ),
    );
  }
}

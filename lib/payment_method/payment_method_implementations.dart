import 'package:flutter/material.dart';
import 'payment_method.dart';

/// Credit Card Payment Method implementation
class CreditCardPaymentMethod implements PaymentMethod {
  final String cardNumber;
  final bool _isSelected;
  final Function() _onSelect;

  CreditCardPaymentMethod({
    required this.cardNumber,
    required bool isSelected,
    required Function() onSelect,
  })  : _isSelected = isSelected,
        _onSelect = onSelect;

  @override
  String get title => 'Платіжна картка';

  @override
  Widget buildIcon(BuildContext context) {
    return Image.asset(
      'assets/mastercard.png',
      width: 40,
      height: 40,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 25,
                  height: 25,
                  margin: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  String? get subtitle => _formatCardNumber(cardNumber);

  String _formatCardNumber(String cardNumber) {
    // Format as shown in the image
    if (cardNumber.length >= 10) {
      final firstPart = cardNumber.substring(0, 6);
      final lastPart = cardNumber.substring(cardNumber.length - 4);
      return '$firstPart******$lastPart';
    }
    return cardNumber;
  }

  @override
  Widget? buildTrailing(BuildContext context) {
    return const Text(
      'ВАРІАНТИ',
      style: TextStyle(
        color: Color(0xFF168570),
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
    );
  }

  @override
  bool get isSelected => _isSelected;

  @override
  void onSelect() => _onSelect();
}

/// Google Pay Payment Method implementation
class GooglePayPaymentMethod implements PaymentMethod {
  final bool _isSelected;
  final Function() _onSelect;

  GooglePayPaymentMethod({
    required bool isSelected,
    required Function() onSelect,
  })  : _isSelected = isSelected,
        _onSelect = onSelect;

  @override
  String get title => 'Google Pay';

  @override
  Widget buildIcon(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Image.asset(
        'assets/google_pay.png',
        width: 32,
        height: 32,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: const Center(
              child: Text(
                'G',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  String? get subtitle => null;

  @override
  Widget? buildTrailing(BuildContext context) => null;

  @override
  bool get isSelected => _isSelected;

  @override
  void onSelect() => _onSelect();
}

/// BLIK Payment Method implementation
class BlikPaymentMethod implements PaymentMethod {
  final bool _isSelected;
  final Function() _onSelect;

  BlikPaymentMethod({
    required bool isSelected,
    required Function() onSelect,
  })  : _isSelected = isSelected,
        _onSelect = onSelect;

  @override
  String get title => 'BLIK';

  @override
  Widget buildIcon(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(4),
      child: Image.asset(
        'assets/blik.png',
        width: 32,
        height: 32,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 32,
            height: 32,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Center(
              child: Text(
                'blik',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  String? get subtitle => null;

  @override
  Widget? buildTrailing(BuildContext context) => null;

  @override
  bool get isSelected => _isSelected;

  @override
  void onSelect() => _onSelect();
}

/// Transfer Payment Method implementation
class TransferPaymentMethod implements PaymentMethod {
  final bool _isSelected;
  final Function() _onSelect;

  TransferPaymentMethod({
    required bool isSelected,
    required Function() onSelect,
  })  : _isSelected = isSelected,
        _onSelect = onSelect;

  @override
  String get title => 'Переказ';

  @override
  Widget buildIcon(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey.shade100,
      ),
      child: const Icon(
        Icons.account_balance_wallet_outlined,
        color: Colors.grey,
        size: 24,
      ),
    );
  }

  @override
  String? get subtitle => null;

  @override
  Widget? buildTrailing(BuildContext context) => null;

  @override
  bool get isSelected => _isSelected;

  @override
  void onSelect() => _onSelect();
}

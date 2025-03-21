import 'package:flutter/material.dart';
import 'payment_method.dart';
import 'payment_method_implementations.dart';
import 'payment_selector_widget.dart';

/// Example page showing the payment selector in action
class PaymentSelectorPage extends StatefulWidget {
  const PaymentSelectorPage({Key? key}) : super(key: key);

  @override
  State<PaymentSelectorPage> createState() => _PaymentSelectorPageState();
}

class _PaymentSelectorPageState extends State<PaymentSelectorPage> {
  int _selectedMethodIndex = 0;
  late List<PaymentMethod> _paymentMethods;

  @override
  void initState() {
    super.initState();
    _initPaymentMethods();
  }

  void _initPaymentMethods() {
    _paymentMethods = [
      CreditCardPaymentMethod(
        cardNumber: '5351294863',
        isSelected: _selectedMethodIndex == 0,
        onSelect: () => _selectPaymentMethod(0),
      ),
      GooglePayPaymentMethod(
        isSelected: _selectedMethodIndex == 1,
        onSelect: () => _selectPaymentMethod(1),
      ),
      BlikPaymentMethod(
        isSelected: _selectedMethodIndex == 2,
        onSelect: () => _selectPaymentMethod(2),
      ),
      TransferPaymentMethod(
        isSelected: _selectedMethodIndex == 3,
        onSelect: () => _selectPaymentMethod(3),
      ),
    ];
  }

  void _selectPaymentMethod(int index) {
    setState(() {
      _selectedMethodIndex = index;
      _initPaymentMethods(); // Recreate payment methods with updated selection
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Оплата'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PaymentMethodSelector(
              paymentMethods: _paymentMethods,
              footerText:
                  'Оплачуючи, ви приймаєте Положення та умови Allegro Finance.',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle payment processing
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Оплата через ${_paymentMethods[_selectedMethodIndex].title}',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                'Продовжити',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

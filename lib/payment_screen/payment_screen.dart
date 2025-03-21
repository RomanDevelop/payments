import 'package:flutter/material.dart';
import '../payment_method/payment_method.dart';
import '../payment_method/payment_method_implementations.dart';
import '../payment_method/payment_selector_widget.dart';

class PaymentScreen extends StatefulWidget {
  final double amount;
  final double commission;

  const PaymentScreen({
    Key? key,
    this.amount = 1500.0,
    this.commission = 0.0,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
      _initPaymentMethods();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Нова оплата',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Amount field
              _buildTextField(
                label: 'Сума',
                value: widget.amount.toString(),
                showCurrency: true,
              ),

              const SizedBox(height: 12),

              // Commission field
              _buildTextField(
                label: 'Комісійний тариф',
                value: widget.commission.toStringAsFixed(2),
                showCurrency: true,
              ),

              const SizedBox(height: 16),
              const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
              const SizedBox(height: 16),

              // Payment methods section
              PaymentMethodSelector(
                paymentMethods: _paymentMethods,
                footerText:
                    'Оплачуючи, ви приймаєте Положення та умови Allegro Finance.',
                headerText: 'Метод оплати',
              ),

              const SizedBox(height: 16),

              // Total amount
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Всього до сплати:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.amount.toStringAsFixed(0),
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                '.${widget.amount.toStringAsFixed(2).split('.')[1]}₴',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Pay button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Оплата через ${_paymentMethods[_selectedMethodIndex].title}',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00967D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'СПЛАТИТИ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String value,
    bool showCurrency = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (showCurrency)
                Text(
                  '₴',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

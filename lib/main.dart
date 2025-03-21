import 'package:flutter/material.dart';
import 'payment_screen/payment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Ways',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const PaymentScreen(
        amount: 1500.0,
        commission: 0.0,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

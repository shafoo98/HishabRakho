import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:hishab_rakho/models/wallet.dart';
import 'package:provider/provider.dart';

class WalletsPieChart extends StatefulWidget {
  @override
  _WalletsPieChartState createState() => _WalletsPieChartState();
}

class _WalletsPieChartState extends State<WalletsPieChart> {
  @override
  Widget build(BuildContext context) {
    final allWallets = Provider.of<List<Wallet>>(context) ?? [];
    Map<String, double> dataMap;
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
      ),
    );
  }
}

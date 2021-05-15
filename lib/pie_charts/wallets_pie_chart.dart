import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:hishab_rakho/models/wallet.dart';
import 'package:provider/provider.dart';

class WalletsPieChart extends StatefulWidget {
  final String uid;
  WalletsPieChart({this.uid});
  @override
  _WalletsPieChartState createState() => _WalletsPieChartState(uid: uid);
}

class _WalletsPieChartState extends State<WalletsPieChart> {
  final String uid;
  _WalletsPieChartState({this.uid});
  int sumOfAllWallets({List<Wallet> walletsList}) {
    int sumOfWallets = 0;
    for (var i = 0; i < walletsList.length; i++) {
      sumOfWallets = sumOfWallets + walletsList.elementAt(i).walletValue;
    }
    return sumOfWallets;
  }

  @override
  Widget build(BuildContext context) {
    final allWallets = Provider.of<List<Wallet>>(context);
    int sumOfWallets = sumOfAllWallets(walletsList: allWallets);
    Map<String, double> dataMap = Map.fromIterable(allWallets,
        key: (wallet) => wallet.walletName.toString(),
        value: (wallet) => wallet.walletValue.toDouble());
    return Container(
      color: Color.fromRGBO(204, 222, 232, 0.4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.095,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.025),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.005,
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                elevation: 5.0,
                child: Text(
                  " Total : \$ " + sumOfWallets.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.035),
            child: PieChart(
              dataMap: dataMap ?? 0,
              centerText: 'Wallets',
              chartType: ChartType.ring,
              ringStrokeWidth: 25.0,
              chartLegendSpacing: 48,
              chartRadius: MediaQuery.of(context).size.width / 1.5,
              chartValuesOptions: ChartValuesOptions(
                showChartValues: false,
              ),
              legendOptions: LegendOptions(
                showLegendsInRow: true,
                legendPosition: LegendPosition.bottom,
                showLegends: true,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

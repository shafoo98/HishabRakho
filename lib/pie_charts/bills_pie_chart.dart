import 'package:flutter/material.dart';
import 'package:hishab_rakho/models/bill.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class BillsPieChart extends StatefulWidget {
  final String uid;
  BillsPieChart({this.uid});
  @override
  _BillsPieChartState createState() => _BillsPieChartState(uid: uid);
}

class _BillsPieChartState extends State<BillsPieChart> {
  final String uid;
  _BillsPieChartState({this.uid});
  int sumOfAllBills({List<Bill> billsList}) {
    int sumOfBills = 0;
    for (var i = 0; i < billsList.length; i++) {
      sumOfBills = sumOfBills + billsList.elementAt(i).billValue;
    }
    return sumOfBills;
  }

  @override
  Widget build(BuildContext context) {
    final allBills = Provider.of<List<Bill>>(context) ?? [];
    int sumOfBills = sumOfAllBills(billsList: allBills);
    Map<String, double> dataMap = Map.fromIterable(allBills,
        key: (bill) => bill.billName.toString(),
        value: (bill) => bill.billValue.toDouble());
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
                color: Color.fromRGBO(56, 198, 126, 0.75),
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
                  " Bills Total: \$" + sumOfBills.toString(),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 2.0,
                      height: 1.5,
                      fontSize: 25.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.035),
            child: Expanded(
              child: PieChart(
                dataMap: dataMap ?? 0,
                centerText: 'Bills',
                chartType: ChartType.ring,
                ringStrokeWidth: 25.0,
                chartLegendSpacing: 48,
                chartRadius: MediaQuery.of(context).size.width / 1.5,
                chartValuesOptions: ChartValuesOptions(
                  showChartValues: false,
                  chartValueStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                    backgroundColor: Colors.blue[50],
                  ),
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
          ),
        ],
      ),
    );
  }
}

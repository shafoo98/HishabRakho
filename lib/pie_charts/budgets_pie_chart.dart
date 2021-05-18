import 'package:flutter/material.dart';
import 'package:hishab_rakho/models/budget.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class BudgetsPieChart extends StatefulWidget {
  final String uid;
  BudgetsPieChart({this.uid});
  @override
  _BudgetsPieChartState createState() => _BudgetsPieChartState(uid: uid);
}

class _BudgetsPieChartState extends State<BudgetsPieChart> {
  final String uid;
  _BudgetsPieChartState({this.uid});
  int sumOfAllBudgets({List<Budget> budgetsList}) {
    int sumOfBudgets = 0;
    for (var i = 0; i < budgetsList.length; i++) {
      sumOfBudgets = sumOfBudgets + budgetsList.elementAt(i).budgetValue;
    }
    return sumOfBudgets;
  }

  @override
  Widget build(BuildContext context) {
    final allBudgets = Provider.of<List<Budget>>(context) ?? [];
    int sumOfBudgets = sumOfAllBudgets(budgetsList: allBudgets);
    Map<String, double> dataMap = Map.fromIterable(allBudgets,
        key: (budget) => budget.budgetName.toString(),
        value: (budget) => budget.budgetValue.toDouble());
    return dataMap.isEmpty
        ? Container(
            child: Center(
              child: Text(
                'No budgets found',
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        : Container(
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
                        " Budgets Total: \$" + sumOfBudgets.toString(),
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.1),
                    child: PieChart(
                      dataMap: dataMap ?? 0,
                      centerText: 'Budgets',
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

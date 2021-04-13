import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hishab_rakho/models/budget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BudgetTile extends StatelessWidget {
  final Budget budget;
  BudgetTile({this.budget});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: Card(
        elevation: 5.0,
        color: Colors.blue[50],
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, size.height * 0.005),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 1 / 4,
          actions: [
            IconSlideAction(
              caption: 'Share',
              color: Colors.white,
              icon: Icons.share,
              onTap: () => print("Shared"),
            ),
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () => print('Deleted'),
            ),
            IconSlideAction(
              caption: 'Edit',
              color: Colors.green,
              icon: Icons.edit,
              onTap: () => print("Edit"),
            ),
          ],
          child: ListTile(
            leading: Icon(Icons.assessment),
            title: Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.005),
              child: Text(budget.budgetName),
            ),
            subtitle: LinearPercentIndicator(
              percent: 0.5,
              center: Text("\$ " + '${budget.budgetValue}'),
              lineHeight: size.height * 0.025,
              animation: true,
              animationDuration: 2500,
              progressColor: Colors.green,
              linearStrokeCap: LinearStrokeCap.roundAll,
              animateFromLastPercent: true,
            ),
            onTap: () {
              showDialog(
                context: context,
                child: AlertDialog(
                  title: Text(budget.budgetName),
                  content: Text(budget.budgetDescription +
                      '\n \n' +
                      'Amount: ' +
                      budget.budgetValue.toString()),
                  elevation: 5.0,
                  actions: [
                    FlatButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

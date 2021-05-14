import 'package:flutter/material.dart';
import 'package:hishab_rakho/models/budget.dart';

class SharedBudgetTile extends StatelessWidget {
  final Budget budget;
  final String uid;
  SharedBudgetTile({this.budget, this.uid});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: Card(
        elevation: 1.0,
        color: Colors.green[100],
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, size.height * 0.005),
        child: ListTile(
          leading: Icon(Icons.attach_money),
          title: Text(budget.budgetName),
          subtitle: Text("\$ " + '${budget.budgetValue}'),
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
    );
  }
}

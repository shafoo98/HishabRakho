import 'package:flutter/material.dart';
import 'package:hishab_rakho/pie_charts/accounts_pie_charts.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      scrollDirection: Axis.vertical,
      controller: controller,
      children: <Widget>[
        Center(
          child: AccountsPieChart(),
        ),
        Center(
          child: Text('Second Page'),
        ),
        Center(
          child: Text('Third Page'),
        ),
        Center(
          child: Text('Fourth Page'),
        )
      ],
    );
  }
}

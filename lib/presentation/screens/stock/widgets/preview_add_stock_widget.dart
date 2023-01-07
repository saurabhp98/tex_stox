import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PreviewAddStockWidget extends StatelessWidget {
  const PreviewAddStockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          children: [
            Row(
              children: [
                Table(
                  children: [
                    TableRow(
                        children: [Text('Inovice No.'), Text('2022-23/123')])
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

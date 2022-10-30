import 'package:flutter/material.dart';

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
      ),
    );
  }
}

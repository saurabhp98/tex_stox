import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/strings.dart';
import '../../../cubit/dashboard_cubit/dashboard_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.greenAccent),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RouteConstants.kAddStockRoute);
                },
                child: Text('Add Stock')),
          ),
          FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return BottomSheetAdd();
                  });
            },
            child: Icon(Icons.add),
          ),
          ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                )),
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
              ),
              onPressed: () {},
              child: Text('Sale Stock')),
        ],
      ),
    );
  }
}

class BottomSheetAdd extends StatelessWidget {
  const BottomSheetAdd({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomSheetElement(
                  onTap: () {},
                  elementName: 'Add Item',
                  iconData: Icons.category,
                ),
                BottomSheetElement(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteConstants.kAddClientRoute);
                  },
                  elementName: 'Add Client',
                  iconData: Icons.person,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomSheetElement(
                    onTap: () {},
                    elementName: 'Purchase GR',
                    iconData: Icons.assignment_return),
                BottomSheetElement(
                    onTap: () {},
                    elementName: 'Sale Return',
                    iconData: Icons.assignment_returned),
              ],
            ),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close))
          ]),
    );
  }
}

class BottomSheetElement extends StatelessWidget {
  final String elementName;
  final IconData iconData;
  final Function() onTap;
  const BottomSheetElement(
      {Key? key,
      required this.elementName,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 40,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blueGrey,
        ),
        child: Column(
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            Text(
              elementName,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

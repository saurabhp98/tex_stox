import 'package:flutter/material.dart';

class DrawerElement extends StatelessWidget {
  const DrawerElement(
      {Key? key,
      required this.context,
      required this.elementName,
      required this.icon,
      required this.navigatorFunction})
      : super(key: key);
  final String elementName;
  final IconData icon;
  final BuildContext context;
  final Function() navigatorFunction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigatorFunction,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                )),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      icon,
                      color: Colors.black54,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(elementName,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

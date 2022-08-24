import 'package:flutter/material.dart';
import 'package:tex_stox/constants/strings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawerSideBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Colors.white,
          // leading:
          //     InkWell(onTap: () {}, child: Icon(Icons.menu, color: Colors.grey)),
          centerTitle: true,
          title: Text("TexStox", style: TextStyle(color: Colors.blueGrey)),
        ),
        bottomNavigationBar: BottomNavBar(),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8, left: 8, right: 4, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: EdgeInsets.only(
                            bottom: 8, left: 8, right: 4, top: 8),
                        height: double.infinity,
                        child: Text('hi'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 4, top: 8, bottom: 8, right: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: double.infinity,
                        child: Text('hello'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                    child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Icon(Icons.search, size: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 40,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ))
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
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
                        Text(
                          'Sort No.',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('Grade',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text('mtr',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              flex: 2,
              child: ListView(children: [
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
                StockDetailsWidget(),
              ]),
            ),
          ],
        ));
  }

  Drawer drawerSideBar() {
    return Drawer(
      child: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.blueGrey,
                  child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('TexStox',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        width: 50,
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    DrawerElement(
                      navigatorFunction: () {},
                      context: context,
                      elementName: "Dashboard",
                      icon: Icons.dashboard,
                    ),
                    DrawerElement(
                        navigatorFunction: () {
                          Navigator.pushNamed(context, kClientPageRoute);
                        },
                        context: context,
                        elementName: "Client",
                        icon: Icons.person),
                    DrawerElement(
                        navigatorFunction: () {},
                        context: context,
                        elementName: 'Items',
                        icon: Icons.category),
                    DrawerElement(
                        navigatorFunction: () {},
                        context: context,
                        elementName: 'Inventory',
                        icon: Icons.inventory),
                    DrawerElement(
                        navigatorFunction: () {},
                        context: context,
                        elementName: 'Sale',
                        icon: Icons.sell),
                    DrawerElement(
                        navigatorFunction: () {},
                        context: context,
                        elementName: 'Purchase',
                        icon: Icons.shopping_bag),
                    DrawerElement(
                        navigatorFunction: () {},
                        context: context,
                        elementName: 'Goods Return',
                        icon: Icons.assignment_return)
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                          color: Colors.grey,
                          width: 2,
                        )),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.settings,
                              color: Colors.black54,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Settings",
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
              )
            ],
          ))
        ],
      )),
    );
  }
}

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
                onPressed: () {},
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
                    Navigator.pushNamed(context, kAddClientRoute);
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

class StockDetailsWidget extends StatelessWidget {
  const StockDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width - 20,
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
                Text('2101'),
                Text('A+'),
                Text('35'),
              ],
            ),
          ),
        )
      ],
    );
  }
}

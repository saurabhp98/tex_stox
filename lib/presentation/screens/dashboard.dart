import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tex_stox/constants/strings.dart';
import 'package:tex_stox/cubit/dashboard_cubit/dashboard_cubit.dart';
import 'package:tex_stox/data/models/dashboard_model.dart';
import 'package:tex_stox/data/services/dashboard_services.dart';

import '../widgets/bottom_navbar.dart';
import '../widgets/drawer_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DashboardCubit>(context).fetchDashboardData();
    return Scaffold(
        // sidebar drawer
        drawer: drawerSideBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("TexStox", style: TextStyle(color: Colors.blueGrey)),
        ),
        bottomNavigationBar: BottomNavBar(),
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            if (state is! DashboardLoaded) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final currentStockData = state.currentStockMtr;

            return Column(
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
                              child: Column(
                                children: [
                                  Text(
                                    'Current Stock',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  StreamBuilder<dynamic>(
                                      stream: state.currentStockMtr,
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                        return Text(
                                          snapshot.data.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        );
                                      })
                                ],
                              )),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Sold Meter',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                StreamBuilder<dynamic>(
                                    stream: state.soldStockMtr,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                      return Text(
                                        snapshot.data.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      );
                                    }),
                              ],
                            ),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                  child: StreamBuilder<List<DashboardModel>>(
                      stream: state.dashboardList,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ListView(
                            children: snapshot.data!
                                .map((e) => StockDetailsWidget(
                                    grade: e.grade,
                                    mtr: '${e.mtr}',
                                    sortName: e.sort_name))
                                .toList());
                      }),
                ),
              ],
            );
          },
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
                        navigatorFunction: () {
                          Navigator.pushNamed(context, kItemScreenRoute);
                        },
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

class StockDetailsWidget extends StatelessWidget {
  StockDetailsWidget(
      {Key? key,
      required this.grade,
      required this.mtr,
      required this.sortName})
      : super(key: key);
  String sortName;
  String grade;
  String mtr;
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
                Text(sortName),
                Text(grade),
                Text(mtr),
              ],
            ),
          ),
        )
      ],
    );
  }
}

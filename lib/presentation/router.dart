import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tex_stox/cubit/client_cubit/add_client_cubit.dart';
import 'package:tex_stox/cubit/client_cubit/client_cubit_cubit.dart';
import 'package:tex_stox/cubit/client_cubit/edit_client_cubit.dart';
import 'package:tex_stox/cubit/item_cubit/item_cubit.dart';
import 'package:tex_stox/cubit/purchase_cubit/purchase_cubit.dart';
import 'package:tex_stox/cubit/stock_cubit/stock_cubit.dart';
import 'package:tex_stox/cubit/transport_cubit/transport_cubit.dart';
import 'package:tex_stox/data/repository/client_repository.dart';
import 'package:tex_stox/data/repository/dashboard_repository.dart';
import 'package:tex_stox/data/repository/item_repository.dart';
import 'package:tex_stox/data/repository/transport_repository.dart';

import 'package:tex_stox/presentation/screens/client/add_client.dart';
import 'package:tex_stox/presentation/screens/client/client_screen.dart';
import 'package:tex_stox/presentation/screens/client/edit_client.dart';

import 'package:tex_stox/presentation/screens/app.dart';
import 'package:tex_stox/presentation/screens/dashboard/dashboard.dart';

import 'package:tex_stox/presentation/screens/items/item_screen.dart';
import 'package:tex_stox/presentation/screens/stock/add_stock_screen.dart';

import 'package:tex_stox/presentation/screens/stock/stock_screen.dart';

import '../constants/strings.dart';
import '../cubit/dashboard_cubit/dashboard_cubit.dart';
import '../data/models/ClientModel.dart';
import '../data/repository/purchase_repository.dart';
import '../data/repository/stock_repository.dart';
import '../data/services/stock_services.dart';

class AppRouter {
  late ClientRepository clientRepository;
  late ClientCubitCubit clientCubit;
  late DashboardRepository dashboardRepository;
  late PurchaseRepository purchaseRepository;

  late TransportRepository transportRepository;
  late StockRepository stockRepository;
  late ItemRepository itemRepository;
  late StockCubit stockCubit;
  late StockServices stockServices;
  late PurchaseCubit purchaseCubit;

  AppRouter() {
    // initializigng the client Repository
    // for further use of the Repository in any of the page
    clientRepository = ClientRepository();
    dashboardRepository = DashboardRepository();
    purchaseRepository = PurchaseRepository();
    transportRepository = TransportRepository();
    stockRepository = StockRepository();
    itemRepository = ItemRepository();
    purchaseCubit = PurchaseCubit(purchaseRepository: purchaseRepository);

    // initializing the clientCubit
    // for further use of the client cubit
    stockCubit = StockCubit(
        stockRepository: stockRepository, purchaseCubit: purchaseCubit);
    clientCubit = ClientCubitCubit(clientRepository: clientRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            // BlocProvider.value takes an initialised cubit or bloc object
            // so it does not closes the Bloc because its not been created by itself
            // it just provides the instance of an object for further use.

            builder: (_) => BlocProvider.value(
                  value: clientCubit,
                  child: App(),
                ));
      case RouteConstants.kClientPageRoute:
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(value: clientCubit, child: ClientScreen()));
      case RouteConstants.kDashBoard:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      DashboardCubit(dashboardRepository: dashboardRepository),
                  child: Dashboard(),
                ));
      case RouteConstants.kAddClientRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  // provideing the client repository and client cubit to the addclient
                  // so that its state can be accessed and changed accordingly.

                  create: (BuildContext context) => AddClientCubit(
                      clientRepository: clientRepository,
                      clientCubit: clientCubit),
                  child: AddClient(),
                ));
      case RouteConstants.kEditClientRoute:
        ClientModel client = settings.arguments as ClientModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => EditClientCubit(
                  clientCubit: clientCubit, clientRepository: clientRepository),
              child: EditClient(
                clientFromClientScreen: client,
              )),
        );

      case RouteConstants.kItemScreenRoute:
        return MaterialPageRoute(builder: (_) => ItemScreen());

      case RouteConstants.kAddStockRoute:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: purchaseCubit,
                    ),
                    BlocProvider<TransportCubit>(
                      create: (context) => TransportCubit(
                          transportRepository: transportRepository),
                    ),
                    BlocProvider<ClientCubitCubit>(
                      create: (context) =>
                          ClientCubitCubit(clientRepository: clientRepository),
                    ),
                    BlocProvider.value(value: stockCubit),
                    BlocProvider<ItemCubit>(
                      create: (context) =>
                          ItemCubit(itemRepository: itemRepository),
                    )
                  ],
                  child: AddStock(),
                ));

      default:
        return null;
    }
  }
}

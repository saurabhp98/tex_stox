import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tex_stox/cubit/client_cubit/add_client_cubit.dart';
import 'package:tex_stox/cubit/client_cubit/client_cubit_cubit.dart';
import 'package:tex_stox/cubit/client_cubit/edit_client_cubit.dart';
import 'package:tex_stox/data/repository/client_repository.dart';
import 'package:tex_stox/presentation/screens/add_client.dart';
import 'package:tex_stox/presentation/screens/client_screen.dart';
import 'package:tex_stox/presentation/screens/app.dart';
import 'package:tex_stox/presentation/screens/dashboard.dart';
import 'package:tex_stox/presentation/screens/edit_client.dart';

import '../constants/strings.dart';
import '../data/models/ClientModel.dart';

class AppRouter {
  late ClientRepository clientRepository;
  late ClientCubitCubit clientCubit;
  AppRouter() {
    // initializigng the client Repository
    // for further use of the Repository in any of the page
    clientRepository = ClientRepository();
    // initializing the clientCubit
    // for further use of the client cubit
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
      case kClientPageRoute:
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider.value(value: clientCubit, child: ClientScreen()));
      case kDashBoard:
        return MaterialPageRoute(builder: (_) => Dashboard());
      case kAddClientRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  // provideing the client repository and client cubit to the addclient
                  // so that its state can be accessed and changed accordingly.

                  create: (BuildContext context) => AddClientCubit(
                      clientRepository: clientRepository,
                      clientCubit: clientCubit),
                  child: AddClient(),
                ));
      case kEditClientRoute:
        ClientModel client = settings.arguments as ClientModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => EditClientCubit(
                  clientCubit: clientCubit, clientRepository: clientRepository),
              child: EditClient(
                clientFromClientScreen: client,
              )),
        );

      default:
        return null;
    }
  }
}

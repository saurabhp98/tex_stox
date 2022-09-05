import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tex_stox/constants/strings.dart';
import 'package:tex_stox/cubit/client_cubit/client_cubit_cubit.dart';
import 'package:tex_stox/data/repository/client_repository.dart';
import '../../data/models/ClientModel.dart';
import '../../data/services/client_services.dart';

class ClientScreen extends StatelessWidget {
  ClientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ClientCubitCubit>(context)
        .fetchClientsFromClientRepository();

    return Scaffold(
        appBar: AppBar(
          title: Text('TexStox', style: TextStyle(color: Colors.blueGrey)),
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, kAddClientRoute);
                  },
                  child: Icon(Icons.add)),
            ),
          ],
        ),
        body: BlocBuilder<ClientCubitCubit, ClientCubitState>(
          builder: (context, state) {
            if (state is! ClientsLoaded) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final clients = state.clientModel;
            return BlocBuilder<ClientCubitCubit, ClientCubitState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    children: clients!
                        .map((client) => _clientList(client, context))
                        .toList(),
                  ),
                );
              },
            );
          },
        ));
  }
}

Widget _clientList(ClientModel client, context) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, arguments: client, kEditClientRoute);
    },
    child: Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade100)),
                Text("${client.name}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade100))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mobile",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade100)),
                Text("${client.mobileNumber}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade100))
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

// class ClientList extends StatelessWidget {
//   List<ClientModel> clientListToUse;
//   ClientList({required this.clientListToUse});
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child:
//     );
//   }
// }

// class ClientListToUse extends StatelessWidget {
//   const ClientListToUse({
//     Key? key,
//     required this.name,
//     required this.mobNumber,
//     required this.purchase,
//     required this.sale,
//   }) : super(key: key);

//   final String name;
//   final String mobNumber;
//   final String purchase;
//   final String sale;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(3),
//       decoration: BoxDecoration(
//           color: Colors.amberAccent,
//           borderRadius: BorderRadius.all(Radius.circular(10))),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               children: [Text(name), Text(mobNumber)],
//             ),
//             Column(
//               children: [Text("Purchase"), Text(purchase)],
//             ),
//             Column(
//               children: [Text("Sale"), Text(sale)],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

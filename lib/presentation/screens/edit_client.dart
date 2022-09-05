import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tex_stox/cubit/client_cubit/edit_client_cubit.dart';
import 'package:tex_stox/presentation/screens/app.dart';

import '../../data/models/ClientModel.dart';

class EditClient extends StatelessWidget {
  ClientModel clientFromClientScreen;
  EditClient({Key? key, required this.clientFromClientScreen})
      : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();
  String name = "";
  int number = 0;
  String address = "";
  String email = "";
  String gst_id = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Client'),
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
      ),
      body: BlocListener<EditClientCubit, EditClientState>(
        listener: (context, state) {
          if (state is ClientEdited) {
            Navigator.pop(context);
          } else if (state is ClientDeleted) {}
          Navigator.pop(context);
        },
        child: Center(
          child: Form(
              // form has key value which could be passed by inilising it in the
              // state of the current context.by GlobalKey
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (value) {
                      print(value);
                      name = value!;
                    },
                    initialValue: "${clientFromClientScreen.name}",
                    decoration: InputDecoration(
                      labelText: "Enter Your Name",
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      print(value);
                      number = int.parse(value!);
                    },
                    initialValue: "${clientFromClientScreen.mobileNumber}",
                    decoration:
                        InputDecoration(labelText: "Enter Your Mobile No"),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      print(value);
                      email = value!;
                    },
                    initialValue: "${clientFromClientScreen.email}",
                    decoration: InputDecoration(labelText: "Enter Your Email"),
                  ),
                  TextFormField(
                    // textformfield have onsaved prop which takes an saves the input.
                    onSaved: (value) {
                      address = value!;
                    },
                    initialValue: "${clientFromClientScreen.address}",
                    decoration:
                        InputDecoration(labelText: "Enter Your Address"),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      print(value);
                      gst_id = value!;
                    },
                    initialValue: "${clientFromClientScreen.gst_id}",
                    decoration: InputDecoration(labelText: "Enter Your GSTIN"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            // one can take the those input via formkey.curretnState
                            // and can validate it using its parameters
                            // Then it can be send for the save method
                            // and it will initialised onSaved proverty callback
                            // to do the operations like assigning the form value to
                            // the new variable

                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState?.save();
                            }

                            // now those input and assigned variable can be passed to
                            // to the Cubit by Casging them with the represented.
                            BlocProvider.of<EditClientCubit>(context)
                                .editClientFromEditScreen(
                                    ClientModel(
                                        name: name,
                                        mobileNumber: number,
                                        address: address,
                                        email: email,
                                        gst_id: gst_id),
                                    clientFromClientScreen.id);
                          },
                          child: Text("Edit")),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red)),
                          onPressed: () {
                            BlocProvider.of<EditClientCubit>(context)
                                .deleteClient(clientFromClientScreen.id);
                          },
                          child: Text('Delete'))
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

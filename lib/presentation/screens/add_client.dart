import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tex_stox/constants/strings.dart';
import 'package:tex_stox/cubit/client_cubit/add_client_cubit.dart';
import 'package:tex_stox/cubit/client_cubit/client_cubit_cubit.dart';
import 'package:tex_stox/data/services/client_services.dart';

import '../../data/models/ClientModel.dart';

class AddClient extends StatefulWidget {
  AddClient({Key? key}) : super(key: key);

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String name = "";
  int number = 0;
  String address = "";
  String email = "";
  String gst_id = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // adding the bloclistner for accessing the state and changing it
      body: BlocListener<AddClientCubit, AddClientState>(
        listener: (context, state) {
          if (state is ClientAdded) {
            Navigator.pop(context);
          }
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
                    decoration: InputDecoration(labelText: "Enter Your Name"),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      print(value);
                      number = int.parse(value!);
                    },
                    decoration:
                        InputDecoration(labelText: "Enter Your Mobile No"),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      print(value);
                      email = value!;
                    },
                    decoration: InputDecoration(labelText: "Enter Your Email"),
                  ),
                  TextFormField(
                    // textformfield have onsaved prop which takes an saves the input.
                    onSaved: (value) {
                      address = value!;
                    },
                    decoration:
                        InputDecoration(labelText: "Enter Your Address"),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      print(value);
                      gst_id = value!;
                    },
                    decoration: InputDecoration(labelText: "Enter Your GSTIN"),
                  ),
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
                        BlocProvider.of<AddClientCubit>(context)
                            .addClientFromClient(ClientModel(
                                name: name,
                                mobileNumber: number,
                                address: address,
                                email: email,
                                gst_id: gst_id));
                      },
                      child: Text("Submit"))
                ],
              )),
        ),
      ),
    );
  }
}

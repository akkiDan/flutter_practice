import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';
class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Form Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                validator: (value)
                {
                  return !Util.validateEmail(value)? "Invalid Email" :null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Password"
                ),
                validator:(value)
                {
                  return value.isEmpty? "Inadfsf" : null;
                },
              ),
              RaisedButton(onPressed: () {
                if (formKey.currentState.validate()) {
                  Navigator.pop(context);
                }
              }
              )
            ],
          ),
        ),
      ),
    );
  }
}

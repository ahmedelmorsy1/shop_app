import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            "LOGIN",
            style: Theme.of(context).textTheme.headline5,
          ),
          Text("login now to browse offers",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black),
          ),
          SizedBox(height: 20,),
          TextFormField(
          controller: ,
          keyboardType: TextInputType.emailAddress,
          validator: (String? value){
            if(value =='')return 'please enter your email address';
          },
          initialValue: 'email address',
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:prueba/src/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  'assets/logo.png',
                  height: 170,
                ),
              ),
              titulo(),
              const SizedBox(
                height: 20,
              ),
              userTextField(),
              const SizedBox(
                height: 20,
              ),
              passwordTextField(),
              const SizedBox(
                height: 20,
              ),
              bottonLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget titulo() {
    return Container(
      height: 45.0,
      child: Image.asset('assets/titulo.jpg'),
      margin: const EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
    );
  }

  Widget userTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
          decoration: const InputDecoration(
            icon: Icon(
              Icons.email,
              color: Colors.green,
            ),
            hintText: 'Correo Electronico',
            labelText: 'Email',
          ),
          validator: (value) => _validatorEmail(value!)),
    );
  }

  _validatorEmail(String value) {
    if (!_isEmail(value)) {
      return 'Escriba su correo electronico';
    }
  }

  bool _isEmail(String str) {
    return _emailRegExp.hasMatch(str.toLowerCase());
  }

  static final RegExp _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$");

  Widget passwordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
          decoration: const InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.green,
            ),
            hintText: 'Contraseña',
            labelText: 'Password',
          ),
          obscureText: true,
          validator: (value) => _validatorPassword(value!)),
    );
  }

  _validatorPassword(String value) {
    if (!_hasMinLenght(value)) {
      return 'Escriba su contraseña';
    }
  }

  bool _hasMinLenght(String value) {
    return value.isNotEmpty && value.length >= 8;
  }

  bottonLogin() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text('Procesando Datos')),
          // );
          Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (BuildContext context) {
              return const DashboardPage();
            }),
          );
        }
      },
      child: const Text('Ingresar'),
    );
  }
}

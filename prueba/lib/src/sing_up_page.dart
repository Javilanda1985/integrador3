import 'package:flutter/material.dart';
import 'package:prueba/src/login_page.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => SingUpPageState();
}

class SingUpPageState extends State<SingUpPage> {
  // ignore: prefer_final_fields
  var _lista = ['Gerente', 'Presidente', 'Administrador'];
  String _vista = 'Seleccione su cargo';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            Flexible(
              child: Image.asset(
                'assets/logo.png',
                height: 200,
              ),
            ),
            titulo(),
            const SizedBox(
              height: 20,
            ),
            correo(),
            password(),
            cargo(),
            const SizedBox(
              height: 40,
            ),
            bottonLogin(),
          ],
        )),
      ),
    );
  }

  Widget cargo() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const SizedBox(
        child: Icon(
          Icons.business_center,
          size: 32.0,
          color: Colors.green,
        ),
        height: 70,
        width: 65,
      ),
      SizedBox(
        child: DropdownButton(
          items: _lista.map((String a) {
            return DropdownMenuItem(value: a, child: Text(a));
          }).toList(),
          onChanged: (_value) => {
            setState(() {
              _vista = _value.toString();
            })
          },
          hint: Text(_vista),
        ),
        height: 50,
        width: 260,
      )
    ]);
  }

  Widget titulo() {
    return Container(
      height: 45.0,
      child: Image.asset('assets/titulo.jpg'),
      margin: const EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
    );
  }

  Widget correo() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshop) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            icon: Icon(
              Icons.email,
              color: Colors.green,
              size: 32.0,
            ),
            labelText: 'Correo',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget password() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshop) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: TextField(
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.green,
              size: 32.0,
            ),
            labelText: 'Contraseña',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget bottonLogin() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshop) {
        return ElevatedButton(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 15.0),
              child: const Text(
                'Registrarse',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (BuildContext context) {
                  return const LoginPage();
                }),
              );
            });
      },
    );
  }
}

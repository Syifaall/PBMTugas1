import 'package:flutter/material.dart';
import 'package:tugas1/page/login_page.dart';

String username = "";
String password = "";

class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Daftar",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    fontSize: 15,)
                  ,
                ),
                SizedBox(
                  height: 24,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Masukan username',
                    labelStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 249, 249, 249)),
                    borderRadius: BorderRadius.circular(16.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(16.0),
                    ),
                  
                  ),
                  onSaved: (value) {
                    username = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Masukan password',
                    labelStyle: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 249, 249, 249)),
                    borderRadius: BorderRadius.circular(16.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  obscureText: true,
                  onSaved: (value) {
                    password = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 36,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Registrasi Berhasil")));

                      Navigator.pushNamed(context, '/login',
                          arguments: {username: username, password: password});
                    }
                  },
                  child: const Text(
                    "Daftar",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

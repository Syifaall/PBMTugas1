import 'package:flutter/material.dart';
import 'package:tugas1/page/register_page.dart';

String logUsername = '';
String logPassword = '';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final String username;
  final String password;

  LoginPage({required this.username, required this.password});

  void _submit(BuildContext context) {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      if (logUsername == username && logPassword == password) {
        Navigator.pushNamed(context, '/home',
            arguments: {'username': username});
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Invalid username or password"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "OK",
                  ),
                ),
              ],
            );
          },
        );
      }
    }
  }

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
                //Text(username),
                //Text(password),
                Text(
                  "WELCOME TO BMI", 
                  style: TextStyle(
                    fontSize: 20.0,
                     fontStyle: FontStyle.italic,
                      foreground: Paint()
                       ..shader = RadialGradient(
                      colors: [Colors.blue, Colors.white],
                       ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                       fontWeight: FontWeight.w600,
                  )
                ),
                Text(
                  "Silahkan Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    fontSize: 15,)
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
                    logUsername = value!;
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
                    logPassword = value!;
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
                  onPressed: () => _submit(context),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Login Berhasil")));
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text("Belum punya akun?")),
                SizedBox(
                  height: 150,
                )

                // ElevatedButton(
                //   onPressed: () {
                //     if (_formKey.currentState!.validate()) {
                //       _formKey.currentState!.save();
                //       ScaffoldMessenger.of(context).showSnackBar(
                //           const SnackBar(content: Text("Berhasil")));

                //       Navigator.pushNamed(context, '/home',
                //           arguments: {username: username});
                //     }
                //   },
                //   child: const Text("Login"),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

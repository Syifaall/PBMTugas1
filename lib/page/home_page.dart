import 'package:flutter/material.dart';
import 'package:tugas1/page/register_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _berat = 0;
  double _tinggi = 0;
  double _bmi = 0;
  String _status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Kalkulator BMI',
        style: TextStyle(
          color: Color.fromARGB(255, 9, 9, 9),
        ))),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Welcome" 
              ", $username",
              style: TextStyle(
                fontSize: 40.0,
                     fontStyle: FontStyle.italic,
                      foreground: Paint()
                       ..shader = RadialGradient(
                      colors: [Colors.blue, Colors.white],
                       ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                       fontWeight: FontWeight.w600,)
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat (kg)',
                fillColor: Colors.white,
                    filled: true,
                    hintText: 'Masukan berat badan',
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
              onChanged: (value) {
                setState(() {
                  _berat = double.tryParse(value) ?? 0;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi (cm)',
                fillColor: Colors.white,
                    filled: true,
                    hintText: 'Masukan tinggi badan',
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
              onChanged: (value) {
                setState(() {
                  _tinggi = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _bmi = hitungBMI(_berat, _tinggi);
                  _status = getStatusBMI(_bmi);
                });
              },
              child: Text('Hitung'),
            ),
            SizedBox(height: 16),
            Text(
              'BMI: ${_bmi.toStringAsFixed(1)}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Status: $_status',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menghitung BMI
  double hitungBMI(double berat, double tinggi) {
    double bmi = berat / ((tinggi / 100) * (tinggi / 100));
    return bmi;
  }

  // Fungsi untuk menentukan status BMI
  String getStatusBMI(double bmi) {
    if (bmi < 18.5) {
      return 'Kurus';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Gemuk';
    } else {
      return 'Obesitas';
    }
  }
}

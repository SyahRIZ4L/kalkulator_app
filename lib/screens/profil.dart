import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            minHeight: 400, // Batas minimum tinggi
            minWidth: 300,  // Batas minimum lebar
            maxHeight: 600, // Batas maksimum tinggi
            maxWidth: 400,  // Batas maksimum lebar
          ),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/fotozulfi.jpg'), // Ganti dengan path gambar Anda
              ),
              SizedBox(height: 20),
              Text(
                'Zulfi Syahrizal Rustandie',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                'Kelas 11 RPL 1',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 5),
              Text(
                'SMK Negeri 1 Bantul',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 5),
              Text(
                'Umur: 17 Tahun',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 15),
              Text(
                '“Kesuksesan tidak datang kepada mereka yang tidur, tetapi kepada mereka yang bekerja keras.”',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.school, size: 40, color: Colors.blue),
                      SizedBox(height: 5),
                      Text('Pelajar'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.code, size: 40, color: Colors.blue),
                      SizedBox(height: 5),
                      Text('PHP'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.code, size: 40, color: Colors.blue),
                      SizedBox(height: 5),
                      Text('Dart'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


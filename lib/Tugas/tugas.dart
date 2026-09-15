import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue.shade50, 
   
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Profil Saya',
            style: TextStyle(color: Colors.white),
          ),
        ),

        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.blue, 
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/gambar.jpg', 
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Stya',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 10),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, size: 18, color: Colors.blue),
                    SizedBox(width: 5),
                    Text('Jakarta, Indonesia'),
                  ],
                ),

                const SizedBox(height: 5),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, size: 18, color: Colors.blue),
                    SizedBox(width: 5),
                    Text('Styaa@email.com'),
                  ],
                ),

                const SizedBox(height: 15),

                ElevatedButton(
                  onPressed: () {
                    print('Tombol Hubungi Saya ditekan');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Hubungi Saya'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
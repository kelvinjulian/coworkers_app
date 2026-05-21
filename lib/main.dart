import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:course_coworkers/config/appwrite.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Appwrite
  Appwrite.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appwrite Setup',
      theme: ThemeData(useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String status = "Belum tes koneksi";

  Future<void> pingAppwrite() async {
    try {
      print("📡 Mengirim ping ke Appwrite...");

      // Gunakan Avatars karena tidak butuh login
      final avatars = Avatars(Appwrite.client);

      final result = avatars.getInitials(name: "Kelvin");

      print("✅ Koneksi Appwrite berhasil!");
      print(result);

      setState(() {
        status = "✅ Koneksi Appwrite berhasil!";
      });
    } catch (e) {
      print("❌ Error: $e");

      setState(() {
        status = "❌ Error koneksi";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Appwrite Ping Test")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud_done, size: 80),

              const SizedBox(height: 20),

              Text(
                status,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: pingAppwrite,
                icon: const Icon(Icons.bolt),
                label: const Text("Send a Ping"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

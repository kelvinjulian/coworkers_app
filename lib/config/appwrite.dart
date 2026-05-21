import 'package:appwrite/appwrite.dart';

class Appwrite {
  static const endpoint = 'https://sgp.cloud.appwrite.io/v1';
  static const projectId = '6a0e3f12000f98007d85';

  // 1. Deklarasikan objek client secara static di tingkat class
  static final Client client = Client();

  // 2. Buat fungsi init secara static untuk mengonfigurasi client saat aplikasi dimulai
  static void init() {
    client.setEndpoint(endpoint).setProject(projectId);
  }
}

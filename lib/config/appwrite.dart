import 'package:appwrite/appwrite.dart';

class Appwrite {
  static const endpoint = 'https://sgp.cloud.appwrite.io/v1';
  static const projectId = '6a0e3f12000f98007d85';

  static const databaseId = '64a0e3f12000f98007d86';
  static const collectionUsers = 'users';
  static const collectionWorkers = 'workers';
  static const collectionBooking = 'booking';

  static Client client = Client();
  static late Account account;
  static late Databases database;

  static init() {
    client.setEndpoint(endpoint).setProject(projectId);
    account = Account(client);
    database = Databases(client);
  }
}

//   // 1. Deklarasikan objek client secara static di tingkat class
//   static final Client client = Client();
//   static final Account account = Account(client);

//   // 2. Buat fungsi init secara static untuk mengonfigurasi client saat aplikasi dimulai
//   static void init() {
//     client.setEndpoint(endpoint).setProject(projectId);
//   }
// }

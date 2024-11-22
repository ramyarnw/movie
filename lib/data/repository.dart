import '../core/services/api_service.dart';
import '../core/services/firebase_service.dart';
import '../core/services/notification_service.dart';
import '../core/services/storage_service.dart';
import '../env/environment.dart';
import 'api_service_impl.dart';
import 'firebase_service_impl.dart';
import 'notification_service_impl.dart';
import 'storage_service_impl.dart';

class AppRepository {
  AppRepository(this.env);

  final Environment env;

  late final NotificationService notificationService;
  late final ApiService apiService;
  late final FireBaseService fireBaseService;
  late final StorageService storageService;

  Future<void> init() async {
    notificationService = NotificationServiceImpl();
    apiService = ApiServiceImpl();
    fireBaseService = FireBaseServiceImpl();
    storageService = StorageServiceImpl();
  }
}

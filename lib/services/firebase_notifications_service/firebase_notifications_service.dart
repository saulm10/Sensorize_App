abstract class FirebaseNotificationsService {
  Future<void> initialize();
  Future<String?> getToken();
}

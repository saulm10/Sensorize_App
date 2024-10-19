import 'toast_service_impl.dart';

abstract class ToastService {
  void showToast(String message, ToastType type);
}

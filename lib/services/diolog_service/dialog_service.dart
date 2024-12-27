abstract class DialogService {
  Future<bool> boolDialog(
      String title, String body, String okText, String noOkTex);

  Future<String> stringDialog(String title, String body, String hintText,
      String okText, String noOkText);

  Future<String?> colorDialog();
}

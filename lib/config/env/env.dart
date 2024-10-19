import 'package:flutter_dotenv/flutter_dotenv.dart';

setupEnv() async {
  await dotenv.load(fileName: "lib/config/env/config.env");
}

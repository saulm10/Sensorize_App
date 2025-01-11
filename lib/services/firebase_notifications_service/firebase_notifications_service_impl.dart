import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

import 'firebase_notifications_service.dart';

@Singleton(as: FirebaseNotificationsService)
class FirebaseNotificationsServiceImpl implements FirebaseNotificationsService {
  static final FirebaseNotificationsServiceImpl _instance =
      FirebaseNotificationsServiceImpl._internal();

  factory FirebaseNotificationsServiceImpl() => _instance;

  FirebaseNotificationsServiceImpl._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Inicializa el servicio de notificaciones
  @override
  Future<void> initialize() async {
    await _requestPermissions();

    // Configuración para mostrar notificaciones locales
    await _configureLocalNotifications();

    // Configuración de callbacks para mensajes entrantes
    _configureFirebaseListeners();
  }

  Future<void> _requestPermissions() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  /// Configura notificaciones locales
  Future<void> _configureLocalNotifications() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsIOS = DarwinInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _localNotificationsPlugin.initialize(initializationSettings);
  }

  /// Configura listeners para notificaciones de Firebase
  void _configureFirebaseListeners() {
    // Cuando la app está en foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          'Notificación recibida en foreground: ${message.notification?.title}');
      _showLocalNotification(message);
    });

    // Cuando la app está en background y se pulsa en la notificación
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notificación abierta: ${message.notification?.title}');
      // Manejar la navegación o acción aquí
    });

    // Cuando la app está cerrada
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        print(
            'Notificación recibida al iniciar la app: ${message.notification?.title}');
        // Manejar la acción inicial aquí
      }
    });
  }

  /// Muestra una notificación local
  Future<void> _showLocalNotification(RemoteMessage message) async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'high_importance_channel', // ID único del canal
      'High Importance Notifications', // Nombre del canal
      channelDescription: 'Este canal se usa para notificaciones importantes.',
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await _localNotificationsPlugin.show(
      message.notification.hashCode,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
      payload: message.data['payload'], // Información adicional
    );
  }

  /// Obtiene el token FCM del dispositivo
  @override
  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }
}

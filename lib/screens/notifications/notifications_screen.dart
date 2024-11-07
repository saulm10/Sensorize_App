import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensorize/extensions/build_context_ex.dart';
import 'package:sensorize/screens/notifications/notifications_provider.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  static const route = 'Profile';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotificationsProvider.get(),
      child: const _NotificationsScreen(),
    );
  }
}

class _NotificationsScreen extends StatelessWidget {
  const _NotificationsScreen();

  @override
  Widget build(BuildContext context) {
    NotificationsProvider provider = context.watch<NotificationsProvider>();

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.88,
      height: MediaQuery.of(context).size.height * 0.88,
      child: CustomScrollView(
        slivers: [
          if (provider.notifications.isNotEmpty)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: constraints.maxWidth,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                        provider.notifications[index].title),
                                  ),
                                  ListTile(
                                    title: Text(
                                        provider.notifications[index].body),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () =>
                                  provider.deleteNotification(index),
                              icon: Icon(
                                Icons.delete,
                                color: context.theme.colorScheme.error,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                childCount: provider.notifications.length,
              ),
            ),
          if (provider.notifications.isEmpty)
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 500,
                child: Center(
                  child: Text(
                    'No hay notificaciones',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensorize/extensions/build_context_ex.dart';

import '../../database/aa_tables.dart';
import 'silo_detail_provider.dart';

class SiloDetailScreen extends StatelessWidget {
  const SiloDetailScreen({super.key, required this.siloAux});
  final Silos siloAux;
  static const route = 'Profile';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SiloDetailProvider.get(siloAux),
      child: const _SiloDetailScreen(),
    );
  }
}

class _SiloDetailScreen extends StatelessWidget {
  const _SiloDetailScreen();

  @override
  Widget build(BuildContext context) {
    SiloDetailProvider provider = context.watch<SiloDetailProvider>();
    return Container(
      height: 200,
      width: 200,
      child: Text(
        provider.silo.nombre,
      ),
    );
  }
}

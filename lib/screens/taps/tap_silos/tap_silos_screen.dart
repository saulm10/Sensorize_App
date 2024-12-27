import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensorize/extensions/build_context_ex.dart';
import 'package:sensorize/extensions/string_ex.dart';
import 'package:sensorize/widgets/silo_widget.dart';

import 'tap_silos_provider.dart';

class TapSilosScreen extends StatelessWidget {
  const TapSilosScreen({super.key});

  // Índice actual de la página
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TapSilosProvider.get(),
      child: const _TapSilosScreen(),
    );
  }
}

class _TapSilosScreen extends StatelessWidget {
  const _TapSilosScreen();

  @override
  Widget build(BuildContext context) {
    TapSilosProvider provider = context.watch<TapSilosProvider>();
    return CustomScrollView(
      slivers: [
        //Chips
        SliverPersistentHeader(
          pinned: false,
          floating: false,
          delegate: MySliverHeaderDelegate(
            provider,
            minHeight: 48.0,
            maxHeight: 48.0,
          ),
        ),

        //Silos grid
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return GestureDetector(
                onTap: () => provider.navigateToSiloDetail(index),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Expanded(
                        child: FittedBox(
                          child: Text(
                            provider.silos[index].siloName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: FittedBox(
                                child: Hero(
                                  tag: provider.silos[index].id,
                                  child: Silowidget(
                                    height: 100,
                                    width: 75,
                                    nivel: provider.silos[index].volumen
                                        .toDouble(),
                                    warningLevel:
                                        provider.silos[index].risk.toDouble(),
                                    color:
                                        provider.silos[index].color.toColor(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FittedBox(
                                child: TweenAnimationBuilder(
                                  tween: Tween<double>(
                                    begin: 0,
                                    end: provider.silos[index].volumen
                                        .toDouble(),
                                  ),
                                  duration: const Duration(milliseconds: 270),
                                  builder: (context, value, child) {
                                    return Text(
                                      value.toStringAsFixed(0),
                                      style: const TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: -5,
                                        height: 0,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            childCount: provider.silos.length,
          ),
        ),
      ],
    );
  }
}

// chips
class MySliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TapSilosProvider provider;
  final double minHeight;
  final double maxHeight;

  MySliverHeaderDelegate(
    this.provider, {
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // double percentage = (1 - (shrinkOffset / maxExtent)).clamp(0.0, 1.0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomChip(
          text: "+ Llenos",
          icon: Icons.arrow_downward,
          isActive: provider.filterstate == Filtrado.masLlenos,
          onTap: () => provider.onChipTap(Filtrado.masLlenos),
        ),
        const SizedBox(width: 5),
        CustomChip(
          text: "- Llenos",
          icon: Icons.arrow_upward,
          isActive: provider.filterstate == Filtrado.menosLlenos,
          onTap: () => provider.onChipTap(Filtrado.menosLlenos),
        ),
        const SizedBox(width: 5),
        CustomChip(
          text: "Abc...",
          icon: Icons.sort_by_alpha,
          isActive: provider.filterstate == Filtrado.alfabetico,
          onTap: () => provider.onChipTap(Filtrado.alfabetico),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class CustomChip extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  final bool isActive;

  const CustomChip({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(
          text,
          style: TextStyle(color: isActive ? Colors.white : Colors.black),
        ),
        avatar: Icon(icon, color: isActive ? Colors.white : Colors.black),
        backgroundColor: isActive ? context.theme.primaryColor : Colors.white,
        padding: const EdgeInsets.all(8.0),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide.none,
        ),
      ),
    );
  }
}

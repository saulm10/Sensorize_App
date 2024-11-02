import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensorize/extensions/build_context_ex.dart';
import 'package:sensorize/screens/screens.dart';
import 'package:sensorize/screens/taps/widgets/bottom_bar.dart';
import 'package:sensorize/screens/taps/widgets/simple_background.dart';

class TapsScreen extends StatelessWidget {
  const TapsScreen({super.key});
  static const route = 'Taps';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TapsProvider.get(),
      child: const _TapsScreen(),
    );
  }
}

class _TapsScreen extends StatelessWidget {
  const _TapsScreen();

  @override
  Widget build(BuildContext context) {
    TapsProvider tapsProvider = Provider.of<TapsProvider>(context);

    return SimpleBackground(
      position: tapsProvider.currentPage,
      child: Scaffold(
        backgroundColor: Colors.transparent,

        //Appbar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                size: 40,
                color: context.theme.colorScheme.primary,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () => tapsProvider.navigateToProfile(),
                child: const CircleAvatar(
                  maxRadius: 25,
                  child: Text('CS'),
                ),
              ),
            )
          ],
          centerTitle: false,
          title: SizedBox(
            width: 190,
            child: Text(
              tapsProvider.centro == null
                  ? 'Nombre centro'
                  : tapsProvider.centro!.nombreCentro,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
              softWrap: true,
              overflow: TextOverflow.visible,
              maxLines: 2,
              textAlign: TextAlign.start,
            ),
          ),
          toolbarHeight: 80,
        ),

        //body
        body: PageView(
          controller: tapsProvider.pageController,
          onPageChanged: (index) => tapsProvider.onScroll(index),
          children: tapsProvider.sincornizado
              ? [
                  const TapHomeScreen(),
                  const TapSilosScreen(),
                  Placeholder(),
                ]
              : [],
        ),

        //Botom bar
        bottomNavigationBar: Container(
          height: 60,
          margin:
              const EdgeInsets.only(top: 5, bottom: 25, left: 15, right: 15),
          child: BottomBar(
            showElevation: false,
            borderRadius: BorderRadius.circular(50),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            iconSize: 30,
            curve: Curves.easeIn,
            items: [
              BottomBarItem(
                title: const Text('Home'),
                icon: const Icon(Icons.home_work_outlined),
                textAlign: TextAlign.center,
                activeColor: context.theme.colorScheme.primary,
                activeBackgroundColor: context.theme.colorScheme.secondary,
              ),
              BottomBarItem(
                title: const Text('Silos'),
                icon: const Icon(Icons.pie_chart_outline),
                textAlign: TextAlign.center,
                activeColor: context.theme.colorScheme.primary,
                activeBackgroundColor: context.theme.colorScheme.secondary,
              ),
              BottomBarItem(
                title: const Text('Pedidos'),
                icon: const Icon(Icons.local_shipping_outlined),
                textAlign: TextAlign.center,
                activeColor: context.theme.colorScheme.primary,
                activeBackgroundColor: context.theme.colorScheme.secondary,
              ),
            ],
            selectedIndex: tapsProvider.currentPage,
            onItemSelected: (index) => tapsProvider.onItemSelecctedTap(index),
          ),
        ),
      ),
    );
  }
}

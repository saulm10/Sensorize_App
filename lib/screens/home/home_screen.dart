import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensorize/extensions/build_context_ex.dart';
import 'package:sensorize/screens/home/home_provider.dart';
import 'package:sensorize/screens/home/widgets/bottom_bar.dart';
import 'package:sensorize/screens/home/widgets/simple_background.dart';

import 'taps/tap1/tap1_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const route = 'Home';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider.get(),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    return SimpleBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,

        //Appbar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: const CircleAvatar(
                maxRadius: 25,
                child: Text('CS'),
              ),
            )
          ],
          centerTitle: false,
          title: SizedBox(
            width: 190,
            child: Text(
              homeProvider.centro == null
                  ? 'Nombre centro'
                  : homeProvider.centro!.nombreCentro,
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
          controller: homeProvider.pageController,
          onPageChanged: (index) => homeProvider.onScroll(index),
          children: [
            Tap1Screen(
              silos: homeProvider.silos,
            ),
            Placeholder(),
            Placeholder(),
          ],
        ),

        //Botom bar
        bottomNavigationBar: Container(
          height: 60,
          margin:
              const EdgeInsets.only(top: 5, bottom: 25, left: 15, right: 15),
          child: BottomBar(
            showElevation: false,
            borderRadius: BorderRadius.circular(50),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            selectedIndex: homeProvider.currentPage,
            onItemSelected: (index) => homeProvider.onItemSelecctedTap(index),
          ),
        ),
      ),
    );
  }
}

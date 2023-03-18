import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/app_config/app_config_cubit.dart';
import '../bloc/app_config/app_config_state.dart';
import '../components/home_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context)!.home),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 50,
          ),
          children: [
            BlocBuilder<AppConfigCubit, AppConfigState>(
              builder: (context, state) => ListTile(
                leading: Icon(
                  state.themeMode == ThemeMode.dark
                      ? Icons.dark_mode_outlined
                      : state.themeMode == ThemeMode.light
                          ? Icons.light_mode_outlined
                          : Icons.phone_android_outlined,
                ),
                title: Text(
                  state.themeMode == ThemeMode.dark
                      ? S.of(context)!.dark
                      : state.themeMode == ThemeMode.light
                          ? S.of(context)!.light
                          : S.of(context)!.system,
                ),
                onTap: () => context.read<AppConfigCubit>().changeThemeMode(
                      state.copyWith(
                        themeMode: state.themeMode == ThemeMode.dark
                            ? ThemeMode.light
                            : state.themeMode == ThemeMode.light
                                ? ThemeMode.system
                                : ThemeMode.dark,
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: <Widget>[
          ListView(
            children: [
              HomeCard(
                title: S.of(context)!.inventory,
                subTitle: S.of(context)!.inventory_subtitle,
                icon: Icons.inventory_2_outlined,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              HomeCard(
                title: S.of(context)!.warehouse_to_warehouse,
                subTitle: S.of(context)!.warehouse_to_warehouse_subtitle,
                icon: Icons.compare_arrows_outlined,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              HomeCard(
                title: S.of(context)!.order_note,
                subTitle: S.of(context)!.order_note_subtitle,
                icon: Icons.speaker_notes_off_outlined,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              HomeCard(
                title: S.of(context)!.order_order,
                subTitle: S.of(context)!.order_order_subtitle,
                icon: Icons.receipt_long,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              HomeCard(
                title: S.of(context)!.product_to_product,
                subTitle: S.of(context)!.product_to_product_subtitle,
                icon: Icons.playlist_add,
                onTap: () {},
              ),
              const SizedBox(width: 8),
            ],
          )
        ].elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: S.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.qr_code_scanner_rounded),
            label: S.of(context)!.scan,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_basket_outlined),
            label: S.of(context)!.basket,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

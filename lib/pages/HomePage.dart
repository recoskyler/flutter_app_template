import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:prolift/components/HomeCard.dart';

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
        title: Text(AppLocalizations.of(context)!.home),
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
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(AppLocalizations.of(context)!.settings),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: <Widget>[
          ListView(
            children: [
              HomeCard(
                title: AppLocalizations.of(context)!.inventory,
                subTitle: AppLocalizations.of(context)!.inventory_subtitle,
                icon: Icons.inventory_2_outlined,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              HomeCard(
                title: AppLocalizations.of(context)!.warehouse_to_warehouse,
                subTitle: AppLocalizations.of(context)!
                    .warehouse_to_warehouse_subtitle,
                icon: Icons.compare_arrows_outlined,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              HomeCard(
                title: AppLocalizations.of(context)!.order_note,
                subTitle: AppLocalizations.of(context)!.order_note_subtitle,
                icon: Icons.speaker_notes_off_outlined,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              HomeCard(
                title: AppLocalizations.of(context)!.order_order,
                subTitle: AppLocalizations.of(context)!.order_order_subtitle,
                icon: Icons.receipt_long,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              HomeCard(
                title: AppLocalizations.of(context)!.product_to_product,
                subTitle:
                    AppLocalizations.of(context)!.product_to_product_subtitle,
                icon: Icons.playlist_add,
                onTap: () {},
              ),
              const SizedBox(width: 8),
            ],
          )
        ].elementAt(_selectedIndex),
        // child: PageView(
        //   physics: const NeverScrollableScrollPhysics(),
        //   children: [
        //     Container(
        //       color: Colors.red,
        //     ),
        //   ],
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.qr_code_scanner_rounded),
            label: AppLocalizations.of(context)!.scan,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_basket_outlined),
            label: AppLocalizations.of(context)!.basket,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

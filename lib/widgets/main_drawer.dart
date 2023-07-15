import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelecetScreen});

  final void Function(String identifier) onSelecetScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(183, 186, 7, 22),
              Color.fromARGB(99, 210, 13, 13)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Row(
              children: [
                Icon(Icons.dining),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking up!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: const Text(
              'Meals',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
            onTap: () {
              onSelecetScreen('Meals');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 26,
            ),
            title: const Text(
              'Filters',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
            onTap: () {
              onSelecetScreen('Filters');
            },
          ),
        ],
      ),
    );
  }
}

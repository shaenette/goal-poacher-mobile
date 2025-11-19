import 'package:flutter/material.dart';
import 'package:goal_poacher_mobile/screens/login.dart';
import 'package:goal_poacher_mobile/screens/menu.dart';
import 'package:goal_poacher_mobile/screens/addproduct_form.dart';
import 'package:goal_poacher_mobile/screens/product_entry_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF004D40),
            ),
            child: Column(
              children: [
                Text(
                  'Goal Poacher',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFD700),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Stay ahead with new arrivals, special offers, and authentic football merchandise!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                    ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Color(0xFFFFD700)),
            title: const Text('Home', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.post_add, color: Color(0xFFFFD700)),
            title: const Text('Add Product', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductFormPage(),
                  ));
            },
          ),

          ListTile(
            leading: const Icon(Icons.list, color: Color(0xFFFFD700)),
            title: const Text('Products List'),
            onTap: () {
                // Route to news list page
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductEntryListPage()),
                );
              },
           ),

        ListTile(
            leading: const Icon(Icons.logout, color: Color.fromARGB(255, 120, 118, 111)),
            title: const Text('Logout'),
            onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                );
            },
        ),
        ],
      ),
    );
  }
}
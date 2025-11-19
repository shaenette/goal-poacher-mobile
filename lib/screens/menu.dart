import 'package:flutter/material.dart';
import 'package:goal_poacher_mobile/widgets/left_drawer.dart';
import 'package:goal_poacher_mobile/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
    MyHomePage({super.key});

    final List<ItemHomepage> items = [
    ItemHomepage("Show Products", Icons.shopping_bag, const Color(0xFF1E88E5)),
    ItemHomepage("Add Product", Icons.add_circle, const Color.fromARGB(255, 68, 199, 66)),
    ItemHomepage("Logout", Icons.logout, const Color(0xFF6B7280)),
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Goal Poacher', 
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        drawer: LeftDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Selamat datang di Goal Poacher!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
              
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true, 
                children: items.map((ItemHomepage item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      );
    }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: const Color(0xFF004D40),
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white,),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}


class ItemHomepage {
 final String name;
 final IconData icon;
 final Color color; 

 ItemHomepage(this.name, this.icon, this.color);
}


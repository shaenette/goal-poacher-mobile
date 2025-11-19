import 'package:flutter/material.dart';
import 'package:goal_poacher_mobile/models/product_entry.dart';
import 'package:goal_poacher_mobile/widgets/left_drawer.dart';
import 'package:goal_poacher_mobile/screens/product_detail.dart';
import 'package:goal_poacher_mobile/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  String filter = "All";

  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    final response = await request.get(
      'http://localhost:8000/json/',
    );

    var data = response;
    
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    print("JSON DATA: ${request.jsonData}");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products List'),
        backgroundColor: const Color(0xFF154734),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          // DROPDOWN
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const Text("Filter: "),
                DropdownButton<String>(
                  value: filter,
                  items: const [
                    DropdownMenuItem(
                      value: "All",
                      child: Text("All Products"),
                    ),
                    DropdownMenuItem(
                      value: "Mine",
                      child: Text("My Products"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() => filter = value!);
                  },
                ),
              ],
            ),
          ),

          Expanded(
            child: FutureBuilder(
              future: fetchProduct(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                List<ProductEntry> items = snapshot.data!;

                // FILTER PRODUK MILIK USER
                if (filter == "Mine") {
                  final currentUser = request.jsonData["username"];
                  items = items
                      .where((item) => item.userUsername == currentUser)
                      .toList();
                }

                if (items.isEmpty) {
                  return const Center(
                    child: Text(
                      "No products found.",
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (_, index) {
                    return ProductEntryCard(
                      product: items[index],  
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailPage(product: items[index]),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

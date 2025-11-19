import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:goal_poacher_mobile/widgets/left_drawer.dart';
import 'package:goal_poacher_mobile/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  String _category = "others";
  bool _isFeatured = false;
  int _stock = 0;

  final List<String> _categories = [
    "shoes",
    "jersey",
    "ball",
    "merchandise",
    "accessories",
    "others",
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black87,
        title: const Text(
          "➕ Add Product",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        
        
         Tombol back kiri atas
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      drawer: const LeftDrawer(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ],
          ),

          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Header
                Center(
                  child: Column(
                    children: const [
                      Text(
                        "➕ Add Product",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Fill out the form below to add a new product",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                _buildLabel("Product Name"),
                _inputField(
                  hint: "Enter product name",
                  onChanged: (v) => _name = v!,
                  validator: (v) =>
                      v == null || v.isEmpty ? "Name cannot be empty!" : null,
                ),

                const SizedBox(height: 20),

                _buildLabel("Price"),
                _inputField(
                  hint: "Enter price",
                  type: TextInputType.number,
                  onChanged: (v) => _price = int.tryParse(v!) ?? 0,
                  validator: (v) =>
                      v == null || v.isEmpty ? "Price cannot be empty!" : null,
                ),

                const SizedBox(height: 20),

                _buildLabel("Stock"),
                _inputField(
                  hint: "Enter stock",
                  type: TextInputType.number,
                  onChanged: (v) => _stock = int.tryParse(v!) ?? 0,
                  validator: (v) =>
                      v == null || v.isEmpty ? "Stock cannot be empty!" : null,
                ),

                const SizedBox(height: 20),

                _buildLabel("Description"),
                _inputField(
                  hint: "Product description",
                  maxLines: 4,
                  onChanged: (v) => _description = v!,
                  validator: (v) =>
                      v == null || v.isEmpty ? "Description cannot be empty!" : null,
                ),

                const SizedBox(height: 20),

                _buildLabel("Thumbnail URL"),
                _inputField(
                  hint: "https://example.com/image.jpg",
                  onChanged: (v) => _thumbnail = v!,
                  validator: (v) =>
                      v == null || v.isEmpty ? "Thumbnail cannot be empty!" : null,
                ),

                const SizedBox(height: 20),

                _buildLabel("Category"),
                DropdownButtonFormField<String>(
                  value: _category,
                  items: _categories
                      .map(
                        (c) => DropdownMenuItem(
                          value: c,
                          child: Text(
                            c[0].toUpperCase() + c.substring(1),
                          ),
                        ),
                      )
                      .toList(),
                  decoration: inputDecoration(),
                  onChanged: (v) => setState(() => _category = v!),
                ),

                const SizedBox(height: 20),

                SwitchListTile(
                  title: const Text(
                    "Mark as Featured Product",
                    style: TextStyle(fontSize: 15),
                  ),
                  value: _isFeatured,
                  onChanged: (v) => setState(() => _isFeatured = v),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // BACK BUTTON
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text("← Back"),
                    ),

                    // SAVE PRODUCT BUTTON
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final response = await request.postJson(
                            "http://localhost:8000/create-flutter/",
                            jsonEncode({
                              "name": _name,
                              "price": _price,
                              "description": _description,
                              "thumbnail": _thumbnail,
                              "category": _category,
                              "is_featured": _isFeatured,
                              "stock": _stock,
                            }),
                          );

                          if (context.mounted) {
                            if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Product successfully saved!"),
                                ),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      "Something went wrong. Please try again."),
                                ),
                              );
                            }
                          }
                        }
                      },
                      child: const Text("💾 Save Product"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ==== UI Helpers ====

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15,
        color: Colors.black87,
      ),
    );
  }

  Widget _inputField({
    required String hint,
    required Function(String?) onChanged,
    String? Function(String?)? validator,
    TextInputType type = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      keyboardType: type,
      maxLines: maxLines,
      decoration: inputDecoration(hint: hint),
      onChanged: onChanged,
      validator: validator,
    );
  }

  InputDecoration inputDecoration({String? hint}) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo),
      ),
      filled: true,
      fillColor: Colors.grey.shade50,
    );
  }
}

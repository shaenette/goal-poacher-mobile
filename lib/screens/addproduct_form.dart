import 'package:flutter/material.dart';
import 'package:goal_poacher_mobile/widgets/left_drawer.dart';

class AddProductFormPage extends StatefulWidget {
    const AddProductFormPage({super.key});

    @override
    State<AddProductFormPage> createState() => _AddProductFormPageState();
}

class _AddProductFormPageState extends State<AddProductFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    double _price = 0;
    String _description = "";
    String _category = "others"; // default
    String _thumbnail = "";
    bool _isFeatured = false; // default
    int _stock = 0;

    final List<String> _categories = [
      'shoes',
      'jersey',
      'ball',
      'merchandise',
      'accessories',
      'others',
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Add Product Form',
              ),
            ),
            backgroundColor: const Color(0xFF004D40),
            foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  // === Product ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Product Name",
                        labelText: "Product Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _name = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Product name can't be empty!";
                        }
                        if (RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return "Product name must contain letters!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Price ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Product Price",
                        labelText: "Product Price",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      keyboardType: TextInputType.number, 
                      onChanged: (String? value) {
                        setState(() {
                          _price = double.tryParse(value!) ?? 0;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Product price can't be empty!";
                        }
                        if (double.tryParse(value) == null) {
                          return "Price must be a number!";
                        }
                        if (double.parse(value) <= 0) {
                          return "Price must be greater than 0!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Description ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Product Description",
                        labelText: "Product Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _description = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Product description can't be empty!";
                        }
                        if (RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return "Product name must contain letters!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Category ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "Category",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      value: _category,
                      items: _categories
                          .map((cat) => DropdownMenuItem(
                                value: cat,
                                child: Text(
                                    cat[0].toUpperCase() + cat.substring(1)),
                              ))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _category = newValue!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select a category!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Thumbnail URL ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "URL Thumbnail (opsional)",
                        labelText: "URL Thumbnail",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _thumbnail = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value != null && value.isNotEmpty) {
                          if (!Uri.tryParse(value)!.isAbsolute) {
                            return "Please enter a valid URL!";
                          }
                        }
                        return null;
                      }
                    ),
                  ),

                  // === Is Featured ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SwitchListTile(
                      activeColor: const Color.fromARGB(255, 12, 95, 15),
                      title: const Text("Tandai sebagai Product Unggulan"),
                      value: _isFeatured,
                      onChanged: (bool value) {
                        setState(() {
                          _isFeatured = value;
                        });
                      },
                    ),
                  ),

                  // === Stock ===
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Product Stock",
                        labelText: "Product Stock",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      keyboardType: TextInputType.number, 
                      onChanged: (String? value) {
                        setState(() {
                          _stock = int.tryParse(value!) ?? 0;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Product stock can't be empty!";
                        }
                        if (int.tryParse(value) == null) {
                          return "Stock must be a number!";
                        }
                        if (double.parse(value) < 0) {
                          return "Stock can't be negative!";
                        }
                        return null;
                      },
                    ),
                  ),

                  // === Tombol Simpan ===
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(const Color.fromARGB(255, 7, 92, 10)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Product is sucessfully added!'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Name: $_name'),
                                        Text('Price: $_price'),
                                        Text('Description: $_description'),
                                        Text('Kategori: $_category'),
                                        Text('Thumbnail: $_thumbnail'),
                                        Text(
                                            'Unggulan: ${_isFeatured ? "Ya" : "Tidak"}'),
                                        Text('Stock: $_stock')
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        _formKey.currentState!.reset();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
    }
}
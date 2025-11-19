import 'package:flutter/material.dart';
import 'package:goal_poacher_mobile/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), 
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              TextButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Text("←",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                label: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Product Content Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.05),
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HEADER
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            "Sold by ${product.userUsername}",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // GRID: Thumbnail + Detail Section
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth > 600;
                        return Flex(
                          direction: isWide ? Axis.horizontal : Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image Thumbnail
                            Expanded(
                              flex: isWide ? 1 : 0,
                              child: Container(
                                height: isWide ? 300 : 250,
                                color: Colors.grey.shade100,
                                child: product.thumbnail.isNotEmpty
                                    ? Image.network(
                                        product.thumbnail,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        errorBuilder: (context, error, stack) {
                                          return _noImage();
                                        },
                                      )
                                    : _noImage(),
                              ),
                            ),

                            // Details Section
                            Expanded(
                              flex: isWide ? 1 : 0,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Description
                                    Text(
                                      product.description,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        height: 1.5,
                                        color: Colors.black87,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 20),

                                    // Product Details
                                     _detailRow(
                                      "💰 Price:",
                                      "Rp ${product.price}",
                                      isPrimary: true,
                                    ),
                                    _detailRow(
                                      "🏷 Category:",
                                      product.category,
                                    ),
                                    _detailRow(
                                      "📦 Stock:",
                                      product.isOutOfStock
                                          ? "Out of stock"
                                          : product.stock.toString(),
                                      isDanger: product.isOutOfStock,
                                    ),

                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // No Image Widget
  Widget _noImage() {
    return Container(
      color: Colors.grey.shade300,
      child: const Center(
        child: Text(
          "No Image",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // Row untuk Price, Category, Stock
  Widget _detailRow(String label, String value,
      {bool isPrimary = false, bool isDanger = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isPrimary ? FontWeight.w600 : FontWeight.normal,
                color: isDanger
                    ? Colors.red
                    : isPrimary
                        ? Colors.green.shade700
                        : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:mavazi/models/cart_item.dart';

class CartCard extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback increment;
  final VoidCallback decrement;

  const CartCard({
    super.key,
    required this.cartItem,
    required this.increment,
    required this.decrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                cartItem.product.imageUrl,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.product.name,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'KES ${cartItem.product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14, 
                          color: Color.fromARGB(255, 45, 6, 122), 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            color: const Color.fromARGB(255, 243, 118, 149),
                            onPressed: decrement,
                          ),
                          Text(
                            cartItem.quantity.toString(),
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            color: const Color.fromARGB(255, 243, 118, 149),
                            onPressed: increment,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
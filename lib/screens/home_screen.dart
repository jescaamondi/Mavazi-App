// import 'package:flutter/material.dart';

// class Item {
//   final String name;
//   final String price;
//   final String imagePath;

//   const Item({
//     required this.name,
//     required this.price,
//     required this.imagePath,
//   });
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() {
//     return _HomeScreenState();
//   }
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   String _tabTitle = "Home";
//   final List<Widget> _tabs = [
//     _HomeTab(),
//     _OrderTab(),
//     _ProfileTab(),
//     _CartTab(),
//   ];

//   final List<String> _titles = ['Home', 'Orders', 'Profile', 'Cart'];

//   void _onClickTab(int index) {
//     setState(() {
//       _selectedIndex = index;
//       _tabTitle = _titles[index];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(_tabTitle)),
//       body: IndexedStack(index: _selectedIndex, children: _tabs),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onClickTab,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.blueAccent,
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             activeIcon: Icon(Icons.home, color: Colors.blueAccent),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_bag_outlined),
//             activeIcon: Icon(Icons.shopping_bag),
//             label: 'Orders',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_2_outlined),
//             activeIcon: Icon(Icons.person_2),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart_outlined),
//             activeIcon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _HomeTab extends StatelessWidget {
//   _HomeTab({super.key});

//   final List<Item> _items = [
//     Item(
//       name: 'Jezzy',
//       price: '999.99',
//       imagePath: 'assets/images/image1.jpg',
//     ),
//     Item(
//       name: 'Hoodie',
//       price: '1500.00',
//       imagePath: 'assets/images/image2.jpg',
//     ),
//     Item(
//       name: 'Maxi skirts',
//       price: '999.99',
//       imagePath: 'assets/images/image3.jpg',
//     ),
//     Item(
//       name: 'Trouser',
//       price: '1000.00',
//       imagePath: 'assets/images/image4.jpg',
//     ),
//     Item(
//       name: 'Short',
//       price: '700.00',
//       imagePath: 'assets/images/image5.png',
//     ),
//     Item(
//       name: 'Dress',
//       price: '500.00',
//       imagePath: 'assets/images/image6.jpg',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: GridView.builder(
//         itemCount: _items.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // Displays 2 items per row
//           crossAxisSpacing: 12, // Horizontal spacing between items
//           mainAxisSpacing: 12, // Vertical spacing between items
//           childAspectRatio:
//               0.75, // Adjust ratio to fit image, text, and price comfortably
//         ),
//         itemBuilder: (context, index) {
//           final item = _items[index];
//           return Card(
//             elevation: 2,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Item Image Section
//                 Expanded(
//                   child: Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100], // Background color fallback
//                       borderRadius: const BorderRadius.vertical(
//                         top: Radius.circular(12),
//                       ),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: const BorderRadius.vertical(
//                         top: Radius.circular(12),
//                       ),
//                       child: Image.asset(
//                         item.imagePath,
//                         fit: BoxFit.cover,
//                         // Shows an icon placeholder if the asset image cannot be loaded yet
//                         errorBuilder: (context, error, stackTrace) {
//                           return const Icon(
//                             Icons.image,
//                             size: 50,
//                             color: Colors.grey,
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),

//                 // Item Text Details Section
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         item.name,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         item.price,
//                         style: TextStyle(
//                           color: Colors.blueAccent[700],
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class _OrderTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text("Orders"));
//   }
// }

// class _ProfileTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text("Profile"));
//   }
// }

// class _CartTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text("Cart"));
//   }
// }
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _tabTitle = "Home";

  final List<Widget> _tabs = [
    _HomeTab(),
    _OrdersTab(),
    _ShoppingCartTab(),
    _ProfileTab(),
  ];
  final List<String> _titles = ['Home', 'Orders', 'Cart', 'Profile'];

  void _onClickTab(int index) {
    setState(() {
      _selectedIndex = index;
      _tabTitle = _titles[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tabTitle)),
      body: IndexedStack(index: _selectedIndex, children: _tabs),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onClickTab,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            activeIcon: Icon(Icons.person_2),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  final List<Map<String, String>> clothesCatalog = [
    {
      "name": "Floral Dress",
      "price": "KES 1500",
      "image": "assets/images/cocktaildress.jpg",
    },
    {
      "name": "Summer Dress",
      "price": "KES 1000",
      "image": "assets/images/summer.jpg",
    },
    {
      "name": "Casual Gown",
      "price": "KES 15000",
      "image": "assets/images/casualgown.jpg",
    },
    {
      "name": "Evening Wear",
      "price": "KES 20000",
      "image": "assets/images/eveningwear.jpg",
    },
    {
      "name": "Sun Dress",
      "price": "KES 1550",
      "image": "assets/images/sundress.jpg",
    },
    {
      "name": "Cocktail Dress",
      "price": "KES 1700",
      "image": "assets/images/cocktail.jpg",
    },
    {
      "name": "Maxi Dress",
      "price": "KES 950",
      "image": "assets/images/maxi.jpg",
    },
    {
      "name": "Party Dress",
      "price": "KES 950",
      "image": "assets/images/partydress.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 0.8,
      children: List.generate(clothesCatalog.length, (index) {
        final item = clothesCatalog[index];

        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                item["image"]!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                      size: 40,
                    ),
                  );
                },
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  color: Colors.pinkAccent.withValues(alpha: 0.65),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item["name"]!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item["price"]!,
                              style: const TextStyle(
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _OrdersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Orders"));
  }
}

class _ShoppingCartTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Cart"));
  }
}

class _ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Profile"));
  }
}

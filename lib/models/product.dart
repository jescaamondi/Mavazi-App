class Product {
final String id;
final String name;
final String description;
final double price;
final String imageUrl;

const Product({
required this.id,
required this.name,
required this.description,
required this.price,
required this.imageUrl,
});
}

final List<Product> dummyProducts = [
const Product(
id: 'p1',
name: 'Wireless Headphones',
description: 'Over ear headphones with noise cancelling',
price: 31000.0,
imageUrl: 'https://picsum.photos/seed/car/300/300',
),
const Product(
id: 'p2',
name: 'Smart Watch',
description: 'Track steps, heart rate, calories, sync with phone and more',
price: 3500.0,
imageUrl: 'https://picsum.photos/seed/watch/300/300',
),
const Product(
id: 'p3',
name: 'Backpack',
description: 'Anti theft laptop bag with durable build and rugged materials',
price: 800.0,
imageUrl: 'https://picsum.photos/seed/backpack/300/300',
),
const Product(
id: 'p4',
name: 'Nothing phone 2',
description: 'Relentlessly excelsior, Android Samsung 32',
price: 64000.0,
imageUrl: 'https://picsum.photos/seed/smartphone/300/300',
),
const Product(
id: 'p5',
name: 'Coaster',
description: 'Anti spill anti slip coffee coaster with style',
price: 150.0,
imageUrl: 'https://picsum.photos/seed/pencil/300/300',
),

];

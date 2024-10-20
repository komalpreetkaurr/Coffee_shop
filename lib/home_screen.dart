import 'package:coffee_app/ProfileScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class CoffeeItem {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  CoffeeItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CoffeeShop'),
          centerTitle: true,
          backgroundColor: Colors.grey[800],
        ),
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<CoffeeItem> coffeeItems = [
    CoffeeItem(
      name: 'Americano',
      description: 'Espresso with hot water',
      price: 475,
      imageUrl: 'images/Americano-ChristinaDibernardo-Unsplash.jpg',
    ),
    CoffeeItem(
      name: 'Latte',
      description: 'Espresso with steamed milk',
      price: 500,
      imageUrl: 'images/download.jpeg',
    ),
    CoffeeItem(
      name: 'Espresso',
      description: 'Espresso with cold water',
      price: 723,
      imageUrl: 'images/what-is-espresso-765702-hero-03_cropped-ffbc0c7cf45a46ff846843040c8f370c.jpg',
    ),
    CoffeeItem(
      name: 'Mocha',
      description: 'Espresso with iced milk',
      price: 900,
      imageUrl: 'images/SES-mocha-4797918-hero-01-1-f8fb7ebd74914895b61366f6fc1d4b05.jpg',
    ),
    CoffeeItem(
      name: 'Frapino',
      description: 'Espresso with water',
      price: 350,
      imageUrl: 'images/download (1).jpeg',
    ),
    CoffeeItem(
      name: 'Cappuccino',
      description: 'Espresso with milk',
      price: 670,
      imageUrl: 'images/1200px-Cappuccino_at_Sightglass_Coffee.jpg',
    ),
    CoffeeItem(
      name: 'Cold Brew',
      description: 'Iced coffee bunch',
      price: 458,
      imageUrl: 'images/images.jpeg',
    ),
     CoffeeItem(
      name: 'Caffè Macchiato',
      description: 'espresso macchiato',
      price: 736,
      imageUrl: 'images/images (1).jpeg',
    ),
     CoffeeItem(
      name: 'Iced Coffee',
      description: 'Coffee beverage served cold',
      price: 236,
      imageUrl: 'images/Perfect-Iced-CoffeeIMG_0074.jpg',
    ),
      CoffeeItem(
      name: 'Flat White',
      description: 'espresso with microfoam',
      price: 496,
      imageUrl: 'images/flat-white-d8ada0f.jpg',
    ),
    CoffeeItem(
      name: 'Ristretto',
      description:' short shot',
      price: 675, 
      imageUrl: 'images/licensed-image.jpeg'
    ),
      CoffeeItem(
      name: 'affogato',
      description:'Italian coffee-based dessert',
      price: 536, 
      imageUrl: 'images/k_Photo_Recipes_2020-07-How-to-make-affogato-at-home_Kitchn_HowTo_Affogato_0281.jpeg'),
  ];  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DailyGrindVibess'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Let Us Make Your Day !!',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Search for coffee...',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: [
                for (CoffeeItem coffeeItem in coffeeItems)
                  CoffeeItemCard(coffeeItem: coffeeItem),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[800],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeItemCard extends StatefulWidget {
  final CoffeeItem coffeeItem;

  CoffeeItemCard({required this.coffeeItem});

  @override
  _CoffeeItemCardState createState() => _CoffeeItemCardState();
}

class _CoffeeItemCardState extends State<CoffeeItemCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _mouseEnter(true),
      onExit: (_) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: isHovered ? Border.all(color: Colors.grey, width: 6.0) : null,
        ),
        child: InkWell(
          onTap: () {
            // Handle tap event
            print('Tapped ${widget.coffeeItem.name}');
            _showAddToCartDialog(context, widget.coffeeItem);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Display the image
                Image.network(
                  widget.coffeeItem.imageUrl,
                  height: 200, // Set the desired height
                  width: 200, // Set the desired width
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
                Text(
                  widget.coffeeItem.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(widget.coffeeItem.description),
                Text('₹${widget.coffeeItem.price.toStringAsFixed(2)}'),
                MouseRegion(
                  onEnter: (_) => _mouseEnter(true),
                  onExit: (_) => _mouseEnter(false),
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: isHovered ? Colors.grey[800] : Colors.black,
                    ),
                    onPressed: () {
                      _showAddToCartDialog(context, widget.coffeeItem);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      isHovered = hover;
    });
  }

  void _showAddToCartDialog(BuildContext context, CoffeeItem coffeeItem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Item Added to Cart'),
          content: Text('${coffeeItem.name} has been added to your cart.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
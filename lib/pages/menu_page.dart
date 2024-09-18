import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushiroll/components/food_tile.dart';
import 'package:sushiroll/components/my_button.dart';
import 'package:sushiroll/models/shop.dart';
import 'package:sushiroll/pages/food_detail.dart';
import 'package:sushiroll/themes/colors.dart';

// ignore: must_be_immutable
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
//Food menu
//navigate to food item details page
  void navigateToFoodDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetail(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        title: const Text('Kolkata'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(
              Icons.shopping_cart_rounded,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //PROMO BANNER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Get 30 % Off',
                          style: GoogleFonts.dmSerifDisplay(
                              fontSize: 26, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        MyButton(text: 'Redeem', ontap: () {})
                      ],
                    ),
                    Image.asset(
                      'lib/images/hosomaki.png',
                      height: 150,
                    ),
                  ],
                ),
              ),
            ),
            //SEARCH BAR
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for food, restaurents, dishes...',
                  hintStyle: TextStyle(color: Colors.red.shade900),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //MENU LIST
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Get Started!',
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 24,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  ontap: () => navigateToFoodDetails(index),
                ),
              ),
            ),

            const SizedBox(
              height: 14,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/images/asia.jpg',
                          width: 350,
                        ),
                      ),
                      Text(
                        'Shanghai: Flavours of China Town',
                        style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                      ),
                      Text(
                        'Chinese | Korean | Rs 350 for one',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/images/wasabee.jpg',
                          width: 350,
                        ),
                      ),
                      Text(
                        'Wasabee',
                        style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                      ),
                      Text(
                        'Japanese | Korean | Rs 400 for one',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/images/shanghai.jpg',
                          width: 350,
                        ),
                      ),
                      Text(
                        'Asia Asia Asia !',
                        style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                      ),
                      Text(
                        'Continental | Korean | Rs 300 for one',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

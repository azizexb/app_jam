import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {
  final String selectedDiet;

  const RestaurantPage({
      Key? key,
  required this.selectedDiet,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sizin için önerilen restoranlar'),
      ),
      body: ListView(
        children: _buildRestaurantList(),
      ),
    );
  }

  List<Widget> _buildRestaurantList() {
    List<Widget> restaurantWidgets = [];
    if (selectedDiet == 'Vejetaryen') {
      restaurantWidgets = [
        _buildRestaurantItem(
          'Vejetaryen Restoran',
          'images/salata.png',
          '123 Veggie St., İstanbul',
        ),
        _buildRestaurantItem(
          'Vegan Restoran',
          'images/makarna.png',
          '456 Vegan Ave., İstanbul',
        ),
      ];
    } else if (selectedDiet == 'Vegan') {
      restaurantWidgets = [
        _buildRestaurantItem(
          'Vegan Restoran',
          'images/makarna.png',
          '456 Vegan Ave., İstanbul',
        ),
      ];
    } else if (selectedDiet == 'Pesketaryen') {
      restaurantWidgets = [
        _buildRestaurantItem(
          'Vejetaryen Restoran',
          'images/salata.png',
          '123 Veggie St., İstanbul',
        ),
        _buildRestaurantItem(
          'Vegan Restoran',
          'images/makarna.png',
          '456 Vegan Ave., İstanbul',
        ),
        _buildRestaurantItem(
          'Pesketaryen Restoran',
          'images/pizza.png',
          '789 Pescatarian Blvd., İstanbul',
        ),
      ];
    } else if (selectedDiet == 'Ketojenik Diyet') {
      restaurantWidgets = [
        _buildRestaurantItem(
          'Ketojenik Restoran',
          'images/kofte.png',
          '101 Keto St., İstanbul',
        ),
      ];
    } else {
      restaurantWidgets = [
        _buildRestaurantItem(
          'Normal Restoran',
          'images/meat.png',
          '321 Normal Rd., İstanbul',
        ),
        _buildRestaurantItem(
          'Vejetaryen Restoran',
          'images/salata.png',
          '123 Veggie St., İstanbul',
        ),
        _buildRestaurantItem(
          'Vegan Restoran',
          'images/makarna.png',
          '456 Vegan Ave., İstanbul',
        ),
        _buildRestaurantItem(
          'Pesketaryen Restoran',
          'images/pizza.png',
          '789 Pescatarian Blvd., İstanbul',
        ),
        _buildRestaurantItem(
          'Ketojenik Restoran',
          'images/kofte.png',
          '101 Keto St., İstanbul',
        ),
      ];
    }
    return restaurantWidgets;
  }

  Widget _buildRestaurantItem(
      String title,
      String imagePath,
      String address,
      ) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Adres: $address',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: RestaurantPage(selectedDiet: ''),
  ));
}
import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {
  final String selectedDiet;
  final List<String> selectedDiseases;

  const RestaurantPage({
    Key? key,
    required this.selectedDiet,
    required this.selectedDiseases,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Restaurant> allRestaurants = [
      Restaurant(
        title: 'Vejetaryen Restoran',
        imagePath: 'images/salata.jpg',
        address: '123 Veggie St., İstanbul',
        diets: ['Vejetaryen', 'Normal'],
      ),
      Restaurant(
        title: 'Vegan Restoran',
        imagePath: 'images/makarna.jpg',
        address: '456 Vegan Ave., İstanbul',
        diets: ['Vegan', 'Normal'],
      ),
    ];
    List<Restaurant> filteredRestaurants = allRestaurants.where((restaurant) {
      return restaurant.diets.contains(selectedDiet) &&
          !restaurant.diets.any((disease) => selectedDiseases.contains(disease));
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diyet Restoranları'),
      ),
      body: ListView.builder(
        itemCount: filteredRestaurants.length,
        itemBuilder: (context, index) {
          // Filtrelenmiş restoranları oluştur.
          Restaurant restaurant = filteredRestaurants[index];
          return _buildRestaurantItem(context, restaurant);
        },
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              restaurant.imagePath,
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
                  restaurant.title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Adres: ${restaurant.address}',
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

class Restaurant {
  final String title;
  final String imagePath;
  final String address;
  final List<String> diets;

  Restaurant({
    required this.title,
    required this.imagePath,
    required this.address,
    required this.diets,
  });
}

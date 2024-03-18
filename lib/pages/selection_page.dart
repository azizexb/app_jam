// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/restourant_page.dart';


void main() {
  runApp(SelectionPage());
}

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedDiet = '';
  List<String> selectedDiseases = [];

  List<String> getRecommendedRestaurants() {
    if (selectedDiet == 'Vejetaryen') {
      return ['Vejetaryen Restoran', 'Vegan Restoran'];
    } else if (selectedDiet == 'Vegan') {
      return ['Vegan Restoran'];
    } else if (selectedDiet == 'Pesketaryen') {
      return ['Vejetaryen Restoran', 'Vegan Restoran', 'Pesketaryen Restoran'];
    } else {
      return ['Vejetaryen Restoran','Vegan Restoran', 'Pesketaryen Restoran'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 177, 234, 242),
        title: const Text('Local Health '),
        
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "images/background_images.jpg",
              fit: BoxFit.cover,
            ),
          ),
         SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  width: 15.0,
                ),
                const Text(
                  'Lütfen beslenme alışkanlığınızı seçiniz',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0
                  ),
                ),
                CheckboxListTile(
                  title: const Text('Vejetaryen'),
                  value: selectedDiet == 'Vejetaryen',
                  onChanged: (value) {
                    setState(() {
                      selectedDiet ='Vejetaryen';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Vegan'),
                  value: selectedDiet == 'Vegan',
                  onChanged: (value) {
                    setState(() {
                      selectedDiet ='Vegan';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Pesketaryen'),
                  value: selectedDiet == 'Pesketaryen',
                  onChanged: (value) {
                    setState(() {
                      selectedDiet ='Pesketaryen';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Ketojenik Diyet'),
                  value: selectedDiet == 'Ketojenik Diyet',
                  onChanged: (value) {
                    setState(() {
                      selectedDiet ='Ketojenik Diyet';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Benimsediğim bir beslenme şekli yok'),
                  value: selectedDiet == 'Benimsediğim bir beslenme şekli yok',
                  onChanged: (value) {
                    setState(() {
                      selectedDiet ='Benimsediğim bir beslenme şekli yok';
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Lütfen size uygun olan seçeneği seçiniz',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0
                  ),
                ),
                CheckboxListTile(
                  title: const Text('Çölyak'),
                  value: selectedDiseases.contains('Çölyak'),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        selectedDiseases.add('Çölyak');
                      } else {
                        selectedDiseases.remove('Çölyak');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Diyabet'),
                  value: selectedDiseases.contains('Diyabet'),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        selectedDiseases.add('Diyabet');
                      } else {
                        selectedDiseases.remove('Diyabet');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Hipertansiyon'),
                  value: selectedDiseases.contains('Hipertansiyon'),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        selectedDiseases.add('Hipertansiyon');
                      } else {
                        selectedDiseases.remove('Hipertansiyon');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Kolestrol'),
                  value: selectedDiseases.contains('Kolestrol'),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        selectedDiseases.add('Kolestrol');
                      } else {
                        selectedDiseases.remove('Kolestrol');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Böbrek Hastalıkları'),
                  value: selectedDiseases.contains('Böbrek Hastalıkları'),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        selectedDiseases.add('Böbrek Hastalıkları');
                      } else {
                        selectedDiseases.remove('Böbrek Hastalıkları');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Kanser'),
                  value: selectedDiseases.contains('Kanser'),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        selectedDiseases.add('Kanser');
                      } else {
                        selectedDiseases.remove('Kanser');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Kalp-Damar Hastalıkları'),
                  value: selectedDiseases.contains('Kalp-Damar Hastalıkları'),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        selectedDiseases.add('Kalp-Damar Hastalıkları');
                      } else {
                        selectedDiseases.remove('Kalp-Damar Hastalıkları');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Hastalığım yok'),
                  value: selectedDiseases.contains('Hastalığım yok'),
                  onChanged: (value) {
                    setState(() {
                      if (value!) {
                        selectedDiseases.add('Hastalığım yok');
                      } else {
                        selectedDiseases.remove('Hastalığım yok');
                      }
                    });
                  },
                ),
        
                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestaurantPage(selectedDiet: selectedDiet),
                      ),
                      );
                    },
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(const Color.fromARGB(255, 1, 54, 61),)
                      ),
                    child: const Text(
                        'Seçimleri Kaydet',
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
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
  }
}
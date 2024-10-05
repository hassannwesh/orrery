
import 'package:flutter/material.dart';
import 'package:orrery/screens/menu_screen.dart';
import 'package:orrery/screens/planet_details.dart';

class SearchScreen extends StatelessWidget {

  final List<Map<String, String>> planets = [
    {
      'name': 'Mercury',
      'image': 'assets/mercury_info.png',
      'description': 'The Living Planet',
      'imageDetail': 'assets/mercury_info.png',
      'additionalDetails': 'Distance from Sun: 57.91 million km\n'
          'Length of day: 58d 15h 30m\n'
          'Orbital period: 88 days\n'
          'Gravity: 3.7 m/s²\n'
          'Surface area: 74.8 million km²',
    },
    {
      'name': 'Venus',
      'image': 'assets/venu.png',
      'description': 'The Hot Planet',
      'imageDetail': 'assets/venu.png',
      'additionalDetails': 'Distance from Sun: 108.2 million km\n'
          'Length of day: 116d 18h 0m\n'
          'Orbital period: 225 days\n'
          'Gravity: 8.87 m/s²\n'
          'Surface area: 460.2 million km²',
    },
    {
      'name': 'Earth',
      'image': 'assets/earth.png',
      'description': 'Our Home',
      'imageDetail': 'assets/earth.png',
      'additionalDetails': 'Distance from Sun: 149.6 million km\n'
          'Length of day: 24h 0m 0s\n'
          'Orbital period: 365.25 days\n'
          'Gravity: 9.81 m/s²\n'
          'Surface area: 510.1 million km²',
    },
    {
      'name': 'Mars',
      'image': 'assets/mars.png',
      'description': 'The Red Planet',
      'imageDetail': 'assets/mars.png',
      'additionalDetails': 'Distance from Sun: 227.9 million km\n'
          'Length of day: 24h 39m 35.244s\n'
          'Orbital period: 687 days\n'
          'Gravity: 3.721 m/s²\n'
          'Surface area: 144.8 million km²',
    },
    {
      'name': 'Jupiter',
      'image': 'assets/Jup.png',
      'description': 'The Gas Giant',
      'imageDetail': 'assets/Jup.png',
      'additionalDetails': 'Distance from Sun: 778.5 million km\n'
          'Length of day: 9h 55m 30s\n'
          'Orbital period: 11.86 years\n'
          'Gravity: 24.79 m/s²\n'
          'Surface area: 61.42 billion km²',
    },
    {
      'name': 'Saturn',
      'image': 'assets/satu.png',
      'description': 'The Ringed Planet',
      'imageDetail': 'assets/satu.png',
      'additionalDetails': 'Distance from Sun: 1.434 billion km\n'
          'Length of day: 10h 33m 38s\n'
          'Orbital period: 29.46 years\n'
          'Gravity: 10.44 m/s²\n'
          'Surface area: 42.7 billion km²',
    },
    {
      'name': 'Uranus',
      'image': 'assets/uran.png',
      'description': 'The Ice Giant',
      'imageDetail': 'assets/uran.png',
      'additionalDetails': 'Distance from Sun: 2.871 billion km\n'
          'Length of day: 17h 14m 24s\n'
          'Orbital period: 84 years\n'
          'Gravity: 8.69 m/s²\n'
          'Surface area: 8.083 billion km²',
    },
    {
      'name': 'Neptune',
      'image': 'assets/nep.png',
      'description': 'The Windy Planet',
      'imageDetail': 'assets/nep.png',
      'additionalDetails': 'Distance from Sun: 4.495 billion km\n'
          'Length of day: 16h 6m 36s\n'
          'Orbital period: 164.8 years\n'
          'Gravity: 11.15 m/s²\n'
          'Surface area: 7.618 billion km²',
    },
    {
      'name': 'Pluto',
      'image': 'assets/Plu.png',
      'description': 'The Dwarf Planet',
      'imageDetail': 'assets/Plu.png',
      'additionalDetails': 'Distance from Sun: 5.906 billion km\n'
          'Length of day: 153h 0m 0s\n'
          'Orbital period: 248 years\n'
          'Gravity: 0.62 m/s²\n'
          'Surface area: 1.67 million km²',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          },
        ),
        title: const Text('SEARCH'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          itemCount: planets.length,
          itemBuilder: (context, index) {
            final planet = planets[index];
            final planetName = planet['name'] ?? 'Unknown';
            final planetImage = planet['image'] ?? 'assets/default_image.png';

            return ListTile(
              leading: Image.asset(
                planetImage,
                width: 80,
                height: 80,
              ),
              title: Text(
                planetName,
                style: const TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanetDetailScreen(
                      planet: planet['name'] ?? 'Unknown Planet',
                      imagePath: planet['image'] ?? 'assets/default_image.png',
                      imageDetailPath:
                          planet['imageDetail'] ?? 'assets/default_image.png',
                      description:
                          planet['description'] ?? 'No description available',
                      imagePaths: [
                        planet['image'] ?? 'assets/default_image.png',
                      ],
                      imageDetail2: '',
                      additionalDetails: planet['additionalDetails']!,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

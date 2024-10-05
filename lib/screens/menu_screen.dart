import 'package:flutter/material.dart';
import 'package:orrery/screens/RocketLaunchScreen.dart';
import 'package:orrery/screens/SearchScreen.dart';
import 'package:orrery/screens/planet_details.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  // Screens for navigation
  final List<Widget> pages = [
    const MenuScreenContent(), // Separate widget for MenuScreen content
    SolarSystemScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        backgroundColor: Colors.black,
        //indicatorColor: Colors.white,
        //shadowColor: ,
        // surfaceTintColor: Colors.red,
        onDestinationSelected: (index) => setState(() => currentIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ), // Home icon
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.rocket_launch,
              color: Colors.white,
            ),
            // Rocket icon
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ), // Search icon
            label: '',
          ),
        ],
      ),
    );
  }
}

class MenuScreenContent extends StatefulWidget {
  const MenuScreenContent({super.key});

  @override
  _MenuScreenContentState createState() => _MenuScreenContentState();
}

class _MenuScreenContentState extends State<MenuScreenContent> {
  int currentIndex = 0; // Current planet index


  final List<Map<String, String>> planets = [
    {
      'name': 'Mercury',
      'image': 'assets/mercury.png.png',
      'description': 'The Living Planet',
      ' imageDetail2':'assets/home.png.png',
      'imageDetail': 'assets/mercury_info.png',
      'additionalDetails': 'Distance from Sun: 57.91 million km\n'
          'Length of day: 58d 15h 30m\n'
          'Orbital period: 88 days\n'
          'Gravity: 3.7 m/s²\n'
          'Surface area: 74.8 million km²',
    },
    {
      'name': 'Venus',
      'image': 'assets/Planet_Venus.png.png',
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
      'image': 'assets/Planet_Earth.png.png',
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
      'image': 'assets/Planet_Mars.png.png',
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
      'image': 'assets/Planet_Jupiter.png.png',
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
      'image': 'assets/Planet_Saturn.png.png',
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
      'image': 'assets/Planet_Uranus.png.png',
      'description': 'The Ice Giant',
      'imageDetail': 'assets/uran.png',
      ' imageDetail2':'assets/home.png.png',
      'additionalDetails': 'Distance from Sun: 2.871 billion km\n'
          'Length of day: 17h 14m 24s\n'
          'Orbital period: 84 years\n'
          'Gravity: 8.69 m/s²\n'
          'Surface area: 8.083 billion km²',
    },
    {
      'name': 'Neptune',
      'image': 'assets/Planet_Neptune.png.png',
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
      'image': 'assets/Planet_Pluto.png.png',
      'description': 'The Dwarf Planet',
      'imageDetail': 'assets/Plu.png',
      'additionalDetails': 'Distance from Sun: 5.906 billion km\n'
          'Length of day: 153h 0m 0s\n'
          'Orbital period: 248 years\n'
          'Gravity: 0.62 m/s²\n'
          'Surface area: 1.67 million km²',
    },
  ];

  void nextPlanet() {
    setState(() {
      currentIndex = (currentIndex + 1) % planets.length;
    });
  }

  void previousPlanet() {
    setState(() {
      currentIndex = (currentIndex - 1 + planets.length) % planets.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final planet = planets[currentIndex];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const Text(
            'SPACED',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Which planet\nwould you like to explore?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: Stack(
              children: [
                Image.asset(
                  planet['image']!,
                  width: 350,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: previousPlanet,
              ),
              const SizedBox(width: 60),
              Column(
                children: [
                  Text(
                    planet['name']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    planet['description']!,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 60),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onPressed: nextPlanet,
              ),
            ],
          ),
          const SizedBox(height: 80),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
              ),
              onPressed: () {
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
                      imageDetail2: planet['assets/home.png.png']??'assets/home.png.png',
                      additionalDetails: planet['additionalDetails']!,
                    ),
                  ),
                );
              },
              child: const Text(
                'Explore planet',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

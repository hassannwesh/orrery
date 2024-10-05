import 'package:flutter/material.dart';
import 'package:orrery/screens/planet_details.dart';

class PlanetModel extends StatelessWidget {
  final String planetPhoto;
  final String planetName;
  final String description;
  final String imageDetailPath;
  final String additionalDetails;


  const PlanetModel({
    super.key,
    required this.planetPhoto,
    required this.planetName,
    required this.description,
    required this.imageDetailPath, required this.additionalDetails,

    // إضافة مسار الصورة الجديدة
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(planetPhoto, width: 50),
      title: Text(planetName, style: const TextStyle(color: Colors.white)),
      subtitle: Text(description, style: const TextStyle(color: Colors.white70)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlanetDetailScreen(
              planet: planetName,
              imagePath: planetPhoto, // الصورة المستخدمة في MenuScreen
              imageDetailPath: imageDetailPath, // الصورة الجديدة لشاشة التفاصيل
              description: description,
              imagePaths: [
                imageDetailPath, // يمكنك إضافة صور إضافية إذا رغبت
                // 'assets/other_image.png', // مثال لصورة أخرى
              ], imageDetail2: '', additionalDetails: additionalDetails,

            ),
          ),
        );
      },
    );
  }
}

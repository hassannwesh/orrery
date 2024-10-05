import 'package:flutter/material.dart';
import 'package:orrery/screens/RocketLaunchScreen.dart';


class PlanetDetailScreen extends StatelessWidget {
  final String planet;
  final String imagePath; // الصورة المستخدمة في MenuScreen
  final String imageDetailPath; // الصورة الجديدة لشاشة التفاصيل
  final String description;
  final List<String> imagePaths;
  final String imageDetail2;
  final String additionalDetails;
  // قائمة صور الكوكب

  const PlanetDetailScreen({
    super.key,
    required this.planet,
    required this.imagePath,
    required this.imageDetailPath,
    required this.description,
    required this.imagePaths,
    required this.imageDetail2, required this.additionalDetails, // تمرير قائمة الصور
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // خلفية الصورة
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backeground.png'),
                // مسار الصورة الخلفية
                fit: BoxFit.cover,
              ),
            ),
          ),
          // صورة الكوكب في الزاوية العليا اليمنى
          Positioned(
            top: -10, // يمكنك تعديل القيمة حسب المسافة المطلوبة من الأعلى
            right: -60, // يمكنك تعديل القيمة حسب المسافة المطلوبة من اليمين
            child: Image.asset(
              imageDetailPath, // مسار صورة الكوكب
              height: 200,
              width: 200,
            ),
          ),
          // محتوى الشاشة
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // زر العودة
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); // العودة إلى الشاشة السابقة
                    },
                  ),
                  const SizedBox(height: 20),
                  // اسم الكوكب
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    // إضافة مسافة من الأعلى
                    child: Text(
                      planet.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // وصف الكوكب
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // قائمة الصور
                  Column(
                    children: imagePaths.map((imageDetail2) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Image.asset(
                          imageDetail2, // مسار كل صورة
                          height: 200, // ارتفاع الصورة
                          fit: BoxFit.cover, // ضبط الصورة لتناسب العرض
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  // معلومات إضافية عن الكوكب
                   Text(
                    additionalDetails,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 60),
                  // زر "Take a trip"
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SolarSystemScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withOpacity(0.5), // لون الزر شفاف قليلاً
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                        child: Text(
                          'Take a trip',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
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
  }
}

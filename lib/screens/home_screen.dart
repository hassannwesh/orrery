import 'package:flutter/material.dart';

import 'menu_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Center( // استخدام Center بدلاً من Stack
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // صورة رائد الفضاء في المركز
              Image.asset(
                'assets/home.png.png', // تأكد من أن المسار صحيح
                width: 290,
                height: 240,
                fit: BoxFit.cover, // التأكد من تغطية المساحة بشكل جيد
              ),
              const SizedBox(height: 25),
              // النص أسفل الصورة
              const Column(
                children: [
                  Text(
                    'SPACE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  Text(
                    'Knowledge',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // زر "Go menu"
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.black, // لون الزر الخلفي
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child:  const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Go',
                      style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward,color: Colors.white
                      ,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

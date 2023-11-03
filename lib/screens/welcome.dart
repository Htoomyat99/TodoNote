import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/screens/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void goNote(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.yellow.shade600, Colors.yellow.shade300],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 70,
              ),
              const Text(
                'To Do App',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Lottie.asset('assets/animations/todo.json',
                  width: 280, height: 280),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Manage Events Easily',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              const Text(
                'Achieve more every day',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 180,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[300],
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
                onPressed: () => goNote(context),
                label: const Text(
                  'Start',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                icon: const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

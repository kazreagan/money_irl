import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 60),

            Center(
              child: Image.asset(
                'assets/images/money.png',
                height: 200,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 40),

            // Text(
            //   'Money IRL',
            //   style: Theme.of(context).textTheme.headlineSmall,
            // ),

            // const SizedBox(height: 8),

            Text(
              'Practice real-life money decisions.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
              
                onPressed: () {
                  context.go('/life-situation');
                },
                child: const Text('Begin'),
              ),
            ),
            // Text('Money IRL', style: Theme.of(context).textTheme.headlineLarge),
            // const SizedBox(height: 16),
            // Text(
            //   'Practice real-life money decisions.\nNo pressure. No judgment.',
            //   style: Theme.of(context).textTheme.bodyLarge,
            // ),
            // const SizedBox(height: 40),
            // ElevatedButton(
            //   onPressed: () {
            //     context.go('/life-situation');
            //   },
            //   child: const Text('Begin'),
            // ),
          ],
        ),
      ),
    );
  }
  
}

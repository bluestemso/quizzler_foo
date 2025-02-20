import 'package:flutter/material.dart';

class ThemePreview extends StatelessWidget {
  const ThemePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Preview'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Headline 1', style: Theme.of(context).textTheme.headlineLarge),
              Text('Headline 2', style: Theme.of(context).textTheme.headlineMedium),
              Text('Headline 3', style: Theme.of(context).textTheme.headlineSmall),
              Text('Body Text', style: Theme.of(context).textTheme.bodyLarge),
              Text('Body Text (Secondary)', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer)),
              Text('Button', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated Button'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined Button'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Text Button'),
              ),
              Container(
                color: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.all(8),
                child: Text('Primary Color', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
              ),
              Container(
                color: Theme.of(context).colorScheme.secondary,
                padding: const EdgeInsets.all(8),
                child: Text('Secondary Color', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
              ),
              // ... add more examples for other colors and text styles
            ],
          ),
        ),
      ),
    );
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'recipe.dart';

// A sample JSON string (replace with network fetch logic if needed)
const String recipeJson = '''
[
  {
    "id": "1",
    "title": "Spaghetti Carbonara",
    "ingredients": ["pasta", "eggs", "bacon", "cheese"]
  },
  {
    "id": "2",
    "title": "Chicken Curry",
    "ingredients": ["chicken", "curry powder", "coconut milk", "rice"]
  },
  {
    "id": "3",
    "title": "Vegetable Stir Fry",
    "ingredients": ["mixed vegetables", "soy sauce", "noodles"]
  }
]
''';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe List',
      home: RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatelessWidget {
  RecipeListScreen({super.key});

  // Function to parse the JSON string into a List<Recipe>
  List<Recipe> parseRecipes(String jsonString) {
    final List<dynamic> parsed = jsonDecode(jsonString); // Decode the raw JSON string
    // Map each JSON object to a Recipe instance using the factory constructor
    return parsed.map<Recipe>((json) => Recipe.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<Recipe> recipes = parseRecipes(recipeJson); // Parse the data

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Titles'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: recipes.length, // Total number of items in the list
        itemBuilder: (context, index) {
          // Display each recipe title in a ListTile
          return ListTile(
            title: Text(recipes[index].title),
            subtitle: Text('Ingredients: ${recipes[index].ingredients.join(', ')}'),
            leading: const Icon(Icons.food_bank),
            onTap: () {
              // Handle tap event (e.g., navigate to a detail screen)
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped on ${recipes[index].title}')),
              );
            },
          );
        },
      ),
    );
  }
}
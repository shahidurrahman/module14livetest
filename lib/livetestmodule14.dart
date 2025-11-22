import 'dart:convert';
import 'package:flutter/material.dart';
import 'recipe.dart';

// A sample JSON string
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

// void main() {
//   runApp(const RecipeApp());
// }
//
// class RecipeApp extends StatelessWidget {
//   const RecipeApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Recipe List',
//       home: RecipeListScreen(),
//     );
//   }
// }

class RecipeListScreen extends StatelessWidget {
  RecipeListScreen({super.key});


  List<Recipe> parseRecipes(String jsonString) {
    final List<dynamic> parsed = jsonDecode(jsonString);

    return parsed.map<Recipe>((json) => Recipe.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<Recipe> recipes = parseRecipes(recipeJson);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Titles'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {

          return ListTile(
            title: Text(recipes[index].title),
            subtitle: Text('Ingredients: ${recipes[index].ingredients.join(', ')}'),
            leading: const Icon(Icons.food_bank),
            onTap: () {

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
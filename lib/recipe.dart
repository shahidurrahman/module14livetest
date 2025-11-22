class Recipe {
  final String id;
  final String title;
  final List<String> ingredients;

  Recipe({
    required this.id,
    required this.title,
    required this.ingredients,
  });

  // Factory constructor to create a Recipe instance from a JSON map
  factory Recipe.fromJson(Map<String, dynamic> json) {
    var ingredientsList = json['ingredients'] as List;
    List<String> parsedIngredients = ingredientsList.cast<String>();

    return Recipe(
      id: json['id'].toString(), // Ensure ID is a string
      title: json['title'] as String,
      ingredients: parsedIngredients,
    );
  }
}
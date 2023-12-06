class Recipe {
  int? id;
  String name;
  String ingredients;
  String procedure;
  String? imageFileName;
  String createdBy;
  String servings;
  String cookTime;
  String preparationTime;

  Recipe({
    this.id,
    required this.name,
    required this.ingredients,
    required this.procedure,
    required this.imageFileName,
    required this.createdBy,
    required this.servings,
    required this.cookTime,
    required this.preparationTime,
  });

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['recipe_id'],
      name: map['recipe_name'],
      ingredients: map['ingredients'],
      procedure: map['procedure'],
      imageFileName: map['imageFileName'],
      createdBy: map['created_by'],
      servings: map['servings'],
      cookTime: map['cookTime'],
      preparationTime: map['preparationTime'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'recipe_name': name,
      'ingredients': ingredients,
      'procedure': procedure,
      'imageFileName': imageFileName,
      'created_by': createdBy,
      'servings': servings,
      'cookTime': cookTime,
      'preparationTime': preparationTime,
    };
  }
}

class Recipe {
  int? id;
  String name;
  List<String> ingredients;
  String procedure;
  String image;
  String createdBy;
  String servings;
  String cookTime;

  Recipe(
      {this.id,
      required this.name,
      required this.ingredients,
      required this.procedure,
      required this.image,
      required this.createdBy,
      required this.servings,
      required this.cookTime});

  // Convert a map to a Recipe object
  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['recipe_id'],
      name: map['recipe_name'],
      ingredients: List<String>.from(map['ingredients']),
      procedure: map['procedure'],
      image: map['image'],
      createdBy: map['created_by'],
      servings: map['servings'],
      cookTime: map['cookTime'],
    );
  }

  // Convert a Recipe object to a map
  Map<String, dynamic> toMap() {
    return {
      'recipe_id': id,
      'recipe_name': name,
      'ingredients': ingredients,
      'procedure': procedure,
      'image': image,
      'created_by': createdBy,
      'servings': servings,
      'cookTime': cookTime,
    };
  }
}

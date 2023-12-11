class Recipe {
  int? id;
  String name;
  String servings;
  String preparationTime;
  String
      cookTime; // Changed to String to match the "cook_time" column in the database
  String ingredients;
  String procedure;
  String?
      image; // Changed to String to match the "image" column in the database
  dynamic createdBy;

  Recipe({
    this.id,
    required this.name,
    required this.servings,
    required this.preparationTime,
    required this.cookTime,
    required this.ingredients,
    required this.procedure,
    this.image,
    required this.createdBy,
  });

  // Convert a map to a Recipe object
  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['recipe_id'],
      name: map['recipe_name'],
      servings: map['servings'],
      preparationTime: map['preparation_time'],
      cookTime: map['cook_time'],
      ingredients: map['ingredients'],
      procedure: map['procedure'],
      image: map['image'],
      createdBy: map['created_by'],
    );
  }

  // Convert a Recipe object to a map
  Map<String, dynamic> toMap() {
    return {
      'recipe_id': id,
      'recipe_name': name,
      'servings': servings,
      'preparation_time': preparationTime,
      'cook_time': cookTime,
      'ingredients': ingredients,
      'procedure': procedure,
      'image': image,
      'created_by': createdBy,
    };
  }
}

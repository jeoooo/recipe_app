class Recipe {
  String id;
  String collectionId;
  String collectionName;
  DateTime created;
  DateTime updated;
  String userId;
  String recipeName;
  String recipeServings;
  String recipePreparationTime;
  String ingredients;
  String procedure;
  String image;

  Recipe({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.userId,
    required this.recipeName,
    required this.recipeServings,
    required this.recipePreparationTime,
    required this.ingredients,
    required this.procedure,
    required this.image,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: DateTime.parse(json['created']),
      updated: DateTime.parse(json['updated']),
      userId: json['user_id'],
      recipeName: json['recipe_name'],
      recipeServings: json['recipe_servings'],
      recipePreparationTime: json['recipe_preparation_time'],
      ingredients: json['ingredients'],
      procedure: json['procedure'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created.toIso8601String(),
      'updated': updated.toIso8601String(),
      'user_id': userId,
      'recipe_name': recipeName,
      'recipe_servings': recipeServings,
      'recipe_preparation_time': recipePreparationTime,
      'ingredients': ingredients,
      'procedure': procedure,
      'image': image,
    };
  }
}

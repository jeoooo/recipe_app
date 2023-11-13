class Recipe {
  String? id;
  String? collectionId;
  String? collectionName;
  DateTime? created;
  DateTime? updated;
  String? userId;
  String? recipeName;
  String? recipeServings;
  String? recipePreparationTime;
  String? ingredients;
  String? procedure;
  String? image;

  Recipe({
    this.id,
    this.collectionId,
    this.collectionName,
    this.created,
    this.updated,
    this.userId,
    this.recipeName,
    this.recipeServings,
    this.recipePreparationTime,
    this.ingredients,
    this.procedure,
    this.image,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: json['created'] != null ? DateTime.parse(json['created']) : null,
      updated: json['updated'] != null ? DateTime.parse(json['updated']) : null,
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
      'created': created?.toIso8601String(),
      'updated': updated?.toIso8601String(),
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

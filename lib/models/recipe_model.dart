class Recipe {
  String? id;
  String? imageUrl; // Store the URL or path to the image
  String? name;
  List<String>? ingredients;
  String? procedure;
  String? createdBy;

  Recipe({
    this.id,
    this.imageUrl,
    this.name,
    this.ingredients,
    this.procedure,
    this.createdBy,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((ingredient) => ingredient.toString())
          .toList(),
      procedure: json['procedure'],
      createdBy: json['createdBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'ingredients': ingredients,
      'procedure': procedure,
      'createdBy': createdBy,
    };
  }
}

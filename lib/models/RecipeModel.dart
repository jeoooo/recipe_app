// To parse this JSON data, do
//
//     final recipeModel = recipeModelFromJson(jsonString);

import 'dart:convert';

RecipeModel recipeModelFromJson(String str) =>
    RecipeModel.fromJson(json.decode(str));

String recipeModelToJson(RecipeModel data) => json.encode(data.toJson());

class RecipeModel {
  int? recipeId;
  String? recipeName;
  int? servings;
  String? preparationTime;
  String? recipeImage;
  String? ingredients;
  String? procedure;

  RecipeModel({
    this.recipeId,
    this.recipeName,
    this.servings,
    this.preparationTime,
    this.recipeImage,
    this.ingredients,
    this.procedure,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        recipeId: json["recipe_id"],
        recipeName: json["recipe_name"],
        servings: json["servings"],
        preparationTime: json["preparation_time"],
        recipeImage: json["recipe_image"],
        ingredients: json["ingredients"],
        procedure: json["procedure"],
      );

  Map<String, dynamic> toJson() => {
        "recipe_id": recipeId,
        "recipe_name": recipeName,
        "servings": servings,
        "preparation_time": preparationTime,
        "recipe_image": recipeImage,
        "ingredients": ingredients,
        "procedure": procedure,
      };
}

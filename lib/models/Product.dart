class Product {
  final String barcode;
  final String? name;
  final String? altName;
  final String? picture;
  final String? quantity;
  final List<String>? brands;
  final List<String>? manufacturingCountries;
  final ProductNutriscore? nutriScore;
  final ProductNovaScore? novaScore;
  final ProductEcoScore? ecoScore;
  final List<String>? ingredients;
  final List<String>? traces;
  final List<String>? allergens;
  final Map<String, String>? additives;
  final NutrientLevels? nutrientLevels;
  final NutritionFacts? nutritionFacts;
  final bool? ingredientsFromPalmOil;

  Product(
      {required this.barcode,
      this.name,
      this.altName,
      this.picture,
      this.quantity,
      this.brands,
      this.manufacturingCountries,
      this.nutriScore,
      this.novaScore,
      this.ecoScore,
      this.ingredients,
      this.traces,
      this.allergens,
      this.additives,
      this.nutrientLevels,
      this.nutritionFacts,
      this.ingredientsFromPalmOil});

  factory Product.fromJson(Map<String, dynamic> json) {
    dynamic response = json['response'];
    return Product(
      barcode: response['barcode'],
      name: response['name'],
      altName: response['altName'],
      picture: response['pictures']['product'],
      quantity: response['quantity'],
      brands: (response['brands'] as List<dynamic>)
          .map((dynamic e) => e.toString())
          .toList(),
      nutriScore: ProductNutriscore.values.firstWhere((dynamic e) =>
          e.toString() == 'ProductNutriscore.${response['nutriScore']}'),
      novaScore: ProductNovaScore.values.firstWhere((dynamic e) =>
          e.toString() == 'ProductNovaScore.group${response['novaScore']}'),
      ecoScore: ProductEcoScore.values.firstWhere((dynamic e) =>
          e.toString() == 'ProductEcoScore.${response['ecoScoreGrade']}'),
    );
  }
}

class NutritionFacts {
  final String servingSize;
  final Nutriment? calories;
  final Nutriment? fat;
  final Nutriment? saturatedFat;
  final Nutriment? carbohydrate;
  final Nutriment? sugar;
  final Nutriment? fiber;
  final Nutriment? proteins;
  final Nutriment? sodium;
  final Nutriment? salt;
  final Nutriment? energy;

  NutritionFacts(
      {required this.servingSize,
      this.calories,
      this.fat,
      this.saturatedFat,
      this.carbohydrate,
      this.sugar,
      this.fiber,
      this.proteins,
      this.sodium,
      this.salt,
      this.energy});
}

class Nutriment {
  final String unit;
  final dynamic perServing;
  final dynamic per100g;

  Nutriment({required this.unit, this.perServing, this.per100g});
}

class NutrientLevels {
  final String? salt;
  final String? saturatedFat;
  final String? sugars;
  final String? fat;

  NutrientLevels({this.salt, this.saturatedFat, this.sugars, this.fat});
}

enum ProductNutriscore { A, B, C, D, E }

enum ProductNovaScore { Group1, Group2, Group3, Group4 }

enum ProductEcoScore { A, B, C, D, E }

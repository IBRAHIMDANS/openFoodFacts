import 'package:flutter/material.dart';
import 'package:openfoodfacts/AppColors.dart';
import 'package:openfoodfacts/app_icons.dart';
import 'package:openfoodfacts/models/Product.dart';
import 'package:openfoodfacts/res/app_images.dart';

String getNutriscoreImagePath(ProductNutriscore? nutriscore) {
  switch (nutriscore) {
    case ProductNutriscore.A:
      return AppImages.nutriscoreA;
    case ProductNutriscore.B:
      return AppImages.nutriscoreB;
    case ProductNutriscore.C:
      return AppImages.nutriscoreC;
    case ProductNutriscore.D:
      return AppImages.nutriscoreD;
    case ProductNutriscore.E:
      return AppImages.nutriscoreE;
    default:
      return AppImages.nutriscoreE;
  }
}

Color getNutriscoreColor(ProductNutriscore? nutriscore) {
  switch (nutriscore) {
    case ProductNutriscore.A:
      return AppColors.nutriscoreA;
    case ProductNutriscore.B:
      return AppColors.nutriscoreB;
    case ProductNutriscore.C:
      return AppColors.nutriscoreC;
    case ProductNutriscore.D:
      return AppColors.nutriscoreD;
    case ProductNutriscore.E:
      return AppColors.nutriscoreE;
    default:
      return AppColors.gray2;
  }
}

Icon getEcoScoreIcon(ProductEcoScore? ecoScore) {
  switch (ecoScore) {
    case ProductEcoScore.A:
      return Icon(
        AppIcons.ecoscoreA,
        color: AppColors.ecoScoreA,
      );
    case ProductEcoScore.B:
      return Icon(
        AppIcons.ecoscoreB,
        color: AppColors.ecoScoreB,
      );
    case ProductEcoScore.C:
      return Icon(
        AppIcons.ecoscoreC,
        color: AppColors.ecoScoreC,
      );
    case ProductEcoScore.D:
      return Icon(
        AppIcons.ecoscoreD,
        color: AppColors.ecoScoreD,
      );
    case ProductEcoScore.E:
      return Icon(
        AppIcons.ecoscoreE,
        color: AppColors.ecoScoreE,
      );
    default:
      return Icon(
        AppIcons.ecoscoreE,
        color: AppColors.ecoScoreE,
      );
  }
}

String getEcoScoreHeadline(ProductEcoScore? ecoScore) {
  switch (ecoScore) {
    case ProductEcoScore.A:
      return 'Très faible impact environnemental';
    case ProductEcoScore.B:
      return 'Faible impact environnemental';
    case ProductEcoScore.C:
      return 'Impact modéré sur l\'environnement';
    case ProductEcoScore.D:
      return 'Impact environnemental élevé';
    case ProductEcoScore.E:
      return 'Impact environnemental très élevé';
    default:
      return 'Aucune information';
  }
}

String getNovaScoreHeadline(ProductNovaScore? novaScore) {
  switch (novaScore) {
    case ProductNovaScore.Group1:
      return 'Aliments non transformés ou transformés minimalement';
    case ProductNovaScore.Group2:
      return 'Ingrédients culinaires transformés';
    case ProductNovaScore.Group3:
      return 'Aliments transformés';
    case ProductNovaScore.Group4:
      return 'Produits alimentaires et boissons ultra-transformés';
    default:
      return 'Aucune information';
  }
}

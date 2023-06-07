import 'package:flutter_app_cat_breeds/domain/model/cat_breed.dart';

abstract class CatBreedsApi {
  Future<List<Breed>>? getBreeds();
}
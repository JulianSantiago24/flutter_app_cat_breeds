import 'package:flutter/material.dart';
import 'package:flutter_app_cat_breeds/domain/model/cat_breed.dart';
import 'package:flutter_app_cat_breeds/domain/repository/cat_breeds_api.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider({
    required this.catBreedsApi
  });

  CatBreedsApi catBreedsApi;

  List<Breed>? catBreedslist;
  List<Breed>? searchCatBreedslist;

  Future<void> loadCatBreeds() async {
   catBreedslist = await catBreedsApi.getBreeds();
   _setInitialList();
   notifyListeners();
  }

  void _setInitialList() {
    searchCatBreedslist = List<Breed>.from(catBreedslist ?? []);
  }

  void searchBreed(String filter){
    final filterLowerCase = filter.toLowerCase();
    if (filter == '') {
      _setInitialList();
    } else {
      searchCatBreedslist = List<Breed>.from(
        catBreedslist!.where(
          (element) => element.name.toLowerCase().contains(filterLowerCase)
        )
      );
    }
    notifyListeners();
  }
}
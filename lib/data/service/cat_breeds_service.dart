import 'package:flutter_app_cat_breeds/domain/model/cat_breed.dart';
import 'package:flutter_app_cat_breeds/domain/repository/cat_breeds_api.dart';
import 'package:http/http.dart' as http;

final Map<String, String> _header = <String, String>{
  'API-KEY': 'bda53789-d59e-46cd-9bc4-2936630fde39'
};

class CatBreedsService implements CatBreedsApi {
  @override
  Future<List<Breed>> getBreeds() async {
    var url = Uri.https('api.thecatapi.com', 'v1/breeds');
    var response = await http.get(
      url, 
      headers:_header
    );
    return breedFromJson(response.body);
  }
}
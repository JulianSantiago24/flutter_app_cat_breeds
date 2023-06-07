import 'dart:convert';

List<Breed> breedFromJson(String str) => List<Breed>.from(json.decode(str).map((x) => Breed.fromJson(x)));

String breedToJson(List<Breed> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Breed {
    final String id;
    final String name;
    final String temperament;
    final String origin;
    final String description;

    Breed({
        required this.id,
        required this.name,
        required this.temperament,
        required this.origin,
        required this.description,
    });

    Breed copyWith({
        String? id,
        String? name,
        String? temperament,
        String? origin,
        String? description,
    }) => 
        Breed(
            id: id ?? this.id,
            name: name ?? this.name,
            temperament: temperament ?? this.temperament,
            origin: origin ?? this.origin,
            description: description ?? this.description,
        );

    factory Breed.fromJson(Map<String, dynamic> json) => Breed(
        id: json['id'],
        name: json['name'],
        temperament: json['temperament'],
        origin: json['origin'],
        description: json['description'],
    );

    Map<String , dynamic> toJson() => {
        'id': id,
        'name': name,
        'temperament': temperament,
        'origin': origin,
        'description': description,
    };
}

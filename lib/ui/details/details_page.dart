import 'package:flutter/material.dart';
import 'package:flutter_app_cat_breeds/constanst.dart';
import 'package:flutter_app_cat_breeds/domain/model/cat_breed.dart';

class DetailsPage extends StatelessWidget {

  const DetailsPage({super.key, required this.catBreed});

  final Breed catBreed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: pinkAccent,
        title: Text(
          catBreed.name,
          style: const TextStyle(
            color: white,
            fontFamily: 'DancingScript',
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9.0),
                child: Image.asset(
                  'assets/details.png',
                  height: MediaQuery.of(context).size.height / 1.7,
                )
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Description',
                style: TextStyle(
                  color: pink,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    Text(catBreed.description, 
                      style: const TextStyle(
                        color: black,
                        fontSize: 15
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(catBreed.origin, 
                      style: const TextStyle(
                        color: black,
                        fontFamily: 'DancingScript',
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                      ),),
                    ),
                    const SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(catBreed.temperament, 
                      style: const TextStyle(
                        color: black,
                        fontFamily: 'DancingScript',
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                      )),
                    ),
                  ])
                ),
              )
            ],
          ),
        )
      )
    );
  }
}

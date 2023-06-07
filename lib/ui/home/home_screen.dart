import 'package:flutter_app_cat_breeds/constanst.dart';
import 'package:flutter_app_cat_breeds/domain/repository/cat_breeds_api.dart';
import 'package:flutter_app_cat_breeds/ui/details/details_page.dart';
import 'package:flutter_app_cat_breeds/ui/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen._({super.key});

  static Widget create() => ChangeNotifierProvider(
    lazy: false,
    create: (context) => HomeProvider(
      catBreedsApi: context.read<CatBreedsApi>(),
    )..loadCatBreeds(),
    child: const HomeScreen._(),
  );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    context.read<HomeProvider>().loadCatBreeds();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final response = context.watch<HomeProvider>().catBreedslist;
    return Scaffold(
      body: SafeArea(
        child: response == null 
        ? const Center(child: CircularProgressIndicator(
            color: pinkAccent,
          )) 
        : Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Text(
                'Cat breed',
                style: TextStyle(
                  color: pink,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),
              ),
              const SizedBox(height: 15.0),
              TextField(
                onChanged: (val){
                  context.read<HomeProvider>().searchBreed(val);
                },
                decoration: const InputDecoration(
                  hintText: 'Name of Breed',
                  fillColor: grey,
                  filled: true,
                  suffixIcon: Icon(Icons.search),
                  enabledBorder: InputBorder.none
                ),
              ),
              const SizedBox(height: 15.0),
              const Expanded(child: CatBreedsGrid())
            ],
          ),
        )
      )
    );
  }
}

class CatBreedsGrid extends StatelessWidget {
  const CatBreedsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final catBreeds = context.watch<HomeProvider>().searchCatBreedslist;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5
      ),
      itemCount: catBreeds?.length ?? 0,
      itemBuilder: (context, index) {
        final catBreed = catBreeds![index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(catBreed: catBreed),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: pink,
              borderRadius:  BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  catBreed.name,
                  style: const TextStyle(
                    color: white,
                    fontFamily: 'DancingScript',
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                ),
                const SizedBox(height: 20.0),
                ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/error.gif',
                  height: MediaQuery.of(context).size.width / 2,
                )),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Text(
                      catBreed.origin,
                      style: const TextStyle(
                      fontFamily: 'DancingScript',
                      fontWeight: FontWeight.w900                      
                    ),),
                    const SizedBox(width: 35.0),
                    Expanded(child: Text(catBreed.temperament)),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
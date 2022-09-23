import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridViewBuilderDemo(),
  ));
}

class GridViewBuilderDemo extends StatelessWidget {
  List<String> friuts_images = [
    "assets/images/avocado.jpeg",
    "assets/images/cashew.jpg",
    // "assets/images/CustardApple.jpeg",
    "assets/images/dragonfriut.jpg",
    "assets/images/durian.jpg",
    "assets/images/fig.jpg",
    "assets/images/FreshDates.jpg",
    "assets/images/jackfruit.webp",
    "assets/images/kiwi.jpg",
    "assets/images/litchi.jpg",
    "assets/images/mulberry.jpg",
    "assets/images/rambutan.jpg",
    "assets/images/starfruit.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "GridView Builder",
          style: TextStyle(fontSize: 40, color: Colors.amber),
        )),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Exotic Fruits",
                  style: TextStyle(fontSize: 35, color: Colors.indigo),
                ),
              ),
              GridView.builder(
                  itemCount: friuts_images.length,
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      friuts_images[index],
                      fit: BoxFit.cover,
                    );
                  }),
              const Center(
                child: Text(
                  "Exotic Fruits",
                  style: TextStyle(fontSize: 35, color: Colors.indigo),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: friuts_images.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 250,
                                  childAspectRatio: 1 / 2,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0,
                                  mainAxisExtent: 250),
                          itemBuilder: (BuildContext, index) {
                            return GridTile(
                              footer: Text("${friuts_images[index]}"),
                              child: Image.asset(
                                friuts_images[index],
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyCustomListView(),
  ));
}

class MyCustomListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyCustomListView_State();
}

class MyCustomListView_State extends State<MyCustomListView> {
  List<String> bikes = ["Enfield", "Yamaha", "Hero Honda", "Bajaj", "Honda"];
  List<String> bike_images = [
    "https://bd.gaadicdn.com/processedimages/royal-enfield/roadstar/640X309/roadstar62efbea09ec54.jpg",
    "https://media.zigcdn.com/media/model/2021/May/yamaha-fzfi-new-right-side-view_360x240.jpg",
    "https://imgd.aeplcdn.com/600x600/bw/models/hero-glamour-i3s-drum--bs-vi20200510005530.jpg",
    "https://cdn.bajajauto.com/-/media/assets/bajajauto/360degreeimages/bikes/pulsar/pulsar-125/split-seat-disc/pulsar-125-split-seat-ebony-black-and-solar-red/00.png",
    "https://static.autox.com/uploads/bikes/2021/02/honda-cb350rs.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Custom ListView"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.custom(
          padding: EdgeInsets.all(20),
          childrenDelegate: SliverChildBuilderDelegate(
              childCount: bike_images.length, (BuildContext, index) {
            return ListTile(
              textColor: Colors.purpleAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              tileColor: Colors.blueGrey,
              onTap: () {
                Fluttertoast.showToast(
                    msg: "you have selected ${bikes[index]}");
              },
              contentPadding: EdgeInsets.all(10),
              minVerticalPadding: 20,
              title: Text(bikes[index]),
              trailing: Image.network(bike_images[index]),
            );
          })),
    );
  }
}

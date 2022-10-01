import 'package:flutter/material.dart';

import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

void main(){
  runApp(MaterialApp(
    home: StaggeredGridViewDemo(),
  ));
}

class StaggeredGridViewDemo extends StatelessWidget{

  final List<Widget> _listTile = <Widget>[
    BackgroundTile(Image.asset("assets/images/car.png"),Text("cars1")),
    BackgroundTile(Image.asset("assets/images/cargif.gif"),Text("cars1")),
    BackgroundTile(Image.asset("assets/images/fig.jpg"),Text("cars1")),
    BackgroundTile(Image.network("https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/facelift_2019/homepage/families-gallery/2022/04_12/family_chooser_tecnica_m.png"),Text("cars1")),
    BackgroundTile(Image.network("https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/facelift_2019/homepage/families-gallery/2022/04_12/family_chooser_tecnica_m.png"),Text("cars1")),

  ];

  final List<StaggeredTile>  _cardTile =const <StaggeredTile> [
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 3),

  ];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: StaggeredGridView.count(
        crossAxisCount: 4,
        children: _listTile,
        staggeredTiles: _cardTile,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,

    ),
   );
  }
}

class BackgroundTile extends StatelessWidget{


  late final Image image;
  late final Text text;

   BackgroundTile(this.image,this.text);
  @override
  Widget build(BuildContext context) {
    return GridTile(child: image,
      header: text,


    );
  }

}
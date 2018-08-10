import 'package:chef_leon_app/pages/book/data.dart';
import 'package:flutter/material.dart';

class RecipiesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //app bar
    final appBar = AppBar(
      elevation: 3.0,
      title: Text('Recipies'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );

    ///create book tile hero
    createTile(Recipe recipe) => Hero(
      tag: recipe.title,
      child: Material(
        elevation: 15.0,
        shadowColor: Colors.brown.shade900,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'recipies/detail/${recipe.id}');
          },
          child: Image(
            image: AssetImage(recipe.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );

    ///create book grid tiles
    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverGrid.count(
            childAspectRatio: 2 / 3,
            crossAxisCount: 3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: recipies.map((recipe) => createTile(recipe)).toList(),
          ),
        )
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: grid,
    );
  }
}
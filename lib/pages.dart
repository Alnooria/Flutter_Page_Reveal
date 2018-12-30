import 'package:flutter/material.dart';

final pages = [
  new PageViewModel( 
     Colors.yellow,
     'assets/images.jpeg',
     'Minion',
     'I Am Awesome',
     'assets/mini.png',
     ),
 PageViewModel( 
     Colors.blue,
     'assets/minion3.png',
     'Minions',
     'Come And Dance..',
     'assets/minion4.png',
     ),
PageViewModel( 
     Colors.pink[300],
     'assets/miniongirl.png',
     'Cutie Minion',
     'I am Yo Yo Girl',
     'assets/balloon.png',
     )
];

class Page extends StatelessWidget{

  final PageViewModel viewModel;
  final percentVisible;
  Page({
    this.viewModel,
this.percentVisible
  });
  @override
  Widget build(BuildContext context){
    return Container(
      // new Container(
             width: double.infinity,
             color: viewModel.color,
             child: new Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Transform(
                   transform: Matrix4.translationValues(0.0, 50.0*(1.0-percentVisible), 0.0)
                 ),
                 Transform(
                   transform: Matrix4.translationValues(0.0, 30.0*(1.0-percentVisible), 0.0)
                 ),
                 new Image.asset(
                 viewModel.heroAssetPath,
                  width: 200.0,
                  height: 200.0),
              
              new Text(
                viewModel.title,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Arial',
                  fontSize: 22.0,
                )
              ),
               Padding(
                 padding: EdgeInsets.only(top: 10.0,bottom:10.0)
               ),
               Text(
                viewModel.body

               ),
                 ],
              )
          
    );
  } 
}

class PageViewModel
{
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssseticon;
PageViewModel(
  this.color,
  this.heroAssetPath,
  this.title,
  this.body,
  this.iconAssseticon,
);
}
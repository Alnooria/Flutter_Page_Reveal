import 'dart:ui';

import 'package:flutter/material.dart';
import 'pages.dart';
// import 'package:material_page_reveal_published/pages.dart';

class PagerIndicator extends StatelessWidget
{
  final PagerIndicatorViewModel viewModel;
  PagerIndicator({
    this.viewModel,
  });

  @override
  Widget build(BuildContext context){
    List<PageBubble> bubbles = [];
    for (var i=0; i < viewModel.pages.length; ++i ) {
      final page = viewModel.pages[i]; 

  var percentActive;
  if (i== viewModel.activeIndex)
  {
    percentActive = 1.0 - viewModel.slidepercent;
  } else if(i== viewModel.activeIndex - 1 && viewModel.slideDirection == SlideDirection.leftToRight) {
    percentActive= viewModel.slidepercent;
  }  else if(i == viewModel.activeIndex + 1 && viewModel.slideDirection == SlideDirection.rightToLeft) {
    percentActive=viewModel.slidepercent;
  }else {
    percentActive = 0.0;
  }

    bool isHollow = i > viewModel.activeIndex || (i == viewModel.activeIndex && viewModel.slideDirection == SlideDirection.leftToRight);

      bubbles.add(
        PageBubble(
           viewModel: new PagerBubbleViewModel(
             page.iconAssseticon, 
               page.color,
                isHollow,
                percentActive,
                ),

        ),
      );
    }
    return new Column(
          
          children: [
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: 
                bubbles,
         
        
            ),
          ],
        );
  }
}

enum SlideDirection {
  leftToRight,
  rightToLeft,
  none
}
class PagerIndicatorViewModel {
  final List<PageViewModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidepercent;

PagerIndicatorViewModel (
  this.pages,
  this.activeIndex, 
  this.slideDirection,
  this.slidepercent
);
}

class PageBubble extends StatelessWidget{
  final PagerBubbleViewModel viewModel;

  PageBubble({
    this.viewModel,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding:const EdgeInsets.all(10.0),
                  child:   Container(
                   
        
                    width : lerpDouble(20.0,45.0,viewModel.activePercent),
                   height: lerpDouble(20.0,45.0,viewModel.activePercent),
                      
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        
                      color : viewModel.isHollow
                        ? const Color(0X88FFFFFF).withAlpha(0x88 * viewModel.activePercent.round())
                        : const Color(0X88FFFFFF),
                      border: Border.all(
                        color: viewModel.isHollow
                        ? const Color(0X88FFFFFF).withAlpha(0x88 * viewModel.activePercent.round())
                        : Colors.transparent,
                      width:1.0,
                      ) 
                      
                      ),
               
                child: Image.asset(
                  viewModel.iconAssetPath,
                )
                ),
                );
  }
}
class PagerBubbleViewModel{
  final String iconAssetPath;
  final Color color;
  final bool isHollow;
  final double activePercent;

PagerBubbleViewModel(
  this.iconAssetPath,
  this.color,
  this.isHollow,
  this.activePercent,
);
}
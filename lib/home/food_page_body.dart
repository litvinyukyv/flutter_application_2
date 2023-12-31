import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_2/widgets/big_text.dart';
import 'package:test_2/widgets/icon_and_text_widjet.dart';
import 'package:test_2/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}): super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
double _scaleFactor=0.8;
double _height=220;

  @override
void initState(){
    super.initState();
    pageController.addListener(() {
setState(() {
  _currPageValue= pageController.page!;

});
    });
  }
  @override
  void dispose () {
    pageController.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildpageitem(position);
          }),
    );
  }
  Widget _buildpageitem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index==_currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrance = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrance, 0);
    }else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrance = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrance, 0);
    }else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index) * (1-_scaleFactor);
      var currTrance = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrance, 0);

    }else{
      var currScale=0.8;
         matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
          }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
        Container(
        height: 220,
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius. circular(30 ),
            color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/image/IMG_9997_design.jpg"
                )
            )
        ),
      ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 31, right: 31, bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius. circular(20),
                  color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0)
                  )
                ]

              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Yoga"),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) => Icon(Icons.star, color: Color(0xFF332d2b), size: 15,))
                        ),
                      SizedBox(width: 10,),
                      SmallText(text: "4.5"),
                      SizedBox(width: 10,),
                      SmallText(text: "1250"),
                      SizedBox(width: 10,),
                      SmallText(text: "comments"),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        IconandTextWidget(
                            icon: Icons.circle_sharp,
                            text: "Beginners",

                            iconColor: Colors.green),
                        IconandTextWidget(
                            icon: Icons.location_on,
                            text: "Salesianos",

                            iconColor: Colors.grey),
                        IconandTextWidget(
                            icon: Icons.access_time_rounded,
                            text: "60 min",

                            iconColor: Colors.green),
                      ],
                    )
                  ],
                ),
              ),

            ),
          )
        ],
      ),
    );
  }
}

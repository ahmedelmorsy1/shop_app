import 'package:flutter/material.dart';
import 'package:shop_app/components/methods.dart';
import 'package:shop_app/login/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BoardingModel{
  final String img;
  final String title;
  final String body;

  BoardingModel({required this.img, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      img: 'assets/images/onboard.jpg',
      title: 'on Board 1 title',
      body: 'on Board 1 body'
    ),
    BoardingModel(
      img: 'assets/images/onboard.jpg',
      title: 'on Board 2 title',
      body: 'on Board 2 body'
    ),
    BoardingModel(
      img: 'assets/images/onboard.jpg',
      title: 'on Board 3 title',
      body: 'on Board 3 body'
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(child: Text("Skip",),onPressed: (){
            navigateFinish(context, LoginScreen());
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                physics: BouncingScrollPhysics(),
                onPageChanged: (int index){
                  if (index ==boarding.length-1){
                    setState(() {
                      isLast = true;
                    });
                  }else{
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.deepOrange,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),),
                Spacer(),/// takes all the  empty space inside row or column
                FloatingActionButton(child:Icon(Icons.arrow_forward_ios),
                onPressed: (){
                  if(isLast){
                  navigateFinish(context, LoginScreen(),);
                  }else{
                  boardController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn);
                  }
                
                })
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${model.img}'),fit: BoxFit.cover,)),
          SizedBox(height: 50,),
          Column(
            children: [
              Text('${model.title}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text('${model.body}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      );
}

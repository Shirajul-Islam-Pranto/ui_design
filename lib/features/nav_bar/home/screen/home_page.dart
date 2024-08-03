
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:ui_design/common/custom_list/category_list.dart';
import 'package:ui_design/common/custom_list/hot_deal_list.dart';
import 'package:ui_design/common/custom_list/slider_list.dart';
import 'package:ui_design/common/styles.dart';
import 'package:ui_design/features/ourshop/model/shop_model.dart';
import 'package:ui_design/utils/app_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch=false;
  int _current = 0;
    CarouselController _controller = CarouselController();
  String? dropdownValue ;
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title:ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: TextField(
          
            decoration: InputDecoration(
              filled:true,
              fillColor: Colors.grey.withOpacity(0.2),
              hintText: "Search Here",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search)
            ),
          
          ),
        ) ,
        actions: [
          Icon(Icons.notifications_none_outlined),
          SizedBox(width: 12,)
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        child: SingleChildScrollView(
          child:Column(
            children: [

              Container(
                margin: EdgeInsets.symmetric(vertical: 14),
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  border: Border.all(color: AppColor.red),
                  borderRadius: BorderRadius.circular(12)
                ),

                child:Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select Motor parts by"),
                        IconButton(onPressed: (){
                          setState(() {
                            isSearch=!isSearch;
                          });
                        }, icon: Icon(Icons.arrow_downward))
                      ],
                    ),
                    Visibility(
                      visible: isSearch,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: dropdownValue,

                                  padding: EdgeInsets.symmetric(horizontal: 14),
                                  hint: Text("Motor",style: interBold,),

                                  icon:   Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style:   TextStyle(color: Colors.deepPurple),
                                  focusColor: Colors.red,

                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      dropdownValue = value!;
                                    });
                                  },
                                  items: list.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: dropdownValue,

                                  padding: EdgeInsets.symmetric(horizontal: 14),
                                  hint: Text("Motor",style: interBold,),

                                  icon:   Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style:   TextStyle(color: Colors.deepPurple),
                                  focusColor: Colors.red,

                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      dropdownValue = value!;
                                    });
                                  },
                                  items: list.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: dropdownValue,

                                  padding: EdgeInsets.symmetric(horizontal: 14),
                                  hint: Text("Motor",style: interBold,),

                                  icon:   Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style:   TextStyle(color: Colors.deepPurple),
                                  focusColor: Colors.red,

                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      dropdownValue = value!;
                                    });
                                  },
                                  items: list.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),

                            ],
                          ),
                          MaterialButton(onPressed: (){},
                          child: Text("Search"),
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),

                  ],
                )
              ),

             /* */

              Container(
                  child: Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 150,
                          aspectRatio: 16/9,
                          viewportFraction: 0.9,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: sliderList
                            .map((item) => Container(

                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(item, fit: BoxFit.fill, width: 1000,height: 180,)),
                        ))
                            .toList(),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: sliderList.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 10.0,
                                height: 10.0,
                                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.red.withOpacity(0.2)
                                        : Colors.red)
                                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  )),

              Container(
                height: 220,
                decoration: BoxDecoration(
                  color: AppColor.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Today's Deal",style: interBold,),
                      subtitle: Text("Grab your deal now",style: interRegular,),
                      trailing: MaterialButton(
                        onPressed: (){},
                        child: Text("View All",style: interMedium,),
                        padding: EdgeInsets.all(0),
                        textColor: Colors.red,
                        minWidth: 70,
                        height: 30,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: Colors.red
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 145,
                      child: ListView.builder(
                        shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: dealList.length,
                          itemBuilder: (context,index){
                        return Padding(
                          padding:   EdgeInsets.only(right: 16),
                          child: ClipRRect(
                           borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              children: [
                                Image.asset("${dealList[index].imageUrl}",width: size.width*.7,fit: BoxFit.cover, )
                              ,
                                Positioned(
                                    bottom: 6,
                                    left: 6,
                                    child: Text("${dealList[index].title}",style: interMedium.copyWith(color: Colors.white,
                                      fontSize: 16
                                    )),),
                                Positioned(child: ClipPath(
                                  clipper: BottomLeftClipper(clipSize: 30),
                                  child: Container(
                                    width: 50,
                                    height: 66,
                                    color: Colors.red,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage("${dealList[index].shopLogo}"
                                          ),
                                          maxRadius: 15,
                                        ),
                                        Text("${dealList[index].shopName}",style: interRegular.copyWith(fontSize: 10,color: Colors.white),)
                                      ],
                                    ),
                                  ),
                                ),
                                  top:0 ,
                                  right: 8,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),



                  ],
                ),
              ),
              Container(
                height: 350,
                decoration: BoxDecoration(
                  color: AppColor.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Our Categories",style: interBold,),
                      subtitle: Text("Recommended for you",style: interRegular,),
                      trailing: MaterialButton(
                        onPressed: (){},
                        child: Text("View All",style: interMedium,),
                        padding: EdgeInsets.all(0),
                        textColor: Colors.red,
                        minWidth: 70,
                        height: 30,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: Colors.red
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: dealList.length,
                          itemBuilder: (context,index){
                        return Padding(
                          padding:EdgeInsets.only(right: 16),
                          child:GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryList.length,
                              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                                childAspectRatio: 1.2
                              ) ,
                              itemBuilder: (context,index){
                                return Column(
                                  children: [
                                    Container(
                                      
                                      decoration: BoxDecoration(
                                        
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.black54,width: 1)
                                      ),
                                      padding: EdgeInsets.all(16),
                                      height: 90,width: 90,
                                      child: Image.asset("${categoryList[index].photo}"),
                                    ),
                                    Text("${categoryList[index].name}")
                                  ],
                                );
                              })
                        );
                      }),
                    ),



                  ],
                ),
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: AppColor.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Our Shops",style: interBold,),
                      subtitle: Text("Recommended for you",style: interRegular,),
                      trailing: MaterialButton(
                        onPressed: (){},
                        child: Text("View All",style: interMedium,),
                        padding: EdgeInsets.all(0),
                        textColor: Colors.red,
                        minWidth: 70,
                        height: 30,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: Colors.red
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 225,
                      child:ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemCount: shopList.length,
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                        return  Container(
                          margin: EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black54)
                          ),
                          width: size.width*0.37,
                          child: Column(
                            children: [
                              Image.asset("${shopList[index].image}",height: 90,fit: BoxFit.cover,),
                              Text("${shopList[index].title}"),
                              Spacer(),
                              PannableRatingBar(
                                rate: shopList[index].rating!.toDouble(),
                                items: List.generate(5, (index) =>
                                const RatingWidget(
                                  selectedColor: Colors.yellow,
                                  unSelectedColor: Colors.grey,
                                  child: Icon(
                                    Icons.star,
                                    size: 18,
                                  ),
                                )),
                                onChanged: (value) { // the rating value is updated on tap or drag.
                                  setState(() {
                                    shopList[index].rating = value.toInt();
                                  });
                                },
                              ),
                              Text("${shopList[index].address}"),
                              SizedBox(height: 8,)
                            ],
                          ),
                        );
                      })
                    ),



                  ],
                ),
              ),


            ],
          ) ,
        ),
      ),
    );
  }
}

class BottomLeftClipper extends CustomClipper<Path> {
  final double clipSize;

  BottomLeftClipper({required this.clipSize});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0,size.height -15);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width , 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return clipSize != (oldClipper as BottomLeftClipper).clipSize;
  }
}
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
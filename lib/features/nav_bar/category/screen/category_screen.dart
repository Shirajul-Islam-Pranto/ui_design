
import 'package:flutter/material.dart';
import 'package:ui_design/common/custom_list/category_list.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        width: double.infinity,
        child:Row(
          children: [
            Container(
              width: size.width *0.3,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categoryList.length,
                  itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    setState(() {
                      selectedIndex=index;
                    });
                  },
                  child: Container(
                    height: 150,

                    color:selectedIndex==index? Colors.lightBlueAccent.withOpacity(0.15):Colors.white,
                    child: Column(
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
                        SizedBox(height: 8,),
                        Text("${categoryList[index].name}")
                      ],
                    ),
                  ),
                );
              }),
            ),
            Container(
              width: size.width *0.67,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: categoryList[selectedIndex].subCategories!.length,
                  itemBuilder: (context,index){
                return  Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset("${categoryList[selectedIndex].subCategories![index].photo}",
                          height: 40,width: 40,
                          ),
                          Text("${categoryList[selectedIndex].subCategories![index].name}")
                        ],
                      ),
                      Divider()
                    ],
                  ),
                );
              }),
            ),
          ],
        ) ,
      ),
    );
  }
}

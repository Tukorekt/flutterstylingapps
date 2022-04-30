

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstylingapps/second_page.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:get/get.dart';

import 'main.dart';
class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CupertinoColors.black,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blueAccent.withOpacity(.1),Colors.black]
            )
        ),
        child: ListView(
          children: [
            StickyHeader(
                header: Container(
                  height: size.height/10,
                  decoration: const BoxDecoration(
                      color: Colors.black
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:  [
                      CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent.withOpacity(.2),
                        child: const Icon(CupertinoIcons.person_fill,color: Colors.white,),
                      ),
                      const Text('Моя медиатека',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                      const Icon(CupertinoIcons.search,color: Colors.white,),
                      const Icon(CupertinoIcons.add,color: Colors.white,)
                    ],
                  ),
                ),
                content: ListTile(
                  title: Container(
                    width: size.width,
                    height: size.height / 10,
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.only(right: 6,left: 6,top: 10,bottom: 10),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (_,index){
                          return Container(
                            width: size.width / 2,
                            height: size.height / 20,
                            margin: const EdgeInsets.only(right: 6,left: 6,top: 10,bottom: 10),
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0),
                                border: const Border(
                                    bottom: BorderSide(color: Colors.white),
                                    top: BorderSide(color: Colors.white),
                                    left: BorderSide(color: Colors.white),
                                    right: BorderSide(color: Colors.white)
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child:  const Center(
                              child: Text('Что-то большое',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                            ),
                          );
                        }
                    ),
                  ),
                  subtitle: ListTile(
                    title: Container(
                      margin: const EdgeInsets.only(top: 5,bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(CupertinoIcons.arrow_up_arrow_down,color: Colors.white,),
                          Expanded(child: Text(' По дате прослушивания',style: TextStyle(color: Colors.white),)),
                          Icon(CupertinoIcons.rectangle_grid_2x2,color: Colors.white),
                        ],
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        for (var i=0;i<10;i++)
                          Container(
                            width: size.width,
                            height: size.height / 10,
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: size.height / 10,
                                  height: size.height / 10,
                                  margin: EdgeInsets.only(right: 5),
                                  decoration: const BoxDecoration(
                                    color: CupertinoColors.systemPurple,
                                  ),
                                  child: const Icon(CupertinoIcons.heart_fill,color: CupertinoColors.white,),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Любимые треки', style: TextStyle(color: CupertinoColors.white),textAlign: TextAlign.start,),
                                    Text('Плейлист', style: TextStyle(color: CupertinoColors.white.withOpacity(.5)),textAlign: TextAlign.start)
                                  ],
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                )
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          onTap: (index){
            switch (index){
              case 0:
                Get.to(()=>const MainPage());
                break;
              case 1:
                Get.to(()=>const SecondPage());
                break;
            }
          },
          backgroundColor: CupertinoColors.black,
          unselectedItemColor: CupertinoColors.white.withOpacity(.5),
          selectedItemColor: CupertinoColors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.house_fill),label: 'Главная'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),label: 'Поиск'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.square_stack_3d_down_right),label: 'Моя медиатека'),
          ]
      ),
    );
  }
}

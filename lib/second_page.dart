
import 'package:flutterstylingapps/third_page.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'main.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

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
            Container(
              margin: EdgeInsets.only(top: size.height / 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Expanded(flex:1,child: SizedBox(width: 0,height: 0,)),
                  Expanded(flex:10,child: Text('Поиск',style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),)),
                  Expanded(flex:3,child: Icon(CupertinoIcons.photo_camera,color: Colors.white,))
                ],
              ),
            ),
            StickyHeader(
                header: Container(
                  margin: EdgeInsets.only(left:size.width * .075,right:size.width * .075,bottom:10,top: 10),
                  width: size.width,
                  height: size.height / 20,
                  color: CupertinoColors.black.withOpacity(0),
                  child: const Center(
                    child: CupertinoTextField(
                      prefix: Icon(CupertinoIcons.search),
                      placeholder: 'Исполнители, треки или подкасты',
                      placeholderStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                content: ListTile(
                  title: ListTile(
                    title: Container(
                      margin: const EdgeInsets.only(top: 15,bottom: 15),
                      child: const Text('Топ жанров',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                    ),
                    subtitle: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        for (var i=0;i<4;i++)
                          Container(
                            margin: const EdgeInsets.only(top:5,bottom: 5),
                            padding: const EdgeInsets.all(10),
                            width: size.width / 2.6,
                            height: size.height / 10,
                            decoration: BoxDecoration(
                                color: CupertinoColors.systemPurple,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: const Text('Что-то',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                          )
                      ],
                    ),
                  ),
                  subtitle: ListTile(
                    title: Container(
                      margin: const EdgeInsets.only(top: 15,bottom: 15),
                      child: const Text('Все остальное',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                    ),
                    subtitle: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        for (var i=0;i<20;i++)
                          Container(
                            margin: const EdgeInsets.only(top:5,bottom: 5),
                            padding: const EdgeInsets.all(10),
                            width: size.width / 2.6,
                            height: size.height / 10,
                            decoration: BoxDecoration(
                                color: CupertinoColors.systemPurple,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: const Text('Что-то',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
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
        currentIndex: 1,
          onTap: (index){
            switch (index){
              case 0:
                Get.to(()=>const MainPage());
                break;
              case 2:
                Get.to(()=>const ThirdPage());
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

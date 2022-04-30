import 'dart:io';
import 'package:flutterstylingapps/second_page.dart';
import 'package:flutterstylingapps/third_page.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  if (Platform.isAndroid){
    runApp(
        const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainPage(),
        )
    );
  } else {
    runApp(
        const CupertinoApp(
          home: MainPage(),
        )
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

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
          controller: ScrollController(),
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(15),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Expanded(
                      flex: 6,
                      child: Text('Добрый\nдень', style: TextStyle(color: CupertinoColors.white,fontSize: 25,fontWeight: FontWeight.bold),)
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(CupertinoIcons.bell,color: CupertinoColors.white,)
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(CupertinoIcons.time,color: CupertinoColors.white)
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(CupertinoIcons.settings,color: CupertinoColors.white)
                  )
                ],
              ),
              subtitle: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  for(var i = 0;i<6;i++)
                    Container(
                      margin: const EdgeInsets.only(top:5,bottom: 5),
                      width: size.width / 2.5,
                      height: size.height / 12,
                      decoration: BoxDecoration(
                          color: CupertinoColors.white.withOpacity(.1),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: size.height / 12,
                            height: size.height / 12,
                            padding: const EdgeInsets.all(1),
                            decoration: const BoxDecoration(
                                color: CupertinoColors.systemPurple,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5))
                            ),
                            child: const Icon(CupertinoIcons.heart_fill,color: CupertinoColors.white,),
                          )
                          ,
                          const Text('Любимые \nтреки', style: TextStyle(color: CupertinoColors.white,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    )
                ],
              ),
            ),
            for (var j=0;j<6;j++)
              ListTile(
                title: const Text('Слушаем дальше?', style: TextStyle(color: CupertinoColors.white,fontSize: 25,fontWeight: FontWeight.bold)),
                subtitle: SizedBox(
                  width: size.width,
                  height: size.width / 2,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (_,index){
                        return SizedBox(
                          width: size.width / 3,
                          height: size.width / 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width / 3.5,
                                height: size.width / 3.5,
                                padding: const EdgeInsets.all(1),
                                decoration: const BoxDecoration(
                                  color: CupertinoColors.systemPurple,
                                ),
                                child: const Icon(CupertinoIcons.heart_fill,color: CupertinoColors.white,),
                              ),
                              const Text('Любимые\nтреки', style: TextStyle(color: CupertinoColors.white),),
                              Text('Плейлист $index', style: TextStyle(color: CupertinoColors.white.withOpacity(.5)),)
                            ],
                          ),
                        );
                      }
                  ),
                ),
              )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index){
          switch (index){
            case 1:
              Get.to(()=>const SecondPage());
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

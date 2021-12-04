import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/profile/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        title: Image.asset("assets/images/logo.png"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              FontAwesomeIcons.bell,
              color: Colors.black54,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 30,bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Ahmad Nematov',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23
                ),),
                SizedBox(height: 3),
                Text('+998937725598',style: TextStyle(
                    color: Colors.grey,

                    fontSize: 17
                ),),
              ],
            ),
          ),
          const Divider(height: 2,color: Colors.black12,),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(FontAwesomeIcons.userEdit,size: 20),
                ),
                SizedBox(width: 40),
                Text('Изменить профиль',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                SizedBox(width: 160
                  ,),
                Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          const SizedBox(height: 5),
          const Divider(height: 2,color: Colors.black12,),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.auto_stories),
                ),
                Text('История заказов',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                SizedBox(width: 100
                  ,),
                Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          const SizedBox(height: 5),
          const Divider(height: 2,color: Colors.black12,),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(FontAwesomeIcons.store,size: 20),
                ),
                Text('Магазины',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                SizedBox(width: 150
                  ,),
                Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          const SizedBox(height: 5),
          const Divider(height: 2,color: Colors.black12,),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.settings,size: 25),
                ),
                Text('Настройки',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                SizedBox(width: 150
                  ,),
                Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          const SizedBox(height: 5),
          const Divider(height: 2,color: Colors.black12,),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(FontAwesomeIcons.briefcase,size: 20),
                ),
                Text('Сотрудничество',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                SizedBox(width: 100
                  ,),
                Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          const SizedBox(height: 5),
          const Divider(height: 2,color: Colors.black12,),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(FontAwesomeIcons.headphonesAlt,size: 20),
                ),
                Text('Контакты',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                SizedBox(width: 150
                  ,),
                Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          const SizedBox(height: 5),
          const Divider(height: 2,color: Colors.black12,),

        ],
      ),

    );
  }
}

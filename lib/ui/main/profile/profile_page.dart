import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/profile/profile_controller.dart';
import 'package:my_goodzone/routes/app_routes.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title:  SvgPicture.asset("assets/flutterassets/logo.svg",width: 140,),
        centerTitle: true,
        actions:  [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: (){
                Get.toNamed(Routes.NEWS);
              },
              child: SvgPicture.asset(
                "assets/flutterassets/ic_notifications.svg",
              ),
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
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SvgPicture.asset("assets/flutterassets/ic_profile_7.svg"),
                ),
                const SizedBox(width: 40),
               const Text('Изменить профиль',style:  TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                const SizedBox(width: 160
                  ,),
                const Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          const SizedBox(height: 5),
          const Divider(height: 2,color: Colors.black12,),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SvgPicture.asset("assets/flutterassets/ic_profile_2.svg"),
                ),
                const Text('История заказов',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                const SizedBox(width: 100
                  ,),
                const Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          const SizedBox(height: 5),
          const Divider(height: 2,color: Colors.black12,),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SvgPicture.asset("assets/flutterassets/ic_profile_3.svg"),
                ),
                const Text('Магазины',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                const SizedBox(width: 150
                  ,),
                const Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          const SizedBox(height: 5),
          const Divider(height: 2,color: Colors.black12,),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SvgPicture.asset("assets/flutterassets/ic_profile_4.svg"),
                ),
                const Text('Настройки',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                const SizedBox(width: 150
                  ,),
                const Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          const SizedBox(height: 5),
          const Divider(height: 2,color: Colors.black12,),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SvgPicture.asset("assets/flutterassets/ic_profile_5.svg"),
                ),
                const Text('Сотрудничество',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                const SizedBox(width: 100
                  ,),
                const Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          const SizedBox(height: 5),
          const Divider(height: 2,color: Colors.black12,),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SvgPicture.asset("assets/flutterassets/ic_profile_6.svg"),
                ),
                const Text('Контакты',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                const SizedBox(width: 150
                  ,),
                const Icon(Icons.navigate_next,color: Colors.black12,)
              ],),
          ),
          const SizedBox(height: 5),
          const Divider(height: 2,color: Colors.black12,),

        ],
      ),

    );
  }
}

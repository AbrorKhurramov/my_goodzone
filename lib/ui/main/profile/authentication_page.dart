import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/profile/profile_controller.dart';

class AuthenticationPage extends GetView<ProfileController> {
  const AuthenticationPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey.withOpacity(0.03),
      appBar: buildAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SvgPicture.asset("assets/flutterassets/logo.svg",width: 180,),
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: const [
                        Text("*",style: TextStyle(color: Colors.red,fontSize: 18),),
                        SizedBox(width: 3),
                        Text("Телефон ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),)
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 3,left: 10,right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black12.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child:  const TextField(
                        autofocus: false,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent, width: 0),
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red, width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(10)))
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: const Center(
                      child: Text( 'Войти',
                        style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                    height: 60,
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.5,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: const Text(
        "Аутентификация",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
  String? validateMobile(String value){
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}

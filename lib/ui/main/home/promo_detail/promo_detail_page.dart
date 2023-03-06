import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/data/models/carousel/carousel_response.dart';

class DiscountPage extends StatelessWidget {
  final Promos promos;

  const DiscountPage(this.promos) ;


  checkNull(BuildContext context){
    if(promos.title != null){
      return ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.network(
                promos.previewImage!,
                height: double.infinity,
                fit: BoxFit.fill),
            height: 200,

          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Text(promos.title!,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25
            ),),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                child: Html(
                  data: promos.previewText??'',

                ),
              )
          )
        ],
      );
    } else return Container(child: Center(child: Text('Malumot yoq'),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
          title: Center(child: Text('Акции',style: TextStyle(fontWeight: FontWeight.bold,
              color: Colors.black),),),
        ),
        body: checkNull(context)
    );
  }
}

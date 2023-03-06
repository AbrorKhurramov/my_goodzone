import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/home/home_controller.dart';
import 'package:my_goodzone/controller/main/my_orders/my_orders_controller.dart';
import 'package:my_goodzone/core/theme/app_colors.dart';
import 'package:my_goodzone/data/data_source/local_source.dart';
import 'package:my_goodzone/data/floor/entity/basket_products.dart';
import 'package:my_goodzone/ui/main/orders/widgets/cost_widget.dart';

import 'widgets/buy_button_widget.dart';
import 'widgets/order_item_widget.dart';

class MyOrdersPage extends GetView<MyOrdersController> {
  const MyOrdersPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    HomeController homeController = Get.find<HomeController>();
    return GetBuilder<MyOrdersController>(
      builder:(controller) {
        return
        StreamBuilder(
          stream: LocalSource.getInstance().getAllBasketProducts(),
          builder: (context, AsyncSnapshot<List<BasketProduct>>? snapshot) {
            int price=0;
            if(snapshot?.data!=null) {
              for (var element in snapshot!.data!) {
              int b = int.parse(element.price);
              price = price + element.quantity*b;
            }
            }

            return Scaffold(
              //backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: 0.5,
                backgroundColor: Colors.white,
                title:  SvgPicture.asset("assets/flutterassets/logo.svg",width: 140,),
                centerTitle: true,
                actions: [
                  GestureDetector(
                    onTap: (){
                      LocalSource.getInstance().removeAll(snapshot!.data as List<BasketProduct>);
                      controller.update();
                      homeController.update();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.delete,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
              body:
              (snapshot!.data?.isEmpty??true)
                        ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/flutterassets/scene_14.png"),
                      const SizedBox(height: 50),
                      const Padding(
                        padding: EdgeInsets.only(right: 28.0),
                        child: Text("У вас еще нет товара",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
              )
                        :
                    Container(
                      color: AppColors.customColor,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 620,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index) {
                                    controller.count = snapshot.data![index].quantity;
                                    return OrderItemWidget(homeController: homeController,snapshot: snapshot,index: index,controller: controller,);
                                  },
                                ),
                                CostWidget(price: price),
                              ],
                            ),
                          ),
                          BuyButtonWidget()
                        ],
                      ),
                    )



              ,
            );
          }
        );
      }
    );
  }

}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/home/home_controller.dart';
import 'package:my_goodzone/controller/main/my_orders/my_orders_controller.dart';
import 'package:my_goodzone/core/theme/app_colors.dart';
import 'package:my_goodzone/data/data_source/local_source.dart';
import 'package:my_goodzone/data/floor/entity/basket_products.dart';

class MyOrdersPage extends GetView<MyOrdersController> {
  const MyOrdersPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    HomeController homeController = Get.find();
    return GetBuilder<MyOrdersController>(
      builder:(controller) {
        return
        StreamBuilder(
          stream: LocalSource.getInstance().getAllBasketProducts(),
          builder: (context, AsyncSnapshot<List<BasketProduct>>? snapshot) {
            int price=0;
            for (var element in snapshot!.data!) {
              int b = int.parse(element.price);
              price = price + element.quantity*b;
            }

            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 1,
                title: Image.asset("assets/images/logo.png"),
                centerTitle: true,
                actions: [
                  GestureDetector(
                    onTap: (){
                      LocalSource.getInstance().removeAll(snapshot.data as List<BasketProduct>);
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
              (snapshot.data?.isEmpty??true)
                        ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SizedBox(
                            width: 400,
                            height: 400,
                            child: Image.asset("assets/images/Capture1.PNG")),
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
                                    return Container(
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: SizedBox(
                                                  height: 100,
                                                  width: 100,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(20),
                                                    child: Image.network(
                                                      snapshot.data?[index].image??"",
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.fill,
                                                    ),

                                                  ),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 20),
                                                  SizedBox(
                                                    width: 300,
                                                    height: 40,
                                                    child: Text(snapshot.data?[index].name??"",
                                                      overflow: TextOverflow.ellipsis,
                                                      style: const TextStyle(fontWeight: FontWeight.bold,
                                                          fontSize: 18),
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                  Text('${snapshot.data?[index].price} Сум',
                                                    style: const TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.bold), ),
                                                  const SizedBox(height: 20),
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: (){
                                                          LocalSource.getInstance().updateQuantity(product: snapshot.data![index],isMinus: true);
                                                          homeController.update();
                                                          controller.update();

                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color:Colors.grey.withOpacity(0.15),
                                                          ),
                                                          width: 30,
                                                          height: 30,
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(15),
                                                            child: const Icon(FontAwesomeIcons.minus,size: 15),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(padding: const EdgeInsets.all(10),
                                                          child: Text(snapshot.data![index].quantity.toString(),style: const TextStyle(fontSize: 20),)),
                                                      GestureDetector(
                                                        onTap: (){
                                                          LocalSource.getInstance().updateQuantity(product: snapshot.data![index],isMinus: false);
                                                          homeController.update();
                                                          controller.update();
                                                        },
                                                        child: Container(
                                                          width: 30,
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color:Colors.grey.withOpacity(0.15),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(15),
                                                            child: const Icon(FontAwesomeIcons.plus,size: 15),
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                ],
                                              )
                                            ],
                                          ),
                                          Container(
                                            height: 1,
                                            width: MediaQuery.of(context).size.width,
                                            color: Colors.black12,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0,bottom: 10,left: 15,right: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text("Сумма товара",style: TextStyle(fontSize: 18),),
                                          SizedBox(height: 5),
                                          Text("Сумма доставки",style: TextStyle(fontSize: 18)),
                                          SizedBox(height: 5),
                                          Text("Итоговая сумма",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text("$price сум",style: const TextStyle(fontSize: 18)),
                                          const SizedBox(height: 5),
                                          const Text("0 сум",style: TextStyle(fontSize: 18)),
                                          const SizedBox(height: 5),
                                          Text("$price сум",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: GestureDetector(
                                  child: Container(
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children:  const [
                                                Text('Оформить заказ',
                                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                                ),
                                              ],
                                            ),
                                          ),
                                          height: 60,
                                          width: 300,
                                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                                        ),
                                      ),
                              ),
                            ],
                          )
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

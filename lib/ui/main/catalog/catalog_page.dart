import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/catalog/search_controller.dart';


class CatalogPage extends GetView<SearchController>{
  const CatalogPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      builder:(controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Категории',
            style: TextStyle(color: Colors.black),
          ),

        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: const TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                      hintText: 'Поиск',
                      prefixIcon: Icon(Icons.search),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.transparent, width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 0),
                          borderRadius: BorderRadius.all(Radius.circular(10)))
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.category.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 170,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, top: 10,bottom: 10, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black12.withOpacity(0.05),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 10),
                              SizedBox(
                                child: Text(
                                  controller.category[index].name.toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                ),
                                //width: 120,
                              ),
                              SizedBox(
                                width: 130,
                                child: Image.network(
                                  controller.category[index].image!,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}



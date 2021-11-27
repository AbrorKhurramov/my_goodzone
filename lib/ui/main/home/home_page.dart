import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:my_goodzone/controller/main/home/home_controller.dart';
import 'package:my_goodzone/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:my_goodzone/ui/main/home/widgets/banner_widget.dart';
import 'package:my_goodzone/ui/main/home/widgets/product_list_widget.dart';
import 'widgets/brands_widget.dart';
import 'widgets/promo_widget.dart';
import 'widgets/title_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: GetBuilder<HomeController>(
        builder:(controller) =>
            ModalProgressHUD(
          inAsyncCall: controller.isLoading,
          child: SafeArea(
            child: LiquidPullToRefresh(
              onRefresh: () async => controller.getData(),
              child: ListView(
                children: [
                  const SizedBox(height: 5),

                  //carusel
                  const BannerWidget(),
                  const SizedBox(height: 5),

                  //aksiya title
                  TitleWidget(
                    title: "Акции",
                    onClick: () {},
                  ),
                  const SizedBox(height: 5),

                  //aksiya list
                  const PromoWidget(),

                  //populyarni_title
                  TitleWidget(title: "Лучшая подборка для вас", onClick: () {}),

                  //populyarni_list
                   const ProductListWidget(type: 1),

                  const SizedBox(height: 5),

                  //recommended_title
                  TitleWidget(title: "Популярные товары", onClick: () {}),

                  //recommended_list
                   const ProductListWidget(type: 2),

                  //new_title
                  TitleWidget(title: "Новые поступления", onClick: () {}),

                  //new_list
                   const ProductListWidget(type: 3),

                  const SizedBox(height: 10),

                  //brands
                  const BrandsWidget(),
                  const SizedBox(height: 10),

                ],
                physics: const BouncingScrollPhysics(),
              ),
            ),
          ),
        ),
      ),
    );
  }



  AppBar buildAppBar() {
    return AppBar(
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
    );
  }
}

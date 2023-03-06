import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_goodzone/controller/main/news/news_controller.dart';
import 'package:my_goodzone/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:my_goodzone/ui/news/news_detail/news_detail_page.dart';

class NewsPage extends GetView<NewsController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<NewsController>(
      builder: (controller) => ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        child: Scaffold(
          appBar: AppBar(
              elevation: 1,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Get.back(),
              ),
              title: const Center(
                  child: Text(
                "Новости",
                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ))),
          body: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.news.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(NewsDetailPage(controller.news[index]));
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: CachedNetworkImage(
                                    imageUrl: controller.news[index].previewImage.toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              SizedBox(
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.news[index].title.toString(),
                                      maxLines: 2,
                                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      DateFormat("dd MMM yyyy").format(DateTime.parse(controller.news[index].formattedDate.toString())),
                                      maxLines: 1,
                                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider()
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class CostWidget extends StatelessWidget {
  const CostWidget({
    Key? key,
    required this.price,
  }) : super(key: key);

  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

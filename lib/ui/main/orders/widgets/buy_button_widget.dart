import 'package:flutter/material.dart';

class BuyButtonWidget extends StatelessWidget {
const BuyButtonWidget({
Key? key,
}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Column(
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
  );
}
}

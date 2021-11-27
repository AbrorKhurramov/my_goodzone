import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/base/base_functions.dart';
import 'package:my_goodzone/core/theme/app_colors.dart';
import 'package:my_goodzone/core/theme/app_text_style.dart';

class BasketButton extends StatelessWidget {
  final double price;
  final int quantity;
  final Function()? onTap;

  const BasketButton({
    Key? key,
    this.price = 0.0,
    this.quantity = 0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 72,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: TextButton(
              onPressed: onTap,
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(AppColors.assets),
                elevation: MaterialStateProperty.all(0),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.assets,
                      ),
                      child: Center(
                        child: Text(
                          quantity.toString(),
                          style: AppTextStyles.basketButtonQuantity,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text('basket'.tr, style: AppTextStyles.basketButtonTitle),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${BaseFunctions.moneyFormat(price)} ${'sum'.tr}',
                      style: AppTextStyles.basketButtonTitle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(height: 1, width: double.infinity, color: AppColors.divider)
      ],
    );
  }
}

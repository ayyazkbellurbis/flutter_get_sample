import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/app/theme/app_colors.dart';
import 'package:sample/app/theme/styles.dart';

class CustomDropdown extends StatelessWidget {
  final RxString selectedItem;
  final String hint;
  final RxList<String> items;

  CustomDropdown({
    required this.items,
    required this.hint,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide.none,
            left: BorderSide.none,
            right: BorderSide.none,
            bottom: BorderSide(color: AppColors.black, width: .5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => selectedItem.value.isEmpty
                  ? Text(
                      hint,
                      style: Styles.tsBlackRegular14,
                    )
                  : Text(
                      selectedItem.value,
                      style: Styles.tsBlackRegular16,
                    ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_drop_down),
              onPressed: () {
                _showDropdown(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDropdown(BuildContext context) {
    Get.defaultDialog(
      title: 'Select an item',
      content: SizedBox(
        width: Get.width * 0.7,
        height: Get.height * 0.3,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                items[index],
                style: Styles.tsBlackRegular16,
              ),
              onTap: () {
                selectedItem.value = items[index];
                Get.back();
              },
            );
          },
        ),
      ),
    );
  }
}





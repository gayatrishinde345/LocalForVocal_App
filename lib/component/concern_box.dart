import 'package:flutter/material.dart';
import 'package:vocal4local/component/custom_buttom.dart';
import 'package:vocal4local/constant/app_color.dart';

class ConcernDialogBox extends StatelessWidget {
  final VoidCallback onConform;
  final String title;
  final String description;
  final String conformtext;

  const ConcernDialogBox({
    Key? key,
    required this.onConform,
    required this.title,
    required this.description,
    required this.conformtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size, height, width;

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),

      title: Container(
        width: width * 0.8,

        child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      content: Container(
        width: width * 0.8,

        //   height: ScreenUtils.isWeb ? 500 : ScreenUtils.height * 0.8,
        child: Text(
          description, // "Are you sure you want to delete?",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width / 6,
              height: height / 20,
              child: CustomButton(
                text: 'Cancel',
                fontSize: 12,
                textColor: AppColor.bgBlack,
                color: AppColor.grey2,
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: width / 6,
              height: height / 20,
              child: CustomButton(
                text: conformtext,
                fontSize: 12,
                onPressed: () {
                  Navigator.of(context).pop();
                  onConform();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Future showPopupDialogBox(context, widget) {
  return showDialog(
    context: context,
    // barrierDismissible: false,
    useSafeArea: true,

    // barrierColor: themeController.darkModeEnabled.value
    //     ? Colors
    //           .transparent // For dark mode
    //     : null,
    builder: (context) => widget,
  );
}

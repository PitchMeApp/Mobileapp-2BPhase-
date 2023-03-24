import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_me_app/View/posts/post_conttroller.dart';
import 'package:pitch_me_app/utils/colors/colors.dart';
import 'package:pitch_me_app/utils/strings/strings.dart';
import 'package:pitch_me_app/utils/styles/styles.dart';

class DeleteSalesPostPopUp extends StatefulWidget {
  final id;

  const DeleteSalesPostPopUp({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _DeleteSalesPostPopUpState createState() => _DeleteSalesPostPopUpState();
}

class _DeleteSalesPostPopUpState extends State<DeleteSalesPostPopUp> {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Center(
        child: Text(
          TextStrings.textKey['delete_sales']!,
          style: const TextStyle(
              color: DynamicColor.blue, fontWeight: FontWeight.bold),
        ),
      ),
      content: Text(
        TextStrings.textKey['delete_sales_sub']!,
        textAlign: TextAlign.center,
      ),
      actions: [
        postController.isLoading.value == false
            ? Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          TextStrings.textKey['no']!,
                          style: blue15,
                        )),
                    TextButton(
                        onPressed: () {
                          postController.deleteApiCall(widget.id, context);
                        },
                        child: Text(
                          TextStrings.textKey['yes']!,
                          style: red15,
                        ))
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: DynamicColor.blue,
                ),
              )
      ],
    );
  }
}

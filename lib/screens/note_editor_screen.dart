import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritime/controllers/home_controller.dart';
import 'package:maritime/utilities/constants.dart';
import 'package:maritime/utilities/extentions.dart';
import 'package:maritime/widgets/textfield.dart';

class NoteEditorScreen extends StatelessWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (HomeController h) {
      Color bgColor = AppConstants.cardsColor[h.selectedCategoryIndex];
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: context.primaryColor,
          onPressed: () {
            h.assignLists();
            h.saveNoteToAll();
            Get.back();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: context.primaryColor,
          ),
          title: Text(
            "addNote".tr,
            style: TextStyle(
              color: context.primaryColor,
            ),
          ),
          backgroundColor: bgColor,
          elevation: 0,
        ),
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: AppConstants.categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: AppConstants.smallPadding,
                      ),
                      child: InkWell(
                        onTap: () {
                          h.changeIndex(index);
                        },
                        child: Text(
                          AppConstants.categoryList[index],
                          style: TextStyle(
                            color: index == h.selectedCategoryIndex
                                ? context.errorColor
                                : context.primaryColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              CustomTextField(
                title: 'noteTitle'.tr,
                fontSize: 20,
                controller: h.titleCont,
              ),
              CustomTextField(
                title: 'enterNote'.tr,
                fontSize: 14,
                controller: h.noteCont,
              ),
            ],
          ),
        ),
      );
    });
  }
}

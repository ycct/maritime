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
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            h.assignLists();
            h.saveNoteToAll();
          },
        ),
        appBar: AppBar(
          iconTheme:  IconThemeData(color: context.primaryColor),
          title:  Text(
            "Add New Note",
            style: TextStyle(color: context.primaryColor),
          ),
          backgroundColor: AppConstants.cardsColor[h.selectedCategoryIndex],
          elevation: 0,
        ),
        backgroundColor: AppConstants.cardsColor[h.selectedCategoryIndex],
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
                title: 'Note Title',
                fontSize: 20,
                controller: h.titleCont,
              ),
              CustomTextField(
                title: 'Enter your note here',
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritime/controllers/home_controller.dart';
import 'package:maritime/screens/note_editor_screen.dart';
import 'package:maritime/utilities/constants.dart';
import 'package:maritime/utilities/extentions.dart';
import 'package:maritime/utilities/fonts.dart';
import 'package:maritime/widgets/category_cards.dart';
import 'package:maritime/widgets/grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return GetBuilder(
        init: HomeController(),
        builder: (HomeController h) {
          return Scaffold(
            floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  Get.to(() => const NoteEditorScreen());
                },
                label: const Text("Add Note"),
                backgroundColor: context.primaryColorDark),
            appBar: AppBar(
              backgroundColor: context.primaryColor,
              elevation: 0,
              title: SizedBox(
                width: 100,
                height: 40,
                child: Image.asset(AppConstants.logo),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: AppConstants.categoryListAll.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          pageController.jumpToPage(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: CategoryCards(
                            title: AppConstants.categoryListAll[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                context.sizedBoxHeightExtraSmall,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding,
                  ),
                  child: Text(
                    "Your recent Notes",
                    style: customFont20.copyWith(
                      color: context.dialogBackgroundColor,
                    ),
                  ),
                ),
                context.sizedBoxHeightExtraSmall,
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: [
                      CustomGridView(
                        list: h.noteListAll,
                      ),
                      CustomGridView(
                        list: h.noteListFinance,
                      ),
                      CustomGridView(
                        list: h.noteListPersonal,
                      ),
                      CustomGridView(
                        list: h.noteListShopping,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritime/controllers/home_controller.dart';
import 'package:maritime/models/note_model.dart';
import 'package:maritime/screens/note_detail_screen.dart';
import 'package:maritime/screens/note_editor_screen.dart';
import 'package:maritime/utilities/constants.dart';
import 'package:maritime/utilities/extentions.dart';
import 'package:maritime/utilities/fonts.dart';
import 'package:maritime/widgets/category_cards.dart';
import 'package:maritime/widgets/note_card.dart';

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
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: h.categoryListAll.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          pageController.jumpToPage(index);
                        },
                        child: CategoryCards(
                          title: h.categoryListAll[index],
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "Your recent Notes",
                  style: customFont20.copyWith(
                    color: context.dialogBackgroundColor,
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: [
                      HomeView(
                        list: h.noteListAll,
                      ),
                      HomeView(
                        list: h.noteListFinance,
                      ),
                      HomeView(
                        list: h.noteListPersonal,
                      ),
                      HomeView(
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

class HomeView extends StatelessWidget {
  final List<Note> list;

  const HomeView({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return NoteCard(
            onTap: () {
              Get.to(
                () => NoteDetailScreen(
                  note: list[index],
                ),
              );
            },
            title: list[index].title!,
            content: list[index].note!,
            category: list[index].category!,
          );
        },
      ),
    );
  }
}

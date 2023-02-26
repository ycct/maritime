import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maritime/controllers/home_controller.dart';
import 'package:maritime/screens/note_editor_screen.dart';
import 'package:maritime/utilities/constants.dart';
import 'package:maritime/utilities/extentions.dart';
import 'package:maritime/utilities/fonts.dart';
import 'package:maritime/widgets/category_cards.dart';
import 'package:maritime/widgets/grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double defualtHeight = 40;
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController h) {
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              h.clearFields();
              Get.to(
                () => const NoteEditorScreen(),
              );
            },
            label: Text(
              "addNote".tr,
              style: customFont14LightBold.copyWith(
                color: context.primaryColor,
              ),
            ),
            backgroundColor: AppConstants.cardsColor[2],
          ),
          appBar: AppBar(
            backgroundColor: context.primaryColor,
            elevation: 0,
            title: SizedBox(
              width: defualtHeight*2.5,
              height: defualtHeight,
              child: Image.asset(AppConstants.logo),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: defualtHeight,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppConstants.categoryListAll.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        pageController.jumpToPage(index);
                        h.changeIndexAll(index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: AppConstants.extraSmallPadding,
                        ),
                        child: CategoryCards(
                          isSelected: h.selectedCategoryIndexAll == index,
                          title: AppConstants.categoryListAll[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
              context.sizedBoxHeightExtraSmall,
              const TitleText(title: "recentNotes"),
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
      },
    );
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      Get.find<HomeController>().changeIndexAll(
        pageController.page!.toInt(),
      );
    });
  }
}

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
      ),
      child: Text(
        title.tr,
        style: customFont20.copyWith(
          color: context.dialogBackgroundColor,
        ),
      ),
    );
  }
}

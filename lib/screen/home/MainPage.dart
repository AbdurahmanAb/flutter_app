import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/controller/popular_controller.dart';
import 'package:e_commerce/controller/recommended_controller.dart';
import 'package:e_commerce/model/popular_model.dart';
import 'package:e_commerce/routes/route.dart';
import 'package:e_commerce/screen/detail/Recommend.dart';
import 'package:e_commerce/screen/detail/popular_items.dart';
import 'package:e_commerce/utils/Dimensions.dart';
import 'package:e_commerce/utils/appConstants.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/widgets/app_desc_column.dart';
import 'package:e_commerce/widgets/headers.dart';
import 'package:e_commerce/widgets/icon_menu.dart';
import 'package:e_commerce/widgets/subtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(viewportFraction: .85);
  var _currentPage = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularController>(
          builder: (PopularController) {
            return PopularController.isLoaded
                ? Container(
                    height: Dimensions.pageView,
                    margin: EdgeInsets.only(top: 8),
                    child: PageView.builder(
                        controller: pageController,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => BuildPages(
                            index, PopularController.popularList[index]),
                        itemCount: PopularController.popularList.length),
                  )
                : CircularProgressIndicator(
                    color: AppColors.mainColor,
                  );
          },
        ),
        GetBuilder<PopularController>(builder: (PopularController) {
          return DotsIndicator(
            dotsCount: PopularController.popularList.isEmpty
                ? 1
                : PopularController.popularList.length,
            position: _currentPage,
            decorator: DotsDecorator(
              size: const Size.square(12.0),
              activeColor: AppColors.mainColor,
              activeSize: const Size(20.0, 12.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: Dimensions.height45,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            const Header(text: "Recommended"),
            SizedBox(
              width: Dimensions.width20,
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: const Subtitle(text: "Item Paring"))
          ]),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        GetBuilder<RecommendedController>(builder: (RecommendedController) {
          return RecommendedController.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: RecommendedController.recommendedList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (contex, index) => GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.getRecommended(index));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20,
                              bottom: Dimensions.height10),
                          child: Row(
                            children: [
                              Container(
                                width: Dimensions.imageContainerHeight,
                                height: Dimensions.imageContainerHeight,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius15),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            AppConstants.BASE_URL +
                                                AppConstants.path +
                                                RecommendedController
                                                    .recommendedList[index]
                                                    .img!))),
                              ),
                              Expanded(
                                child: Container(
                                  height: Dimensions.TextcontainerHeight,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                              Dimensions.radius20),
                                          bottomRight: Radius.circular(
                                              Dimensions.radius20)),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimensions.height10,
                                        right: Dimensions.height10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Header(
                                            text: RecommendedController
                                                .recommendedList[index].name!),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        Subtitle(text: "Can Be Found Here"),
                                        SizedBox(
                                          height: Dimensions.height10,
                                        ),
                                        Row(
                                          children: [
                                            IconMenu(
                                                text: "Normal",
                                                icon: Icons.car_rental,
                                                iconColor: Colors.amberAccent),
                                            SizedBox(
                                              width: Dimensions.width10,
                                            ),
                                            IconMenu(
                                                text: "1.7KM",
                                                icon:
                                                    Icons.location_on_outlined,
                                                iconColor: AppColors.mainColor),
                                            SizedBox(
                                              width: Dimensions.width10,
                                            ),
                                            IconMenu(
                                                text: "32 Min",
                                                icon: Icons.timer_outlined,
                                                iconColor: Colors.red)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        })
      ],
    );
  }

  Widget BuildPages(index, Products popularList) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPage.floor()) {
      var currentScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
      var trans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, trans, 0);
    } else if (index == _currentPage.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPage - index + 1) * (1 - _scaleFactor);
      var trans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, trans, 0);
    } else if (index == _currentPage.floor() - 1) {
      var currentScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
      var trans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, trans, 0);
    } else {
      var currentScale = 0.8;
      var trans = _height * (1 - _scaleFactor) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, trans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.getPopular(index));
          },
          child: Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10,
                right: Dimensions.width10,
                top: Dimensions.width10),
            decoration: BoxDecoration(
                color: index.isEven ? Colors.deepOrangeAccent : Colors.blue,
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.path +
                        popularList.img!))),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: Dimensions.textViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.width30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5))
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20, left: 15, right: 15),
                  child: AppDescCol(
                    text: popularList.name!,
                  ))),
        )
      ]),
    );
  }
}

import '../../../common/util/exports.dart';
import '../../my_drawer/view/my_drawer.dart';
import '../../tab_body/home_tab_body/views/home_tab_body_view.dart';
import '../controllers/dashboard_page_controller.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DashboardPageView extends GetView<DashboardPageController> {
  const DashboardPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Style.other.colorfulBg,
        child: ZoomDrawer(
          controller: controller.drawerController.zoomDrawerController,
          borderRadius: 24.0,
          showShadow: false,
          moveMenuScreen: false,
          drawerShadowsBackgroundColor: Colors.amber,
          angle: 0.0,
          slideWidth: Get.width * .9,
          mainScreenTapClose: true,
          menuScreen: const MyDrawer(),
          mainScreen: _mainScreen,
        ),
      ),
    );
  }

  Widget get _mainScreen => Stack(
    children: [
      // bottom nav
      _bottomNav,

      // body
      const HomeTabBodyView(),
    ],
  );

  Widget get _bottomNav => Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: Dimens.ui.bottomNavHeight,
      decoration: const BoxDecoration(
        color: AppColors.colorPrimary,
      ),
      child: Column(
        children: [
          SizedBox(height: Dimens.ui.bottomNavHeight / 1.7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _bottomItem(0),
              // _bottomItem(1),
              // _bottomItem(2),
            ],
          ),
        ],
      ),
    ),
  );

  Widget _bottomItem(index) {
    return Column(
      children: [
        const Icon(
          Icons.home_outlined,
          color: AppColors.white,
        ),
        Container(
          width: 6,
          height: 6,
          margin: const EdgeInsets.only(top: 5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

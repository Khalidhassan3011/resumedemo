
import '../../util/exports.dart';

class Style {
 static _TextStyle get textStyle => _TextStyle();

 static _ButtonStyle get buttonStyle => _ButtonStyle();

 static _Other get other => _Other();
}

class _TextStyle {

  final TextStyle semiBoldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w600,
  );

  final TextStyle boldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize22,
    fontWeight: FontWeight.w700,
  );

  final TextStyle regularStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize18,
    fontWeight: FontWeight.w400,
  );

  final TextStyle buttonTextStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle _textStyle = TextStyle(
    color: Colors.black,
    fontSize: Dimens.fontSize14,
  );
}

class _ButtonStyle {

  final ButtonStyle darkBg = Theme.of(Get.context!).elevatedButtonTheme.style!.copyWith(
    backgroundColor: MaterialStateProperty.all(AppColors.colorPrimary),
    foregroundColor: MaterialStateProperty.all(AppColors.white),
  );

  final ButtonStyle lightBg = Theme.of(Get.context!).elevatedButtonTheme.style!.copyWith(
    backgroundColor: MaterialStateProperty.all(AppColors.white),
    foregroundColor: MaterialStateProperty.all(AppColors.colorPrimary),
  );

}

class _Other {
  final BoxDecoration tabBodyBg = const BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(30),
    ),
    boxShadow: <BoxShadow>[
      BoxShadow(
          color: Colors.black54,
          blurRadius: 15.0,
          offset: Offset(0.0, 0.75)
      )
    ],
  );

  final BoxDecoration colorfulBg = BoxDecoration(
    image: DecorationImage(
      image: AssetImage(AppAssets.image.bg),
      fit: BoxFit.fill,
    ),
  );

  final InputDecoration inputDecoration = const InputDecoration(
    labelStyle: TextStyle(color: Color(0xFF6200EE)),
    filled: true,
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
  );

  final InputDecoration chatInputDecoration = const InputDecoration(
    labelStyle: TextStyle(color: Color(0xFF6200EE)),
    filled: true,
    border: _outlineInputBorder,
    focusedBorder: _outlineInputBorder,
    enabledBorder: _outlineInputBorder,
    errorBorder: _outlineInputBorder,
    disabledBorder: _outlineInputBorder,
  );

  // helper
  static const OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.colorPrimary, width: 0.0),
  );
}

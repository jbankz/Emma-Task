import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wat_mobile/app/core/router/page_router.dart';

import '../common/app_colors.dart';
import '../common/app_image.dart';
import 'textview_widget.dart';

class BodyWidget extends StatelessWidget {
  final Widget? child;
  final Widget? floatingActionButton;
  final String? appBarTitle;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final bool showAppBar;
  final Widget? bottomNavigationBar;
  final EdgeInsets? padding;
  final List<Widget>? tabs;
  final Widget? body;
  final bool showLeadingWidget;
  final List<Widget>? actions;
  final bool loading;
  final String? leadingIcon;
  final Color? backgroundColor;
  final Color? appbarBackgroundColor;
  final double? elevation;
  final double? toolbarHeight;
  final double? leadingWidth;
  final GlobalKey<FormState>? formKey;
  final Function()? backPressed;

  const BodyWidget(
      {super.key,
      this.child,
      this.backPressed,
      this.floatingActionButton,
      this.appBarTitle,
      this.centerTitle = true,
      this.automaticallyImplyLeading = true,
      this.showAppBar = false,
      this.bottomNavigationBar,
      this.appbarBackgroundColor = AppColors.white,
      this.padding,
      this.tabs,
      this.body,
      this.formKey,
      this.showLeadingWidget = false,
      this.actions,
      this.loading = false,
      this.leadingIcon,
      this.backgroundColor = AppColors.accentBackground,
      this.elevation = 1,
      this.toolbarHeight,
      this.leadingWidth = 40});

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Scaffold(
            backgroundColor: backgroundColor,
            appBar: (showAppBar)
                ? AppBar(
                    centerTitle: centerTitle,
                    automaticallyImplyLeading: automaticallyImplyLeading,
                    actions: actions,
                    elevation: elevation,
                    backgroundColor: appbarBackgroundColor,
                    toolbarHeight: toolbarHeight,
                    leading: showLeadingWidget
                        ? CupertinoButton(
                            onPressed: backPressed ?? () => PageRouter.pop(),
                            child: SvgPicture.asset(AppImage.arrowCircleLeft))
                        : null,
                    title: TextView(
                      text: appBarTitle ?? '',
                      fontSize: 22,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w500,
                      color: AppColors.headline,
                    ),
                    bottom: tabs != null ? TabBar(tabs: tabs!) : null,
                  )
                : null,
            body: body ??
                SafeArea(
                  minimum: padding ?? EdgeInsets.zero,
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Form(key: formKey, child: child ?? Container()),
                  ),
                ),
            bottomNavigationBar: bottomNavigationBar,
            floatingActionButton: floatingActionButton,
          ),
          Visibility(
              visible: loading,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white.withOpacity(.2),
                child: const CupertinoActivityIndicator(),
              ))
        ],
      );
}

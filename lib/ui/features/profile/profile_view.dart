import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wat_mobile/app/core/manager/session_manager.dart';
import 'package:wat_mobile/app/stack/app.locator.dart';
import 'package:wat_mobile/ui/common/app_colors.dart';
import 'package:wat_mobile/ui/widget/body_widget.dart';
import 'package:wat_mobile/ui/widget/button_widget.dart';
import 'package:wat_mobile/ui/widget/edit_field_widget.dart';
import 'package:wat_mobile/ui/widget/gap.dart';
import 'package:wat_mobile/ui/widget/textview_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../authentication/data/dao/user_dao.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) => BodyWidget(
        appBarTitle: 'Profile',
        showAppBar: true,
        child: ValueListenableBuilder<Box>(
          valueListenable: userDao.getListenable(),
          builder: (_, box, __) {
            final user = userDao.returnUser(box);
            return SingleChildScrollView(
              child: Card(
                elevation: 10,
                shadowColor: const Color.fromRGBO(101, 108, 125, 0.05),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    children: [
                      buildProfileImage(user.profileImage),
                      const Gap(height: 10),
                      const TextView(
                        text: 'Change Picture',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                        color: AppColors.hintColor,
                      ),
                      const Gap(height: 24),
                      buildEditFormField(
                        hint: 'First Name',
                        keyboardType: TextInputType.name,
                        initialValue: user.firstName,
                      ),
                      const Gap(height: 20),
                      buildEditFormField(
                        hint: 'Last Name',
                        keyboardType: TextInputType.name,
                        initialValue: user.lastName,
                      ),
                      const Gap(height: 20),
                      buildEditFormField(
                        hint: 'Email Address',
                        keyboardType: TextInputType.emailAddress,
                        initialValue: user.email,
                      ),
                      const Gap(height: 20),
                      buildEditFormField(
                        hint: 'Phone Number',
                        keyboardType: TextInputType.phone,
                        initialValue: user.phoneNumber,
                      ),
                      const Gap(height: 24),
                      buildLogoutButton(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );

  Widget buildProfileImage(String? profileImage) => ClipRRect(
        borderRadius: BorderRadius.circular(100.r),
        child: CachedNetworkImage(
          imageUrl: profileImage ?? '',
          height: 100.h,
          width: 100.w,
          fit: BoxFit.cover,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      );

  Widget buildEditFormField({
    required String hint,
    required TextInputType keyboardType,
    required String? initialValue,
  }) =>
      EditFormField(
        hint: hint,
        keyboardType: keyboardType,
        initialValue: initialValue,
      );

  Widget buildLogoutButton() => ButtonWidget(
        text: 'Log Out',
        onPressed: () async => await locator<SessionManager>().logOut(),
      );
}

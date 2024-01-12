import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:wat_mobile/app/core/router/page_router.dart';
import 'package:wat_mobile/app/stack/app.router.dart';
import 'package:wat_mobile/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:wat_mobile/utils/extensions.dart';

import '../../../../../../utils/field_validator.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../widget/alternative_tile_widget.dart';
import '../../../../../widget/body_widget.dart';
import '../../../../../widget/button_widget.dart';
import '../../../../../widget/edit_field_widget.dart';
import '../../../../../widget/gap.dart';
import '../../../../../widget/textview_widget.dart';
import '../../notifier/auth_notifier.dart';
import 'signin_view.form.dart';

@FormView(
    fields: [FormTextField(name: 'email'), FormTextField(name: 'password')])
class SigninView extends ConsumerStatefulWidget {
  const SigninView({super.key});

  @override
  ConsumerState<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends ConsumerState<SigninView> with $SigninView {
  late AuthNotifier _authNotifier;
  bool _obscureText = true;

  final _formkey = GlobalKey<FormState>();
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    emailFocusNode.requestFocus();
    _authNotifier = ref.read(authNotifierProvider.notifier);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    disposeForm();
    _cancelToken.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    return BodyWidget(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        loading: authState.isBusy,
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(height: 40),
                      const TextView(
                          text: 'Hi, Welcome Back,',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkBlue100),
                      const Gap(height: 11),
                      const TextView(
                          text: 'Sign In',
                          textAlign: TextAlign.left,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkBlue),
                      const Gap(height: 30),
                      EditFormField(
                          hint: 'Email Address',
                          label: 'Enter email address',
                          controller: emailController,
                          focusNode: emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          validator: FieldValidator.validateEmail(),
                          onFieldSubmitted: (_) =>
                              context.nextFocus(passwordFocusNode)),
                      const Gap(height: 20),
                      EditFormField(
                          hint: 'Password',
                          label: 'Enter password',
                          controller: passwordController,
                          focusNode: passwordFocusNode,
                          obscureText: _obscureText,
                          keyboardType: TextInputType.text,
                          validator: FieldValidator.validateSpecialPassword(),
                          suffixWidget: IconButton(
                              onPressed: () =>
                                  setState(() => _obscureText = !_obscureText),
                              icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey)),
                          onFieldSubmitted: (_) => _submit()),
                    ],
                  ),
                ),
              ),
              const Gap(height: 8),
              ButtonWidget(text: 'Sign in', onPressed: _submit),
              const Gap(height: 16),
              AlternativeTilesWidget(
                  leftText: 'Dont have an account? ',
                  rightText: 'Sign up',
                  rightTapped: () => PageRouter.pushNamed(Routes.signupView)),
            ],
          ),
        ));
  }

  void _submit() {
    if (!_formkey.currentState!.validate()) return;

    _authNotifier.signIn(
        AuthDto(email: emailController.text, password: passwordController.text),
        _cancelToken);
  }
}

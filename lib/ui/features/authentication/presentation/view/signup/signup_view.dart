import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:wat_mobile/app/core/router/page_router.dart';
import 'package:wat_mobile/ui/features/authentication/domain/dto/auth_dto.dart';
import 'package:wat_mobile/utils/extensions.dart';

import '../../../../../../app/stack/app.router.dart';
import '../../../../../../utils/field_validator.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../widget/alternative_tile_widget.dart';
import '../../../../../widget/body_widget.dart';
import '../../../../../widget/button_widget.dart';
import '../../../../../widget/edit_field_widget.dart';
import '../../../../../widget/gap.dart';
import '../../../../../widget/textview_widget.dart';
import '../../notifier/auth_notifier.dart';
import 'signup_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'phoneNumber'),
  FormTextField(name: 'gender'),
  FormTextField(name: 'password')
])
class SignupView extends ConsumerStatefulWidget {
  const SignupView({super.key});

  @override
  ConsumerState<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> with $SignupView {
  late AuthNotifier _authNotifier;

  final _formkey = GlobalKey<FormState>();
  final CancelToken _cancelToken = CancelToken();
  bool _obscureText = true;

  @override
  void initState() {
    firstNameFocusNode.requestFocus();
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
                          text: 'Hi, Welcome to EmmyStore.',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkBlue100),
                      const Gap(height: 11),
                      const TextView(
                          text: 'Create your Account',
                          textAlign: TextAlign.left,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.darkBlue),
                      const Gap(height: 30),
                      EditFormField(
                        hint: 'First Name',
                        label: 'Enter first name',
                        controller: firstNameController,
                        focusNode: firstNameFocusNode,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        validator: FieldValidator.validateString(min: 2),
                        onFieldSubmitted: (_) =>
                            context.nextFocus(lastNameFocusNode),
                        inputFormatters: [context.charactersOnly],
                      ),
                      const Gap(height: 20),
                      EditFormField(
                        hint: 'Last Name',
                        label: 'Enter last name',
                        controller: lastNameController,
                        focusNode: lastNameFocusNode,
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.text,
                        validator: FieldValidator.validateString(min: 2),
                        onFieldSubmitted: (_) =>
                            context.nextFocus(emailFocusNode),
                        inputFormatters: [context.charactersOnly],
                      ),
                      const Gap(height: 20),
                      EditFormField(
                          hint: 'Email Address',
                          label: 'Enter email address',
                          controller: emailController,
                          focusNode: emailFocusNode,
                          keyboardType: TextInputType.emailAddress,
                          validator: FieldValidator.validateEmail(),
                          onFieldSubmitted: (_) =>
                              context.nextFocus(phoneNumberFocusNode)),
                      const Gap(height: 20),
                      EditFormField(
                        hint: 'Phone Number',
                        label: 'Enter phone number',
                        controller: phoneNumberController,
                        focusNode: phoneNumberFocusNode,
                        keyboardType: TextInputType.phone,
                        validator: FieldValidator.validatePhone(),
                        inputFormatters: [context.digitsOnly, context.limit()],
                      ),
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
              ButtonWidget(text: 'Sign up', onPressed: _submit),
              const Gap(height: 16),
              AlternativeTilesWidget(
                  leftText: 'Already have an account? ',
                  rightText: 'Sign In',
                  rightTapped: () => PageRouter.pushNamed(Routes.signinView)),
            ],
          ),
        ));
  }

  void _submit() {
    if (!_formkey.currentState!.validate()) return;

    _authNotifier.signup(
        AuthDto(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            phoneNumber: phoneNumberController.text,
            password: passwordController.text,
            profileImage: Faker().image.image()),
        _cancelToken);
  }
}

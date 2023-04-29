import 'package:education_app_like_udemy/core/components/alert-dialog/error_alert_dialog.dart';
import 'package:education_app_like_udemy/core/components/alert-dialog/succes_alert_dialog.dart';
import 'package:education_app_like_udemy/core/components/button-style/elevated_button_style.dart';
import 'package:education_app_like_udemy/core/components/icon/icon_logo.dart';
import 'package:education_app_like_udemy/core/components/padding/padding_for_scroll.dart';
import 'package:education_app_like_udemy/core/components/text/title_spacing_with_padding.dart';
import 'package:education_app_like_udemy/core/constants/string/string_constants.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/product/widget/text-button/text_button_medium_navigate_back.dart';
import 'package:education_app_like_udemy/view/_product/enum/register/register_enum.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/_product/widget/animation/lottie_loading_button.dart';
import 'package:education_app_like_udemy/view/_product/widget/textfield/register/custom_text_field_email_register.dart';
import 'package:education_app_like_udemy/view/_product/widget/textfield/register/custom_text_field_password_register.dart';
import 'package:education_app_like_udemy/view/auth/register/view-model/register/register_cubit.dart';
import 'package:education_app_like_udemy/view/auth/register/view-model/register/register_state.dart';
import 'package:education_app_like_udemy/view/auth/register/view-model/validation/validation_register_cubit.dart';
import 'package:education_app_like_udemy/view/auth/register/view-model/wait/waited_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _name;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordAgainController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _name = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordAgainController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordAgainController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<ValidateRegisterCubit, AutovalidateMode>(
        builder: (context, validateMode) {
          return SingleChildScrollView(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: context.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _registerForm(validateMode, context),
                    const PaddingForScroll(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Form _registerForm(AutovalidateMode validateMode, BuildContext context) {
    return Form(
      autovalidateMode: validateMode,
      key: _formKey,
      child: Column(
        children: [
          context.smallSpace,
          IconLogo(height: context.logoValue),
          context.bigSpace,
          CustomTextFieldEmailRegister(emailController: _emailController),
          context.normalSpace,
          CustomTextFieldPasswordRegister(passwordController: _passwordController),
          context.normalSpace,
          CustomTextFieldPasswordRegister(
              passwordController: _passwordAgainController, passwordAgainController: _passwordController),
          context.normalSpace,
          _registerButton(context),
          BlocBuilder<WaitedRegisterCubit, bool>(
            builder: (context, state) {
              return TextButtonMediumNavigateBack(
                path: RouteEnum.login.rawValue,
                text: StringConstants.login,
                wait: state,
              );
            },
          ),
        ],
      ),
    );
  }

  SizedBox _registerButton(BuildContext context) {
    return SizedBox(
      width: context.textFieldWidht / 2,
      child: ElevatedButton(
        style: const ElevatedButtonStyle(circularSize: 20).style,
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          if (_formKey.currentState!.validate()) {
            context.read<WaitedRegisterCubit>().readOnlyTrue();
            context.read<RegisterCubit>().register(email: _emailController.text, password: _passwordController.text);
          } else {
            context.read<ValidateRegisterCubit>().validateMode();
          }
        },
        child: BlocConsumer<RegisterCubit, IRegisterState>(
          listener: _registerListener,
          builder: (context, state) {
            switch (state.status) {
              case RegisterEnum.initial:
                return const TitleSpacingWithPadding(text: StringConstants.register);
              case RegisterEnum.loading:
                return const LottieBigLoadingButton();
              case RegisterEnum.completed:
                return const TitleSpacingWithPadding(text: StringConstants.register);
              case RegisterEnum.error:
                return const TitleSpacingWithPadding(text: StringConstants.register);
            }
          },
        ),
      ),
    );
  }

  void _registerListener(context, state) {
    if (state.status == RegisterEnum.completed) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SuccessAlertDialog(
            callback: goLoginPage,
            successTitle: StringConstants.registerAlertTitle,
            successMessage: StringConstants.registerAlertMessage,
          );
        },
      );
    } else if (state.status == RegisterEnum.error) {
      if (state is ErrorRegisterState) {
        final String message = state.errorMessage?.message ?? StringConstants.wentWrong;
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return ErrorAlertDialog(
              errorMessage: message,
              errorTitle: StringConstants.loginError,
              callback: changeReadOnlyForButton,
            );
          },
        );
      }
    }
  }

  void changeReadOnlyForButton() {
    context.read<WaitedRegisterCubit>().readOnlyFalse();
    GoRouter.of(context).pop();
  }

  void goLoginPage() {
    NavigationRoute.goRouteClear(RouteEnum.login.rawValue);
  }
}

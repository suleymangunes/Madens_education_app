import 'package:education_app_like_udemy/core/extension/padding/padding_extension.dart';
import 'package:education_app_like_udemy/core/extension/text/text_extension.dart';
import 'package:education_app_like_udemy/product/widget/text-button/text_button_medium_navigate_normal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:education_app_like_udemy/core/components/alert-dialog/error_alert_dialog.dart';
import 'package:education_app_like_udemy/core/components/button-style/elevated_button_style.dart';
import 'package:education_app_like_udemy/core/components/icon/icon_logo.dart';
import 'package:education_app_like_udemy/core/components/padding/padding_for_scroll.dart';
import 'package:education_app_like_udemy/core/constants/string/string_constants.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/view/_product/enum/login/login_enum.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/_product/widget/textfield/custom_text_field_email.dart';
import 'package:education_app_like_udemy/view/_product/widget/textfield/custom_text_field_password.dart';
import 'package:education_app_like_udemy/view/auth/login/view-model/login/login_cubit.dart';
import 'package:education_app_like_udemy/view/auth/login/view-model/login/login_state.dart';
import 'package:education_app_like_udemy/view/auth/login/view-model/validation/validation_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<ValidateCubit, AutovalidateMode>(
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
                    _loginForm(validateMode, context),
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

  Form _loginForm(AutovalidateMode validateMode, BuildContext context) {
    return Form(
      autovalidateMode: validateMode,
      key: _formKey,
      child: Column(
        children: [
          context.normalSpace,
          IconLogo(height: context.logoValue),
          context.bigSpace,
          CustomTextFieldEmail(emailController: _emailController),
          context.normalSpace,
          CustomTextFieldPassword(passwordController: _passwordController),
          context.mediumSpace,
          _loginButton(context),
          TextButtonMediumNavigateGoNormal(
            path: RouteEnum.register.rawValue,
            text: StringConstants.createAccount,
          ),
        ],
      ),
    );
  }

  SizedBox _loginButton(BuildContext context) {
    return SizedBox(
      width: context.textFieldWidht / 2.3,
      child: ElevatedButton(
        style: const ElevatedButtonStyle(circularSize: 20).style,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            context.read<LoginCubit>().login(email: _emailController.text, password: _passwordController.text);
          } else {
            context.read<ValidateCubit>().validateMode();
          }
        },
        child: BlocConsumer<LoginCubit, ILoginState>(
          listener: _loginListener,
          builder: (context, state) {
            switch (state.status) {
              case LoginEnum.initial:
                return TitleSpacingWithPadding(
                  padding: context.buttonTitlePadding,
                  color: Colors.white,
                  text: StringConstants.login,
                  spacing: context.buttonTitleSpacing,
                );
              case LoginEnum.loading:
                return const CircularProgressIndicator(color: Colors.white);
              case LoginEnum.completed:
                return const Text("Success");
              case LoginEnum.error:
                return const Text("Login");
            }
          },
        ),
      ),
    );
  }

  void _loginListener(context, state) {
    if (state.status == LoginEnum.completed) {
      NavigationRoute.goRouteNormal(RouteEnum.homePage.rawValue);
    } else if (state.status == LoginEnum.error) {
      if (state is ErrorLoginState) {
        final String message = state.errorMessage?.message ?? StringConstants.wentWrong;

        showDialog(
          context: context,
          builder: (context) {
            return ErrorAlertDialogGoBack(errorMessage: message, errorTitle: StringConstants.loginError);
          },
        );
      }
    }
  }
}

class TextTitleLarge extends StatelessWidget {
  const TextTitleLarge({super.key, required this.color, required this.text, this.spacing});
  final Color color;
  final String text;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: color,
          ),
    );
  }
}

class TestTitleLargeWithSpacing extends StatelessWidget {
  const TestTitleLargeWithSpacing({super.key, required this.color, required this.text, required this.spacing});

  final Color color;
  final String text;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return TextTitleLarge(
      color: color,
      text: text,
      spacing: spacing,
    );
  }
}

class TitleSpacingWithPadding extends StatelessWidget {
  const TitleSpacingWithPadding(
      {super.key, required this.padding, required this.color, required this.text, required this.spacing});

  final double padding;
  final Color color;
  final String text;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: TestTitleLargeWithSpacing(
        color: color,
        text: text,
        spacing: spacing,
      ),
    );
  }
}

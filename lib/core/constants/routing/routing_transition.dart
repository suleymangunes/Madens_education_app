import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuildPageWithTransition {
  const BuildPageWithTransition._();

  static CustomTransitionPage buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      transitionDuration: const Duration(milliseconds: 10),
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}

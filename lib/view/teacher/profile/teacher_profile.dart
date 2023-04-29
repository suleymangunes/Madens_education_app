import 'package:education_app_like_udemy/core/components/icon/icon_logo.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/core/init/cache/login/login_caching.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/auth/login/view-model/wait/waited_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          context.largeSpace,
          IconLogo(height: context.logoValue),
          Text(
            "Madens",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          context.smallSpace,
          Text(
            "Online eğitimde bir uygulamadan fazlası.",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          context.largeSpace,
          Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.key_off_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                title: const Text("Şifre değiştir"),
              ),
            ),
          ),
          Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.delete_forever_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                title: const Text("Hesap Sil"),
              ),
            ),
          ),
          Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: InkWell(
              onTap: () {
                LoginCaching.signout();
                LoginCaching.deleteToken();
                NavigationRoute.goRouteClear(RouteEnum.userRole.rawValue);
                context.read<WaitedLoginCubit>().readOnlyFalse();
              },
              child: ListTile(
                leading: Icon(
                  Icons.exit_to_app_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                title: const Text("Çıkış Yap"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

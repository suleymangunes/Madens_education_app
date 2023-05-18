import 'dart:convert';
import 'dart:io';

import 'package:education_app_like_udemy/core/components/icon/icon_logo.dart';
import 'package:education_app_like_udemy/core/extension/context/context_extension.dart';
import 'package:education_app_like_udemy/core/init/cache/login/login_caching.dart';
import 'package:education_app_like_udemy/core/init/navigation/navigation_route.dart';
import 'package:education_app_like_udemy/view/_product/enum/route/route_enum.dart';
import 'package:education_app_like_udemy/view/auth/login/view-model/wait/waited_button.dart';
import 'package:education_app_like_udemy/view/settings/view/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
            "More than an application in online education",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          context.largeSpace,
          const SettingView(),
          InkWell(
            onTap: () {},
            child: const ListTile(
              leading: Icon(
                Icons.key_off_outlined,
              ),
              title: Text("Change Password"),
            ),
          ),
          InkWell(
            onTap: () {
              hesapSil();
            },
            child: const ListTile(
              leading: Icon(
                Icons.delete_forever_outlined,
              ),
              title: Text("Delete Account"),
            ),
          ),
          InkWell(
            onTap: () {
              LoginCaching.signout();
              LoginCaching.deleteToken();
              NavigationRoute.goRouteClear(RouteEnum.userRole.rawValue);
              context.read<WaitedLoginCubit>().readOnlyFalse();
            },
            child: const ListTile(
              leading: Icon(
                Icons.exit_to_app_outlined,
              ),
              title: Text("Sing Out"),
            ),
          ),
        ],
      ),
    );
  }

  // TODO bu kismi duzenle calisiyor ancak duzenlenmeli
  Future<void> hesapSil() async {
    print("calisti");
    var a = {
      "password": "Sifre.55",
    };
    var b = jsonEncode(a);
    const String link = "https://10.0.2.2:7278/api/AuthStudent?password=Suleyman.55";
    var c = await http.delete(
      Uri.parse(link),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader:
            'Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjgiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoib2dyZW5jaUBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJTdHVkZW50IiwiZXhwIjoxNjgyOTcwMTkzfQ.tmfY9BGzFVcHMpvS9-ax9W3o5MC8GQN-cIQddtzQ3AV8QJ-_znv5LhNN0HXfbufJalUkr20UdQmkM03z2skMaw',
        // 'Authorization':
        //     'Bearer 1111yJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjMiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoic3R1ZGVudEBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJTdHVkZW50IiwiZXhwIjoxNjgyOTY3NTg4fQ.s0Nj6cxZcQiduPDKCOWO4tkbSWpyp_gQHcf56epd7ZSZWNkU3ciPNXmeN8JkV1-r7qsf9IIc3AhaVM_3ZF83qQ',
      },

      // body: b
    );
    print(c.body);
  }
}

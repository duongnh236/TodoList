import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/routes.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({Key? key}) : super(key: key);

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.go(Routes.homeDetail1Page);
        },
        child: const Center(child: Text("Home Detail Page"),));
  }
}

class HomeDetail1Page extends StatefulWidget {
  const HomeDetail1Page({Key? key}) : super(key: key);

  @override
  State<HomeDetail1Page> createState() => _HomeDetail1PageState();
}

class _HomeDetail1PageState extends State<HomeDetail1Page> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {

        },
        child: const Center(child: Text("Home Detail 1 Page"),));
  }
}

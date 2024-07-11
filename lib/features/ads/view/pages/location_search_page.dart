import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class LocationSearchPage extends StatelessWidget {
  static const routePath = '/loginpage';

  const LocationSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: context.spaces.space_900,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: context.spaces.space_300),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
    );
  }
}

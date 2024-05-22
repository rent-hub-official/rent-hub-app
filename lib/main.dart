import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/theme/theme_provider.dart';
import 'package:rent_hub/features/ads/view/widgets/ordersummery/ordersummery_bottomsheet_widget.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ref.watch(themeProvider),
      home: const Sapmble(),
    );
  }
}

class Sapmble extends StatelessWidget {
  const Sapmble({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        OrdersummeryBottomSheetWidget(
          agreetext: "",
          dropdatetext: "",
          btnTxt: "",
          location: "",
          onTap: () {},
          pickordropdate: "",
          pickupdatetext: "",
          price: "",
          selectpicklocation: "",
          privacyPolicytext: "",
          value: true,
        )
      ],
    ));
  }
}

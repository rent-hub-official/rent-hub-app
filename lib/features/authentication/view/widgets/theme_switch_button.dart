import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/theme/theme_provider.dart';

class ThemeSwitchButton extends ConsumerWidget {
  const ThemeSwitchButton({
    super.key,
    required this.themeSwitch,
  });

  final ValueNotifier<bool> themeSwitch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Switch(
      value: themeSwitch.value,
      activeColor: AppColorPalettes.white500,
      activeTrackColor: context.colors.primary,
      inactiveTrackColor: context.colors.primary,
      inactiveThumbColor: AppColorPalettes.black500,
      trackOutlineColor: WidgetStateProperty.all(AppColorPalettes.grey600),
      thumbIcon: WidgetStateProperty.all(
        !themeSwitch.value
            ? Icon(Icons.dark_mode)
            : Icon(
                Icons.light_mode,
                color: AppColorPalettes.black500,
              ),
      ),
      onChanged: (value) {
        themeSwitch.value = !themeSwitch.value;
        ref.read(themeProvider.notifier).switchTheme();
      },
    );
  }
}

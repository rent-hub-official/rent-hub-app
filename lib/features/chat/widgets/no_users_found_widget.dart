import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_hub/core/constants/image_constants.dart';

class NoUsersFoundWidget extends ConsumerWidget {
  const NoUsersFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SvgPicture.asset(ref.watch(imageConstantsProvider).imgNoFavorites);
  }
}

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/l_circular_image.dart';

class LUserProfileTile extends StatelessWidget {
  const LUserProfileTile({
    super.key, this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const LCircularImage(
        image: LImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text('Labib Islam', style: Theme.of(context).textTheme.headlineSmall!.apply(color: LColors.white),),
      subtitle: Text('labibislam87@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: LColors.white),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: LColors.white,),),
    );
  }
}

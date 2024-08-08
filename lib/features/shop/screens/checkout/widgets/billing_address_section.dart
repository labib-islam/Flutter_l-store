import 'package:flutter/material.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';

import '../../../../../common/widgets/texts/section_heading.dart';

class LBillingAddressSection extends StatelessWidget {
  const LBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LSectionHeading(
            title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {}),
        Text('Labib Islam', style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: LSizes.spaceBtwItems /2),

        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: LSizes.spaceBtwItems),
            Expanded(child: Text('(+880) 123 456 6789', style: Theme.of(context).textTheme.bodyMedium, softWrap: true,))
          ],
        ),
        const SizedBox(height: LSizes.spaceBtwItems /2),

        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: LSizes.spaceBtwItems),
            Expanded(child: Text('South Liana, Maine 84516, USA', style: Theme.of(context).textTheme.bodyMedium, softWrap: true,))
          ],
        ),
      ],
    );
  }
}















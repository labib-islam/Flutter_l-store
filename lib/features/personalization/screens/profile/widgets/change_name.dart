import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:flutter_l_store/utils/constants/text_strings.dart';
import 'package:flutter_l_store/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controllers/update_name_controller.dart';


class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// Custom AppBar
      appBar: LAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(LSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text('Use real name for easy verification. This name will appear on several pages.',
            style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: LSizes.spaceBtwSections),
            
            /// Text field and Button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => LValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: LTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: LSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => LValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: LTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),
                ],
            ),),
            const SizedBox(height: LSizes.spaceBtwSections),

            /// Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Save'),),
            )
          ],
        ),
      ),
    );
  }
}

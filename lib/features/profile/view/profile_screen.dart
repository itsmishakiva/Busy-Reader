import 'package:busy_reader/features/profile/view/widgets/app_text_field.dart';
import 'package:busy_reader/themes/theme_build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              AppLocalizations.of(context)!.account,
              style: context.textStyles.headline2,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.accountInfo,
                    style: context.textStyles.infoText,
                  ),
                ),
                const SizedBox(width: 64),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            AppTextField(
              label: AppLocalizations.of(context)!.name,
            ),
            const SizedBox(
              height: 12,
            ),
            AppTextField(
              label: AppLocalizations.of(context)!.surname,
            ),
            const SizedBox(
              height: 12,
            ),
            AppTextField(
              label: AppLocalizations.of(context)!.email,
            ),
            const SizedBox(
              height: 12,
            ),
            AppTextField(
              label: AppLocalizations.of(context)!.phone,
            ),
          ],
        ),
      ),
    );
  }
}

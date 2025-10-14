import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.tune, size: 18),
              label: Text(S.of(context).Filter, style: AppStyles.regular13),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.swap_vert, size: 18),
              label: Text(S.of(context).SortBy, style: AppStyles.regular13),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:darcom_app/core/utils/app_padding.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key,this.readOnly = false, this.onChanged, this.onTap, this.controller});
  final void Function(String)? onChanged;

  final void Function()? onTap;
  final TextEditingController? controller;
final  bool readOnly ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal18,
      child: TextFormField(
        readOnly:readOnly ,

        onTap: onTap,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: S.of(context).SearchForItems,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}

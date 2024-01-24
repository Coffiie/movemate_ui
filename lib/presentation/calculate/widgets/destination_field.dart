import 'package:flutter/material.dart';
import 'package:movemate_ui/presentation/core/extensions/on_build_context.dart';

class DestinationField extends StatelessWidget {
  const DestinationField({
    super.key,
    required this.suffixIcon,
    required this.hintText,
  });
  final Widget suffixIcon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                suffixIcon,
                const SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: VerticalDivider(
                    width: 3,
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondaryContainer
                        .withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
        ),
        fillColor: Theme.of(context)
            .colorScheme
            .onSecondaryContainer
            .withOpacity(0.05),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        hintText: hintText,
        hintStyle: context.textTheme.bodyLarge!.copyWith(
          color: Theme.of(context)
              .colorScheme
              .onSecondaryContainer
              .withOpacity(0.55),
        ),
      ),
    );
  }
}

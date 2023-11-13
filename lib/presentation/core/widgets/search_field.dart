import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, this.onTap, this.onChanged});
  final void Function()? onTap;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: TextFormField(
        onChanged: onChanged,
        onTap: onTap,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: IconButton(
                icon: Icon(
                  Icons.qr_code_scanner,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                onPressed: () {},
              ),
            ),
          ),
          hintText: 'Enter the receipt number ...',
        ),
      ),
    );
  }
}

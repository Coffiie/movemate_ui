import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: TextFormField(
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

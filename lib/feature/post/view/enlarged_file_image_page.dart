import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:matching_app/config/utils/color/colors.dart';

class EnlargedFileImagePage extends ConsumerWidget {
  const EnlargedFileImagePage({super.key, required this.imageFile});

  final File imageFile;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          color: defaultColors.appBackColor,
          child: Center(
            child: Image.file(
              imageFile,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: defaultColors.talkRoomErrorImageBackColor,
                    ),
                    child: const Icon(Icons.image_not_supported_rounded),
                  ),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 0,
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              context.pop();
            },
          ),
        ),
      ],
    );
  }
}

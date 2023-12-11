import 'package:flutter/material.dart';

import '../core/app_export.dart';

class ViewedPreview extends StatelessWidget {
  final Image backgroundImage;
  final String title;
  final double progressValue;
  final VoidCallback onTap;

  const ViewedPreview(
      {super.key,
      required this.backgroundImage,
      required this.onTap,
      this.title = 'No Title',
      this.progressValue = 0.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          height: 160.0,
          margin: getMargin(right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 136.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: backgroundImage.image, fit: BoxFit.cover)),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: AppStyle.txtNunitoSansSemiBold20,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

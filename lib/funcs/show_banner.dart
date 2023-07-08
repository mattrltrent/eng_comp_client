import 'package:alert_banner/widgets/alert.dart';
import 'package:flutter/material.dart';

import '../../../core/styles/typography.dart';

void showBanner(BuildContext context, String message) {
  showAlertBanner(
    context,
    () {},
    Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        message,
        style: kBody.copyWith(color: Theme.of(context).colorScheme.onError),
        textAlign: TextAlign.center,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}

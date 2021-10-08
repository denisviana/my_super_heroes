import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/app/helper/ui_helper.dart';
import 'package:my_app/app/styles/app_border_radius.dart';
import 'package:my_app/app/styles/app_color_scheme.dart';
import 'package:my_app/app/styles/app_font_size.dart';
import 'package:my_app/app/styles/app_font_weight.dart';
import 'package:my_app/app/styles/app_spacing.dart';

import '../../../../generated/l10n.dart';
import 'model/super_hero_model.dart';

class SuperHeroCardWidget extends StatelessWidget {
  final SuperHeroModel model;
  final VoidCallback onPressed;

  const SuperHeroCardWidget({required this.model, required this.onPressed});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.extraMedium),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: AppBorderRadius.mini,
                child: Hero(
                    tag: model.id,
                    child:
                        CachedNetworkImage(imageUrl: model.image, height: 180)),
              ),
              UIHelper.horizontalSpaceMedium,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      model.name,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: AppFontSize.ultra,
                          color: AppColorScheme.emphasis,
                          fontWeight: AppFontWeight.bold),
                    ),
                    UIHelper.verticalSpaceSmall,
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColorScheme.border, width: 1)),
                    ),
                    UIHelper.verticalSpaceSmall,
                    Text(
                      S.of(context).powerStats,
                      style: TextStyle(
                          fontSize: AppFontSize.small,
                          color: AppColorScheme.emphasis),
                    ),
                    UIHelper.verticalSpaceSmall,
                    Text(
                      'Power: ${model.power}',
                      style: TextStyle(
                          fontSize: AppFontSize.small,
                          color: AppColorScheme.emphasis),
                    ),
                    Text(
                      'Durability: ${model.durability}',
                      style: TextStyle(
                          fontSize: AppFontSize.small,
                          color: AppColorScheme.emphasis),
                    ),
                    Text(
                      'Speed: ${model.speed}',
                      style: TextStyle(
                          fontSize: AppFontSize.small,
                          color: AppColorScheme.emphasis),
                    ),
                    Text(
                      'Intelligence: ${model.intelligence}',
                      style: TextStyle(
                          fontSize: AppFontSize.small,
                          color: AppColorScheme.emphasis),
                    ),
                    Text(
                      'Combat: ${model.combat}',
                      style: TextStyle(
                          fontSize: AppFontSize.small,
                          color: AppColorScheme.emphasis),
                    ),
                    Text(
                      'Strength: ${model.strength}',
                      style: TextStyle(
                          fontSize: AppFontSize.small,
                          color: AppColorScheme.emphasis),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SuperHeroModel>('model', model));
    properties
        .add(ObjectFlagProperty<VoidCallback>.has('onPressed', onPressed));
  }
}

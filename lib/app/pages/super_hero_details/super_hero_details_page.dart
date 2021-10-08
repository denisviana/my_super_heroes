import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/app_routes.dart';
import 'package:my_app/app/helper/ui_helper.dart';
import 'package:my_app/app/styles/app_color_scheme.dart';
import 'package:my_app/app/styles/app_font_size.dart';
import 'package:my_app/app/styles/app_font_weight.dart';
import 'package:my_app/app/styles/app_spacing.dart';
import 'package:my_app/app/widgets/cards/super_hero_card/model/super_hero_model.dart';

import '../../../generated/l10n.dart';
import 'super_hero_details_controller.dart';

class SuperHeroDetailsPage extends GetView<SuperHeroDetailsController> {
  static Future? navigateWith({required SuperHeroModel argument}) =>
      Get.toNamed(Routes.superHeroDetails, arguments: argument);

  @override
  Widget build(BuildContext context) => GetBuilder<SuperHeroDetailsController>(
        builder: (_) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColorScheme.emphasis,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: Container(
            child: Obx(() {
              final model = controller.state.value.data;
              return model == null
                  ? Container()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(AppSpacing.medium),
                            child: Row(
                              children: [
                                Hero(
                                  tag: model.id,
                                  child: CachedNetworkImage(
                                    imageUrl: model.image,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                                UIHelper.horizontalSpaceMedium,
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                color: AppColorScheme.border,
                                                width: 1)),
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
                          Container(
                            padding: const EdgeInsets.all(AppSpacing.medium),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(30),
                                ),
                                color: AppColorScheme.backgroundLight),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UIHelper.verticalSpaceSmall,
                                Text(
                                  S.of(context).biography,
                                  style: TextStyle(
                                      fontSize: AppFontSize.mega,
                                      color: AppColorScheme.emphasis),
                                ),
                                UIHelper.verticalSpaceSmall,
                                Text(
                                  'Full name: ${model.fullName}',
                                  style: TextStyle(
                                      color: AppColorScheme.emphasis),
                                ),
                                UIHelper.verticalSpaceSmall,
                                Text(
                                  'Alter egos: ${model.alterEgos}',
                                  style: TextStyle(
                                      color: AppColorScheme.emphasis),
                                ),
                                UIHelper.verticalSpaceSmall,
                                Text(
                                  'Aliases: ${model.aliases}',
                                  style: TextStyle(
                                      color: AppColorScheme.emphasis),
                                ),
                                UIHelper.verticalSpaceSmall,
                                Text(
                                  'Place of birth: ${model.placeOfBirth}',
                                  style: TextStyle(
                                      color: AppColorScheme.emphasis),
                                ),
                                UIHelper.verticalSpaceSmall,
                                Text(
                                  'First Appearance: ${model.firstAppearance}',
                                  style: TextStyle(
                                      color: AppColorScheme.emphasis),
                                ),
                                UIHelper.verticalSpaceSmall,
                                Text(
                                  'Publisher: ${model.publisher}',
                                  style: TextStyle(
                                      color: AppColorScheme.emphasis),
                                ),
                                UIHelper.verticalSpaceSmall,
                                Text(
                                  'Alignment: ${model.alignment}',
                                  style: TextStyle(
                                      color: AppColorScheme.emphasis),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
            }),
          ),
        ),
      );
}

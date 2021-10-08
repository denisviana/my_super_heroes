import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/pages/super_hero_details/super_hero_details_page.dart';
import 'package:my_app/app/styles/app_color_scheme.dart';
import 'package:my_app/app/styles/app_font_size.dart';
import 'package:my_app/app/styles/app_spacing.dart';
import 'package:my_app/app/widgets/cards/super_hero_card/model/super_hero_model.dart';
import 'package:my_app/app/widgets/cards/super_hero_card/super_hero_card_widget.dart';
import 'package:my_app/app/widgets/text_fields/app_search_text_field.dart';
import 'package:my_app/core/data/enum/status.dart';

import '../../../generated/l10n.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: Size(
                MediaQuery.of(context).size.width,
                40,
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.medium),
                child: AppSearchTextField(
                  editingController: TextEditingController(),
                  onChanged: controller.onTextChanged,
                  isEditing: true,
                ),
              )),
        ),
        body: Container(
          padding: const EdgeInsets.all(AppSpacing.medium),
          child: Obx(() {
            final status = controller.state.value.status;
            final data = controller.state.value.data;
            final error = controller.state.value.error;
            switch (status) {
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.success:
                return data == null
                    ? Container()
                    : _buildBody(
                        data.superHeroes,
                      );
              case Status.failed:
                return Container(
                  child: Center(
                    child: Text(
                      error?.description ?? '',
                      style: TextStyle(
                          fontSize: AppFontSize.large, color: AppColorScheme.emphasis),
                    ),
                  ),
                );
            }
          }),
        ),
      );

  Widget _buildBody(List<SuperHeroModel> superHeroes) {
    if (superHeroes.isEmpty)
      return Container(
        child: Center(
          child: Text(
            S.current.searchForASuperHero,
            style: TextStyle(
                fontSize: AppFontSize.large, color: AppColorScheme.emphasis),
          ),
        ),
      );
    else
      return ListView.separated(
        itemCount: superHeroes.length,
        separatorBuilder: (context, index) => Container(
          width: MediaQuery.of(context).size.width,
          height: 0.5,
          color: AppColorScheme.border,
        ),
        itemBuilder: (context, index) => SuperHeroCardWidget(
          model: superHeroes[index],
          onPressed: () {
            SuperHeroDetailsPage.navigateWith(argument: superHeroes[index]);
          },
        ),
      );
  }
}

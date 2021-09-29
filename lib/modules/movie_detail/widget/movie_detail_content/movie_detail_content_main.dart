import 'package:dart_week/application/ui/theme_extensions.dart';
import 'package:dart_week/models/movie_detail_model.dart';
import 'package:dart_week/modules/movie_detail/widget/movie_detail_content/movie_cast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailContentMain extends StatelessWidget {
  final MovieDetailModel? movie;
  final showPanel = false.obs;
  MovieDetailContentMain({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.themeGrey,
        ),
        Obx(() {
          return ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (panelIndex, isExpanded) {
              // faz o inverso da variável
              showPanel.toggle();
            },
            children: [
              //cria um painel expansivo
              ExpansionPanel(
                canTapOnHeader: false,
                isExpanded: showPanel.value,
                backgroundColor: Colors.white,
                headerBuilder: (_, isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Elenco',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
                body: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: movie?.cast
                            .map(
                              (c) => MovieCast(cast: c),
                            )
                            .toList() ??
                        [],
                  ),
                ),
              )
            ],
          );
        }),
      ],
    );
  }
}

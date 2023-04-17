import 'package:base_de_projet/PRESENTATION/core/_components/default_panel.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/theme_colors.dart';
import 'package:flutter/material.dart';

class ItemPanelList {
  final IconData? icon;
  final String title;
  final Function() onTap;

  ItemPanelList({required this.title, this.icon, required this.onTap});
}

class PanelList extends StatelessWidget {
  final List<ItemPanelList> list;
  final TextButton? button;
  final String title;
  const PanelList({Key? key, required this.list, required this.title, this.button}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultPanel(
      title: title,
      child: Column(children: [
        ...list
            .map((item) => GestureDetector(
                  onTap: item.onTap,
                  child: Container(
                    color: colorpanel(800),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        if (item.icon != null) Icon(item.icon, color: colorpanel(200)),
                        SizedBox(width: 10),
                        Text(item.title,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: colorpanel(50))),
                      ],
                    ),
                  ),
                ))
            .toList(),
        button ?? Container(),
      ]),
    );
  }
}

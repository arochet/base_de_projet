import 'package:base_de_projet/presentation/_components/default_panel.dart';
import 'package:base_de_projet/presentation/_core/theme_colors.dart';
import 'package:flutter/material.dart';

class ItemPanelList {
  final IconData? icon;
  final String title;
  final Function() onTap;

  ItemPanelList({required this.title, this.icon, required this.onTap});
}

class PanelList extends StatelessWidget {
  final List<ItemPanelList> list;
  final ElevatedButton? button;
  const PanelList({Key? key, required this.list, this.button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultPanel(
      child: Column(children: [
        ...list
            .map((item) => GestureDetector(
                  onTap: item.onTap,
                  child: Container(
                    color: colorpanel(800),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        if (item.icon != null)
                          Icon(item.icon, color: colorpanel(200)),
                        SizedBox(width: 10),
                        Text(item.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: colorpanel(50))),
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

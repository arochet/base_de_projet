import 'package:base_de_projet/presentation/core/theme_colors.dart';
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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: maincolor[1],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
        child: Column(children: [
          ...list
              .map((item) => GestureDetector(
                    onTap: item.onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          if (item.icon != null) Icon(item.icon),
                          SizedBox(width: 10),
                          Text(item.title),
                        ],
                      ),
                    ),
                  ))
              .toList(),
          button ?? Container(),
        ]),
      ),
    );
  }
}

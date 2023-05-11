import 'package:base_de_projet/PRESENTATION/core/_components/table_sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DisplayDBTable extends StatelessWidget {
  final List<String> title;
  final int rowLength;
  final Object Function(int columnIndex, int rowIndex) cell;
  const DisplayDBTable({super.key, required this.title, required this.rowLength, required this.cell});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Text("Users", style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 10),
        Expanded(
          child: StickyHeadersTable(
            columnsLength: title.length,
            rowsLength: rowLength,
            cellDimensions: CellDimensions(
              contentCellWidth: 60,
              contentCellHeight: 30,
              stickyLegendWidth: 40,
              stickyLegendHeight: 30,
            ),
            columnsTitleBuilder: (i) => Text(title[i]),
            rowsTitleBuilder: (i) => Padding(
              padding: const EdgeInsets.all(3.0),
              child: Center(child: Text((i + 1).toString())),
            ),
            contentCellBuilder: (column, row) {
              final sdf = cell(column, row);

              if (sdf is String)
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text('$sdf '),
                  ),
                );
              else if (sdf is int)
                return Center(
                  child: Text('$sdf '),
                );
              else if (sdf is bool)
                return Center(
                  child: sdf
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                );
              else {
                return Container(width: 5, height: 5);
              }
            },
          ),
        ),
      ],
    );
  }
}

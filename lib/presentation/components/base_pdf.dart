/* import 'dart:io';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'bloc/alerts_details_bloc.dart';

generatePDF(AlertsDetailsState? state) async {
  final Document pdf = Document();

  /* final logo = MemoryImage((await rootBundle.load(AppStaticImages.icOnePerson))
      .buffer
      .asUint8List()); */

  //Données tableau
  final List<Cell> tabTitleAlerte = [
    Cell('Code Alerte', flex: 1),
    Cell('Commentaire', flex: 3),
    Cell('Date vêlage attendu', flex: 2),
    Cell('N°Travail', flex: 1),
    Cell('Nom', flex: 2),
    Cell('Race', flex: 1),
    Cell('N° Lactation à venir', flex: 1),
    Cell('Condition naissance dernier vêlage', flex: 1),
    Cell('Index Facilité vêlage', flex: 1),
    Cell('Note Acéto maximum dernière lacation', flex: 1),
    Cell('Sexe veau attendu ou jumeaux', flex: 1),
    Cell('Nom', flex: 2),
    Cell('Numéro', flex: 2),
    Cell('Race', flex: 1),
    Cell('Index Facilité Naissance', flex: 1),
  ];

  final List<List<Object>> tabDataAlerte = [
    [
      PdfColors.red,
      '',
      '28/01/2022',
      '2643',
      'JEUSERIAMM',
      'PH',
      '5',
      '3',
      '91',
      '5',
      'F',
      'BOSCO FALG',
      'FR0111111',
      'CH',
      '19'
    ],
    [
      PdfColors.orange,
      '',
      '28/01/2022',
      '2643',
      'JEUSERIAMM',
      'PH',
      '5',
      '3',
      '91',
      '5',
      'F',
      'BOSCO FALG',
      'FR0111111',
      'CH',
      '19'
    ],
    [
      PdfColors.green,
      '',
      '28/01/2022',
      '2643',
      'JEUSERIAMM',
      'PH',
      '5',
      '3',
      '91',
      '5',
      'F',
      'BOSCO FALG',
      'FR0111111',
      'CH',
      '19'
    ],
  ];

  pdf.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      orientation: PageOrientation.portrait,
      build: (Context context) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            header(context),
            SizedBox(height: 10),
            table(
              context,
              tabTitleAlerte,
              tabDataAlerte,
            ),
          ]),
        ); // Center
      })); // Page

  Directory appDocDirectory = await getApplicationDocumentsDirectory();
  final File file = File('${appDocDirectory.path}/alertes.pdf');
  await file.writeAsBytes(await pdf.save());

  OpenFilex.open('${appDocDirectory.path}/alertes.pdf');
}

//HEAD
Widget header(Context context) {
  final TextStyle styleMain = TextStyle(
      fontWeight: FontWeight.bold, color: PdfColors.orange, fontSize: 16);
  final TextStyle styleSecond =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 14);

  return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(children: [
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('ALERTES VÊLAGE', style: styleMain),
              Text('Période : Du -- à --', style: styleSecond),
              Text('Elevage - N°cheptel', style: styleSecond),
            ]),
            Expanded(child: Container()),
            SizedBox(
              height: 50,
              width: 50,
              child: /* Image(logo) */ Container(color: PdfColors.red),
            )
          ])));
}

//CONTENT
Widget table(Context context, List<Cell> title, List<List<dynamic>> data) {
  return Table(
    border: TableBorder.all(color: PdfColors.black),
    children: [
      TableRow(
        decoration: BoxDecoration(color: PdfColors.orange200),
        children: title
            .map<Widget>((Cell t) =>
                Expanded(child: PaddedHeader(context, t.label), flex: t.flex))
            .toList(),
      ),
      ...data.map(
        (List row) => TableRow(
          children: row.map<Widget>((e) {
            if (e is String) {
              return PaddedText('$e');
            } else if (e is PdfColor) {
              return Container(height: 20, width: 20, color: e);
            }

            return Container();
          }).toList(),
        ),
      ),
    ],
  );
}

Widget PaddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: EdgeInsets.all(3),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(fontSize: 6),
      ),
    );

Widget PaddedHeader(
  final Context context,
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: EdgeInsets.all(3),
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(fontSize: 6),
      ),
    );

class Cell {
  int flex;
  String label;

  Cell(this.label, {this.flex = 1});
}
 */
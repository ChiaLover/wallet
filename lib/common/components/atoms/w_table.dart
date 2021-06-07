part of atoms;

class WTable extends StatelessWidget {
  final TableResponse data;

  const WTable(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context)
        .textTheme
        .bodyText2
        ?.copyWith(fontWeight: FontWeight.w700);
    final headerBackgroundColor =
        MaterialStateColor.resolveWith((_) => WColors.blackHaze);
    //Header data
    final tableHeader = data.headers
        .map((header) => DataColumn(label: Text(header.title)))
        .toList();
    //Row data
    final List<DataRow> tableRows = _buildTableRows(data.body);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: headerBackgroundColor,
          headingTextStyle: headerStyle,
          headingRowHeight: 33,
          dataRowHeight: 33,
          columns: tableHeader,
          rows: tableRows,
        ),
      ),
    );
  }

  List<DataRow> _buildTableRows(List<List<Cell>> body) {
    return body.map((row) {
      return DataRow(cells: _buildDataCells(row));
    }).toList();
  }

  List<DataCell> _buildDataCells(List<Cell> row) {
    final TableRenderEngine renderEngine = DI.get(TableRenderEngine);
    return row.map((cell) => DataCell(renderEngine.render(cell)),).toList();
  }
}

class TableResponse {
  final List<TableHeader> headers;
  final List<List<Cell>> body;

  TableResponse({required this.headers, required this.body});
}

class TableHeader {
  final String title;
  final Alignment? align;

  TableHeader(this.title, {this.align});
}

abstract class Cell {
  static const String LABEL_TYPE = 'label_type';
  static const String TEXT_TYPE = 'text_type';
  static const String LINK_TYPE = 'link_type';

  final String data;

  String get type;

  Cell(this.data);
}

class TextCell extends Cell {
  TextCell(String data) : super(data);

  @override
  String get type => Cell.TEXT_TYPE;
}

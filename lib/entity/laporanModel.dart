class Report {
  final String status;
  final ReportData data;

  Report({required this.status, required this.data});

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      status: json['status'],
      data: ReportData.fromJson(json['data']),
    );
  }

  @override
  String toString() {
    return 'Report(property1: $status, property2: $data)';
  }

}

class ReportData {
  final String bulan;
  final String tahun;
  final String tglCetak;
  final Map<String, Transaction> dataTable;
  final List<dynamic> data;

  ReportData({
    required this.bulan,
    required this.tahun,
    required this.tglCetak,
    required this.dataTable,
    required this.data,
  });

  factory ReportData.fromJson(Map<String, dynamic> json) {
    return ReportData(
      bulan: json['bulan'].toString(),
      tahun: json['tahun'].toString(),
      tglCetak: json['tgl_cetak'].toString(),
      dataTable: (json['dataTable'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, Transaction.fromJson(value)),
      ),
      data: (json['data'] as List<dynamic>).map((item) {
        if (item is Map<String, dynamic>) {
          return item.map((key, value) => MapEntry(key, Transaction.fromJson(value)));
        } else if (item is List<dynamic>) {
          return item.map((e) => e is Map<String, dynamic> ? Transaction.fromJson(e) : null).toList();
        } else {
          throw Exception('Invalid data format');
        }
      }).toList(),
    );
  }

  @override
  String toString() {
    return 'Report(bulan: $bulan, tahun: $tahun, tglCetak: $tglCetak, dataTable: ${dataTable.toString()}, data: ${data.toString()})';
  }

}

class Transaction {
  final int pemasukan;
  final int pengeluaran;

  Transaction({
    required this.pemasukan,
    required this.pengeluaran,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      pemasukan: json['Pemasukan'] as int,
      pengeluaran: json['Pengeluaran'] as int,
    );
  }

  @override
  String toString() {
    return 'Transaction(property1: $pemasukan, property2: $pengeluaran)';
  }

}
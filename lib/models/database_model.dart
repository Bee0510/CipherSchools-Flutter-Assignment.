// ignore_for_file: non_constant_identifier_names

class transaction {
  final String Transaction_id;
  final String user_id;
  final String catagory;
  final String amount;
  final DateTime date;
  final String description;
  final String type;
  final String wallet;

  transaction({
    required this.Transaction_id,
    required this.user_id,
    required this.catagory,
    required this.amount,
    required this.date,
    required this.description,
    required this.type,
    required this.wallet,
  });
}

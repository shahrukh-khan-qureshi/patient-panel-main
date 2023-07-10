
class Report {
  final int id;
  final String title;
  final DateTime date;
  final String doctorName;
  final String patientName;
  final String notes;

  Report({
    required this.id,
    required this.title,
    required this.date,
    required this.doctorName,
    required this.patientName,
    required this.notes,
  });
}

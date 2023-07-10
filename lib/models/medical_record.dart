class MedicalRecord {
  final int id;
  final String title;
  final DateTime date;
  final String description;
  final String doctorName; // Added doctorName parameter
  final String patientName;

  var filesAttached; // Added patientName parameter

  MedicalRecord({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.doctorName,
    required this.patientName, required int filesAttached,
  });
}

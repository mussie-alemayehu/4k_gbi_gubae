class Student {
  final String id;
  final String fullName;
  final String christianName;
  final String department;
  final String sex;
  final int batch;
  final String phone;

  const Student({
    required this.id,
    required this.fullName,
    required this.christianName,
    required this.department,
    required this.sex,
    required this.batch,
    required this.phone,
  });

  Student.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['full_name'],
        christianName = data['christian_name'],
        department = data['department'],
        sex = data['sex'],
        batch = data['batch'],
        phone = data['phone'];
}

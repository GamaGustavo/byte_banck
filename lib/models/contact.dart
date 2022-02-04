class Contact {
  final int? id;
  final String fullName;
  final int accountNumber;

  Contact({
    this.id,
    required this.fullName,
    required this.accountNumber,
  });

  @override
  String toString() {
    return '\nContact: {'
        'id: $id, '
        'fullName: $fullName, '
        'acountNumbe: $accountNumber'
        '}';
  }
}

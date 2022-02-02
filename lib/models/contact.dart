class Contact {
  final String fullname;
  final int acountNumbe;

  Contact(
    this.fullname,
    this.acountNumbe,
  );

  @override
  String toString() {
    return 'Contact{fullname: $fullname, acountNumbe: $acountNumbe}';
  }
}

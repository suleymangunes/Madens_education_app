enum IconEnums {
  icon('icon'),
  ;

  final String value;

  const IconEnums(this.value);

  String get toPng => 'assets/icon/$value.png';
}

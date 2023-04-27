enum AnimationEnum {
  loading('button_loading'),
  ;

  final String value;

  const AnimationEnum(this.value);

  String get toJson => "assets/animation/$value.json";
}

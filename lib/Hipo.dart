class Hipo{
  final String position;
  final int yearsInHipo;
  Hipo(this.position, this.yearsInHipo);

  Hipo.fromJson(Map<String, dynamic> json)
      : position = json['position'],
        yearsInHipo = json['years_in_hipo'];

  Map<String, dynamic> toJson() =>
      {
        'position': position,
        'years_in_hipo': yearsInHipo,
      };
}
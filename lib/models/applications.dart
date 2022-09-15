class Application {
  final String logo;
  final String name;
  final String website;

  Application({
    required this.logo,
    required this.name,
    required this.website,
  });
  factory Application.fromJSON(Map json) {
    return Application(
      logo: json["logo"],
      name: json["name"],
      website: json["website"],
    );
  }
}

class CreditsModel {
  final String name;
  final Uri url;

  CreditsModel({
    required this.name,
    required this.url,
  });
}

final List<CreditsModel> listCredits = [
  CreditsModel(name: "FlatIcon", url: Uri.parse("https://www.flaticon.com/")),
  CreditsModel(name: "FlatIcon - DinosoftLabs", url: Uri.parse("https://www.flaticon.com/authors/dinosoftlabs")),
  CreditsModel(name: "FlatIcon - Freepik", url: Uri.parse("https://www.flaticon.com/authors/freepik")),
  // ...
];

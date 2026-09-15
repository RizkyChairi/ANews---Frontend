void main() {
  List<String> skills = [
    "JavaScript",
    "HTML",
    "CSS",
    "Flutter",
    "Dart",
  ];

  print("=== LIST SKILL ===");

  for (var skill in skills) {
    print(skill);
  }

  Map<String, dynamic> profile = {
    "nama": "Stya",
    "umur": 16,
    "tinggi": 160,
    "isStudent": true,
  };

  print("\n=== MAP PROFILE ===");

  print("Nama       : ${profile["nama"]}");
  print("Umur       : ${profile["umur"]}");
  print("Tinggi     : ${profile["tinggi"]} cm");
  print("Pelajar    : ${profile["isStudent"]}");
}
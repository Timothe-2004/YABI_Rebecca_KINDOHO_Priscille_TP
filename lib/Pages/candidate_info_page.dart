class Candidate {
  final String name;
  final String firstName;
  final String description;
  final String party;
  final String imageUrl;
  DateTime selectedDate;


  Candidate({
    required this.name,
    required this.firstName,
    required this.description,
    required this.party,
    required this.imageUrl,
    required this.selectedDate,
  });

  get birthDate => null;
}

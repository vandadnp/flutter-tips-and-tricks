// 🐦 Twitter:                  https://twitter.com/vandadnp
// 🔵 LinkedIn:                 https://linkedin.com/in/vandadnp
// 🎥 YouTube:                  https://youtube.com/c/vandadnp
// 💙 Free Flutter Course:      https://linktr.ee/vandadnp
// 🤝 Want to support my work?  https://buymeacoffee.com/vandad

@immutable
class Address {
  final String? firstLine;
  final String? secondLine;
  const Address(this.firstLine, this.secondLine);
}

@immutable
class Person {
  final Person? father;
  final Address? address;
  const Person(this.father, this.address);
}

extension GetFathersFirstAddressLine on Person {
  String? get firstAddressLineOfFather => father?.address?.firstLine;
}

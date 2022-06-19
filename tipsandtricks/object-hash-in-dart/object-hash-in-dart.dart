// Free Flutter Course 💙 https://linktr.ee/vandadnp

class BreadCrumb {
  final bool isActive;
  final String name;
  BreadCrumb({
    required this.isActive,
    required this.name,
  });
  BreadCrumb activated() => BreadCrumb(
        isActive: true,
        name: name,
      );
  @override
  bool operator ==(covariant BreadCrumb other) =>
      isActive == other.isActive && name == other.name;

  @override
  int get hashCode => Object.hash(isActive, name);
}

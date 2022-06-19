// Want to support my work 🤝? https://buymeacoffee.com/vandad

@immutable
class Season {
  final String name;
  final String imageUrl;
  const Season({required this.name, required this.imageUrl});
  const Season.spring()
      : name = 'Spring',
        imageUrl = 'https://cnn.it/3xu58Ap';
  const Season.summer()
      : name = 'Summer',
        imageUrl = 'https://bit.ly/2VcCSow';
  const Season.autumn()
      : name = 'Autumn',
        imageUrl = 'https://bit.ly/3A3zStC';
  const Season.winter()
      : name = 'Winter',
        imageUrl = 'https://bit.ly/2TNY7wi';
}

const allSeasons = [
  Season.spring(),
  Season.summer(),
  Season.autumn(),
  Season.winter()
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = width / (16.0 / 9.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageScrollPhysics in Flutter'),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const PageScrollPhysics(),
          clipBehavior: Clip.antiAlias,
          children: allSeasons.map((season) {
            return SizedBox(
              width: width,
              height: height,
              child: Image.network(
                season.imageUrl,
                height: height,
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

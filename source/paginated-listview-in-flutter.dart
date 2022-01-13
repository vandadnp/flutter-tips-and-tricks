// Want to support my work 🤝? https://buymeacoffee.com/vandad

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

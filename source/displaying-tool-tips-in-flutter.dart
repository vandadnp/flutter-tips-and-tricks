const imagesAndInfo = [
  ['https://bit.ly/3xnoJTm', 'Stockholm, Sweden'],
  ['https://bit.ly/3hIuC78', 'Dalarna, Sweden'],
  ['https://bit.ly/3wi9mdG', 'Brighton, UK'],
  ['https://bit.ly/3dSSMuy', 'Hove, UK'],
  ['https://bit.ly/3xoWCmV', 'Kerala, India'],
  ['https://bit.ly/3hGmjZC', 'Salvador da Bahia, Brazil']
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tooltips in Flutter')),
      body: ListView.builder(
        itemCount: imagesAndInfo.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Tooltip(
              decoration: BoxDecoration(
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withAlpha(180),
                    offset: Offset.zero,
                    spreadRadius: 30.0,
                    blurRadius: 30.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              textStyle: TextStyle(fontSize: 20, color: Colors.white),
              message: imagesAndInfo[index][1],
              child: Image.network(
                imagesAndInfo[index][0],
              ),
            ),
          );
        },
      ),
    );
  }
}

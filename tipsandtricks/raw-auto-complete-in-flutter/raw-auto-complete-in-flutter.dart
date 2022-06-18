// Want to support my work 🤝? https://buymeacoffee.com/vandad

const emailProviders = [
  'gmail.com',
  'hotmail.com',
  'yahoo.com',
];

const icons = [
  'https://bit.ly/3HsvvvB',
  'https://bit.ly/3n6GW4L',
  'https://bit.ly/3zf2RLy',
];

class EmailTextField extends StatefulWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focus;

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<String>(
      textEditingController: _controller,
      focusNode: _focus,
      fieldViewBuilder: (_, controller, focusNode, onSubmitted) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          onFieldSubmitted: (value) {
            onSubmitted();
          },
        );
      },
      optionsBuilder: (textEditingValue) {
        final lastChar = textEditingValue.text.characters.last;
        if (lastChar == '@') {
          return emailProviders;
        } else {
          return [];
        }
      },
      optionsViewBuilder: (context, onSelected, options) {
        return OptionsList(
          onSelected: onSelected,
          options: options,
          controller: _controller,
        );
      },
    );
  }

  @override
  void initState() {
    _controller = TextEditingController();
    _focus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focus.dispose();
    _controller.dispose();
    super.dispose();
  }
}

class OptionsList extends StatelessWidget {
  final Iterable<String> options;
  final AutocompleteOnSelected<String> onSelected;
  final TextEditingController controller;
  const OptionsList({
    Key? key,
    required this.onSelected,
    required this.options,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        child: SizedBox(
          height: 150,
          child: ListView.builder(
            padding: const EdgeInsets.all(0.0),
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options.elementAt(index);
              return GestureDetector(
                onTap: () => onSelected(controller.text + option),
                child: ListTile(
                  horizontalTitleGap: 2.0,
                  leading: Image.network(
                    icons[index],
                    width: 24,
                    height: 24,
                  ),
                  title: Text(option),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raw Auto Complete in Flutter'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: EmailTextField(),
      ),
    );
  }
}

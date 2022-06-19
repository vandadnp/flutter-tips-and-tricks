import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Event {
  const Event();
}

class SearchEvent extends Event {
  final String searchString;
  const SearchEvent(this.searchString);
}

class ClearSearch extends Event {}

class SearchBloc extends Bloc<Event, List<String>> {
  static const names = ['foo', 'bar', 'baz'];

  SearchBloc() : super(names) {
    on<Event>((event, emit) {
      if (event is SearchEvent) {
        emit(names
            .where((element) => element.contains(event.searchString))
            .toList());
      } else if (event is ClearSearch) {
        emit(names);
      }
    });
  }
}

class BlocTextEditingController extends TextEditingController {
  SearchBloc? bloc;
  BlocTextEditingController() {
    addListener(() {
      if (text.isEmpty) {
        bloc?.add(ClearSearch());
      } else {
        bloc?.add(SearchEvent(text));
      }
    });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

const largeStyle = TextStyle(fontSize: 30);

class _HomePageState extends State<HomePage> {
  late final BlocTextEditingController _controller;

  @override
  void initState() {
    _controller = BlocTextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.bloc = BlocProvider.of<SearchBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Search in Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<SearchBloc, List<String>>(
          builder: (context, state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                if (index == 0) {
                  // search field
                  return TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter search term here...',
                      hintStyle: largeStyle,
                    ),
                    style: largeStyle,
                    controller: _controller,
                  );
                } else {
                  final name = state[index - 1];
                  return ListTile(
                    title: Text(
                      name,
                      style: largeStyle,
                    ),
                  );
                }
              },
              itemCount: state.length + 1, // +1 for search
            );
          },
        ),
      ),
    );
  }
}

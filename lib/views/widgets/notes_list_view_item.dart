import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit.dart';
import 'package:notes_app/model/notes_model.dart';

import 'package:notes_app/views/widgets/custom_notes_item.dart';

class NotesListViewItem extends StatefulWidget {
  const NotesListViewItem({super.key});

  @override
  State<NotesListViewItem> createState() => NotesListViewItemState();
}

class NotesListViewItemState extends State<NotesListViewItem> {
  late List<NotesModel> allNotes;
  late List<NotesModel> searchedNotes;
  bool _isSearching = false;
  final _searchController = TextEditingController();

  void _search(String value) {
    searchedNotes =
        allNotes
            .where((m) => m.title.toLowerCase().contains(value.toLowerCase()))
            .toList();
    setState(() {});
  }

  Widget buildSearchedField() {
    return TextField(
      controller: _searchController,
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        hintText: 'Find Your Note',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white, fontSize: 22),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 18),
      onChanged: _search,
    );
  }

  void _startSearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    _searchController.clear();
    setState(() {
      _isSearching = false;
    });
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: _stopSearch,
          icon: const Icon(Icons.clear, color: Colors.white, size: 26),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(Icons.search, color: Colors.white, size: 26),
        ),
      ];
    }
  }

  Widget buildBlocWidget() {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NotesModel> notes = BlocProvider.of<NotesCubit>(context).notes!;

        allNotes = notes;
        return buildListView();
      },
    );
  }

  Widget buildListView() {
    final list = _searchController.text.isEmpty ? allNotes : searchedNotes;

    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return CustomNotesItem(notes: list[index]);
      },
      itemCount: list.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? buildSearchedField() : const Text('Notes'),
        actions: _buildAppBarActions(),
        automaticallyImplyLeading: false,
      ),
      body: buildBlocWidget(),
    );
  }
}

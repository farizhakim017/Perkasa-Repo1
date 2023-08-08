// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, use_build_context_synchronously, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteApp extends StatefulWidget {
  @override
  _NoteAppState createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  late CollectionReference notesCollection;
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    notesCollection = FirebaseFirestore.instance.collection('notes');
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    final querySnapshot = await notesCollection.get();

    final fetchedNotes = querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Note(
        id: doc.id,
        title: data['title'] as String,
        content: data['content'] as String,
      );
    }).toList();

    setState(() {
      notes = fetchedNotes;
    });
  }

  Future<void> createNote({
    required String title,
    required String content,
  }) async {
    final newNote = await notesCollection.add({
      'title': title,
      'content': content,
    });

    final note = Note(
      id: newNote.id,
      title: title,
      content: content,
    );

    setState(() {
      notes.add(note);
    });
  }

  Future<void> updateNote({
    required String noteId,
    required String title,
    required String content,
  }) async {
    await notesCollection.doc(noteId).update({
      'title': title,
      'content': content,
    });

    setState(() {
      final noteIndex = notes.indexWhere((note) => note.id == noteId);
      if (noteIndex != -1) {
        notes[noteIndex] = Note(
          id: noteId,
          title: title,
          content: content,
        );
      }
    });
  }

  Future<void> deleteNote({
    required String noteId,
  }) async {
    await notesCollection.doc(noteId).delete();
    setState(() {
      notes.removeWhere((note) => note.id == noteId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF321C8B),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Nota Diri.',
          style: TextStyle(
            color: Color(0xFF321C8B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return GestureDetector(
            onTap: () async {
              final editedNote = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteFormScreen(
                    note: note,
                    onSubmit: (title, content) => updateNote(
                      noteId: note.id,
                      title: title,
                      content: content,
                    ),
                  ),
                ),
              );
              if (editedNote != null) {
                await updateNote(
                  noteId: note.id,
                  title: editedNote.title,
                  content: editedNote.content,
                );
              }
            },
            child: NoteCard(
              title: note.title,
              content: note.content,
              onDelete: () => deleteNote(noteId: note.id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final newNote = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteFormScreen(
                onSubmit: (title, content) async {
                  await createNote(
                    title: title,
                    content: content,
                  );
                  Navigator.pop(context); // Close the note creation screen
                },
              ),
            ),
          );
          if (newNote != null) {
            await createNote(
              title: newNote.title,
              content: newNote.content,
            );
          }
        },
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onDelete;

  const NoteCard({
    required this.title,
    required this.content,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(content),
            Spacer(),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Delete Note'),
                      content:
                          Text('Are you sure you want to delete this note?'),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                        TextButton(
                          child: Text('Delete'),
                          onPressed: () {
                            onDelete();
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NoteFormScreen extends StatefulWidget {
  final Note? note;
  final void Function(String, String) onSubmit;

  NoteFormScreen({
    this.note,
    required this.onSubmit,
  });

  @override
  _NoteFormScreenState createState() => _NoteFormScreenState();
}

class _NoteFormScreenState extends State<NoteFormScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _contentController =
        TextEditingController(text: widget.note?.content ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF321C8B),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Perkasa.',
          style: TextStyle(
            color: Color(0xFF321C8B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Content',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text;
                final content = _contentController.text;
                widget.onSubmit(title, content);
              },
              child: Text(widget.note != null ? 'Update' : 'Create'),
            ),
          ],
        ),
      ),
    );
  }
}

class Note {
  final String id;
  final String title;
  final String content;

  Note({
    required this.id,
    required this.title,
    required this.content,
  });
}

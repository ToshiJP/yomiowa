import 'package:flutter/material.dart';

void main() {
  runApp(const YomiowaApp());
}

class YomiowaApp extends StatelessWidget {
  const YomiowaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yomiowa',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const ReadingRecordsPage(),
    );
  }
}

class ReadingRecordsPage extends StatefulWidget {
  final String title = "読書記録";

  const ReadingRecordsPage({super.key});

  @override
  State<ReadingRecordsPage> createState() => _ReadingRecordsPageState();
}

class _ReadingRecordsPageState extends State<ReadingRecordsPage> {
  final List<ReadingRecord> records = [
    ReadingRecord(Book(title: "すべてがFになる", author: "森博嗣")),
    ReadingRecord(Book(title: "氷菓", author: "米澤穂信")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: records.length,
          itemBuilder: (context, idx) {
            return ListTile(
              leading: const Icon(Icons.book),
              title: Text(records[idx].book.title),
              subtitle: Text(records[idx].book.author),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ReadingRecord {
  Book book;

  ReadingRecord(this.book);
}

class Book {
  String title;
  String author;

  Book({
    required this.title,
    required this.author,
  });
}

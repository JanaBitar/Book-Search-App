import 'package:flutter/material.dart';
import 'book_service.dart';
import 'product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  String _errorMessage = '';
  List<Book> _books = [];

  @override
  void initState() {
    super.initState();
    fetchBooks().then((data) {
      setState(() {
        _books = data;
        _loading = false;
      });
    }).catchError((error) {
      setState(() {
        _errorMessage = error.toString();
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Search'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : ListView.builder(
                  itemCount: _books.length,
                  itemBuilder: (context, index) {
                    final book = _books[index];
                    return ListTile(
                      title: Text(book.title),
                      subtitle: Text('By ${book.author}'),
                      trailing: Text('${book.publishedYear}'),
                    );
                  },
                ),
    );
  }
}

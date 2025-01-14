
import 'product.dart';
import 'package:http/http.dart' as http;

const String baseURL = 'http://localhost/book_api/getBooks.php';

Future<List<Book>> fetchBooks() async {
  final response = await http.get(Uri.parse(baseURL));
  if (response.statusCode == 200) {
    return parseBooks(response.body);
  } else {
    throw Exception('Failed to load books');
  }
}


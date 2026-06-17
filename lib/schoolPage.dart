import 'package:flutter/material.dart';
import 'package:flutter_application_1/counterModel.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SchoolPage extends StatefulWidget {
  const SchoolPage({super.key});

  @override
  State<SchoolPage> createState() => SchoolPageState();
}

class SchoolPageState extends State<SchoolPage> {
  String _result = '';
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  Future<void> _fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        headers: {'Accept': 'application/json'},
      );
      setState(() {
        _result = response.body;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error fetching data: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder: (context, counter, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('School'),
            backgroundColor: Theme.of(context).colorScheme.secondary,
          ),
          body: Column(
            children: [
              TextButton(onPressed: _fetchData, child: const Text('Fetch')),

              Center(
                child: Text(
                  'Result: $_result',
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

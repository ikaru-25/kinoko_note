import 'package:flutter/material.dart';
import 'package:kinoko_note/pages/dictionary/detail_page.dart';
import 'package:kinoko_note/src/data/db.dart';
import 'package:intl/intl.dart';
import 'package:kinoko_note/components/bottom_navigation.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late AppDatabase db;
  late List<ObservationData> _records;

  DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  // List<Map<String, dynamic>> _fields = [];

  @override
  void initState() {
    super.initState();
    db = AppDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('きのこノート'),
      ),
      body: FutureBuilder<void>(
        future: this.db.allObservationEntries,
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            _records = snapshot.data;
            return ListView.builder(
                itemCount: _records.length,
                itemBuilder: (context, idx) => Card(
                      // color: Colors.teal[200],
                      child: ListTile(
                        title: Text(_records[idx].name),
                        subtitle: Text(
                            _dateFormat.format(_records[idx].observation_date)),
                        trailing: Icon(Icons.more_vert),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                    observationId: _records[idx].id)),
                          );
                        },
                      ),
                    ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

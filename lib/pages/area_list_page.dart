import 'package:flutter/material.dart';
import 'package:kinoko_note/model/field.dart';

class AreaListPage extends StatefulWidget {
  const AreaListPage({Key? key}) : super(key: key);

  @override
  _AreaListPageState createState() => _AreaListPageState();
}

class _AreaListPageState extends State<AreaListPage> {
  List<Map<String, dynamic>> _fields = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshFieldList() async {
    final data = await FieldTBL.getFields();
    setState(() {
      _fields = data;
      _isLoading = false;
    });
  }

  // wigetが作成されたタイミングの処理
  @override
  void initState() {
    super.initState();
    _refreshFieldList(); // Loading the diary when the app starts
  }

  final TextEditingController _fieldNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingJournal =
          _fields.firstWhere((element) => element['id'] == id);
      _fieldNameController.text = existingJournal['name'];
      _descriptionController.text = existingJournal['description'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _fieldNameController,
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _addressController,
                    decoration: const InputDecoration(hintText: 'Address'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await _addField();
                      }

                      if (id != null) {
                        await _updateField(id);
                      }

                      // Clear the text fields
                      _fieldNameController.text = '';
                      _addressController.text = '';
                      _descriptionController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Create New' : 'Update'),
                  )
                ],
              ),
            ));
  }

// Insert
  Future<void> _addField() async {
    await FieldTBL.createField(_fieldNameController.text,
        _addressController.text, _descriptionController.text);
    _refreshFieldList();
  }

  // Update
  Future<void> _updateField(int id) async {
    await FieldTBL.updateField(id, _fieldNameController.text,
        _addressController.text, _descriptionController.text);
    _refreshFieldList();
  }

  // Delete
  void _deleteField(int id) async {
    await FieldTBL.deleteField(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshFieldList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('きのこノート'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _fields.length,
              itemBuilder: (context, index) => Card(
                color: Colors.teal[200],
                margin: const EdgeInsets.all(15),
                child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/aioiyama.JPG"),
                    ),
                    title: Text(_fields[index]['name']),
                    subtitle: Text(_fields[index]['description']),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => AreaListPage()),
                      // );
                    },
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _showForm(_fields[index]['id']),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _deleteField(_fields[index]['id']),
                          ),
                        ],
                      ),
                      // ),
                    )),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}

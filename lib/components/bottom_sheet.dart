import 'package:flutter/material.dart';

class IObservation {
  late String name;
  late String imageName;
}

class BottomSheetForm extends StatefulWidget {
  const BottomSheetForm({Key? key}) : super(key: key);

  @override
  State<BottomSheetForm> createState() => _BottomSheet();
}

class _BottomSheet extends State<BottomSheetForm>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late IObservation observation;

  void initState() {
    super.initState();
    observation = new IObservation();
    _tabController = TabController(length: 2, vsync: this);
  }

  void setName(String name) {
    observation.name = name;
  }

  @override
  Widget build(context) {
    return Container(
        child: SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
        // this will prevent the soft keyboard from covering the text fields
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 450, // 暫定の高さ決め打ちのため要検討
          child: DefaultTabController(
            length: 2,
            initialIndex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                          icon: Icon(
                        Icons.border_color,
                        color: Colors.grey[600],
                      )),
                      Tab(
                          icon: Icon(
                        Icons.search,
                        color: Colors.grey[600],
                      )),
                    ],
                  ),
                  // Expanded(child: Column()),

                  Expanded(
                      child: TabBarView(controller: _tabController, children: [
                    SingleChildScrollView(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                      ),
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (value) {
                              // setFormData(value);
                            },
                            decoration:
                                const InputDecoration(hintText: 'キノコの名前'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              "発生場所",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 0,
                                    groupValue: 0,
                                    onChanged: (value) {},
                                  ),
                                  Text('枯木/倒木')
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: 0,
                                    onChanged: (value) {},
                                  ),
                                  Text('草地')
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: 0,
                                    onChanged: (value) {},
                                  ),
                                  Text('土')
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 3,
                                    groupValue: 0,
                                    onChanged: (value) {},
                                  ),
                                  Text('その他')
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                      ),
                      child: Column(
                        children: [
                          CheckboxListTile(
                            // tileColor: Colors.red,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: const Text('つば'),
                            value: true,
                            onChanged: (bool? value) {},
                          ),
                          CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            // tileColor: Colors.red,
                            title: const Text('つぼ'),
                            value: true,
                            onChanged: (bool? value) {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              "傘の下",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 0,
                                    groupValue: 1,
                                    onChanged: (value) {},
                                  ),
                                  Text('ひだ')
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: 1,
                                    onChanged: (value) {},
                                  ),
                                  Text('しわひだ')
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: 0,
                                    onChanged: (value) {},
                                  ),
                                  Text('管孔')
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 3,
                                    groupValue: 0,
                                    onChanged: (value) {},
                                  ),
                                  Text('針')
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ])),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        // Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromWidth(200),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    ));
  }
}

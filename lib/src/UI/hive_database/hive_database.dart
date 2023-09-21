import 'package:flutter/material.dart';
import 'package:hive_database/src/core/models/usermodel.dart';
import 'package:hive_flutter/adapters.dart';

class HiveDatabaseScreen extends StatefulWidget {
  const HiveDatabaseScreen({super.key});

  @override
  State<HiveDatabaseScreen> createState() => _HiveDatabaseScreenState();
}

class _HiveDatabaseScreenState extends State<HiveDatabaseScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Container(
          child: ValueListenableBuilder(
            valueListenable:Hive.box<UserModel>("user").listenable(),
            builder: (context,box,_)
            {
              final keys=box.keys.toList();
              return ListView.builder(
                itemCount: keys.length,
                itemBuilder: (context,index)
                {
                      final int key = keys[index];
        final  data = box.get(key);
        return Card(
          child: ListTile(
            leading:Text("$index"),
            title: Text(data!.title.toString()),
            trailing: Text(data.age.toString()),
          ),
        );
                },
              );

            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => Dialog(
                  backgroundColor: Colors.blueGrey[100],
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(hintText: "name"),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          controller: ageController,
                          decoration:
                              const InputDecoration(hintText: "age"),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor: Colors.red),
                          child: const Text(
                            "Add Data",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                             var user=await Hive.openBox<UserModel>("user");

                            String name = nameController.text.trim().toString();
                            String age = ageController.text.trim().toString();
                            nameController.clear();
                            ageController.clear();

                            user.add(UserModel(age: age, title: name));

                            print("Added");

                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  )));
        },
        child: const Icon(Icons.add),
      ),
   
    );
  }
}

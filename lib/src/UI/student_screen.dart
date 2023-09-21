import 'package:flutter/material.dart';
import 'package:hive_database/src/core/models/student_model.dart';
import 'package:hive_flutter/hive_flutter.dart';


class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  TextEditingController fnameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: ValueListenableBuilder(
        valueListenable:Hive.box<StudentModel>("student").listenable(),
        builder: (context,box,_)
        {
          final keys=box.keys.toList();

          return ListView.builder(
            itemCount: keys.length,
            itemBuilder: (context,index)
            {
              final data= box.get(keys[index]);
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                child: ListTile(
                  leading: const CircleAvatar(
                    
                  ),
                  title: Text(data!.name.toString()),
                  subtitle:Text(data.age.toString()),
                  trailing: Text(data.fname.toString()),
                ),
              );

            },
          );
        },
      )),

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
                          decoration: const InputDecoration(hintText: "Enter name"),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          controller: ageController,
                          decoration:
                              const InputDecoration(hintText: "Enter age"),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          controller: addressController,
                          decoration:
                              const InputDecoration(hintText: "Enter Address"),
                        ),
                         const SizedBox(
                          height: 8,
                        ),
                        TextField(
                          controller: fnameController,
                          decoration:
                              const InputDecoration(hintText: "Enter Father name"),
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
                             var student=Hive.box<StudentModel>("student");

                            //  print(student.na)

                            String name = nameController.text.trim().toString();
                            String fname = fnameController.text.trim().toString();
                            String address = addressController.text.trim().toString();
                            int age = int.parse(ageController.text.trim().toString());
                            nameController.clear();
                            ageController.clear();
                            addressController.clear();
                            fnameController.clear();

                            student.add(StudentModel(address: address, age: age, fname: fname, name: name));

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
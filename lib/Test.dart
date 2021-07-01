import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Person {
  String name;
  int age;
  Person({required this.name, required this.age});
}

class _MyHomePageState extends State<MyHomePage> {
  String employeeName = '';
  int employeeAge = 0;
  List<Person> employee = [];

  final _formKey = GlobalKey<FormState>();
  final nameFieldController = new TextEditingController();
  final ageFieldController = new TextEditingController();

  _MyHomePageState() {
    this.employee = [
      new Person(name: "Dicka", age: 19),
      new Person(name: "Andi", age: 19),
      new Person(name: "Danang", age: 25),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: new EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Please input your employee"),
              Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameFieldController,
                            validator: (value) {
                              if (value == null) return 'Empty';
                              if (value == '' || value.isEmpty)
                                return 'Name should filled';

                              return null;
                            },
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "Employee Name"),
                            onChanged: (text) {
                              setState(() {
                                employeeName = text;
                              });
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: ageFieldController,
                            validator: (value) {
                              if (value == '' || value!.isEmpty)
                                return 'Age should filled';

                              return null;
                            },
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "Employee Age"),
                            onChanged: (text) {
                              setState(() {
                                employeeAge = int.parse(text);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            this.employee.add(new Person(
                                name: employeeName, age: employeeAge));
                          });

                          ageFieldController.text = '';
                          nameFieldController.text = '';

                          // Show snackbar on bottom
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Employee has been added")));
                        }
                      },
                      child: Text('Add employee'),
                    )
                  ])),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final item = employee[index];

                      return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.age.toString()));
                    },
                    itemCount: this.employee.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

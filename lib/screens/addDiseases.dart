import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/components/button_com.dart';
import 'package:flutter_application_1/components/textField_com.dart';

class AddDiseases extends StatefulWidget {
  @override
  State<AddDiseases> createState() => _AddDiseasesState();
}

class _AddDiseasesState extends State<AddDiseases> {
  //const AddEscortInfo({super.key});
  TextEditingController IdDiseaseController = TextEditingController();
  TextEditingController NameDiseaseController = TextEditingController();
  TextEditingController DiscribtionDiseaseController = TextEditingController();
  TextEditingController CommonSymptomsController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/Add Diseases.png'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            key: formKey,
            child: ListView(children: [
              const SizedBox(
                height: 130,
              ),
              TextFieldComponent(
                controlleR: IdDiseaseController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Id Disease';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Id Disease';
                  }
                  return null;
                },
                labelText: 'Disease ID',
                inputType: TextInputType.number,
                preIcon: Icons.numbers,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: NameDiseaseController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Disease Name';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Disease Name';
                  }
                  return null;
                },
                labelText: 'Disease Name',
                inputType: TextInputType.name,
                preIcon: Icons.verified,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: DiscribtionDiseaseController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter DiscribtionDisease ';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Discribtion Disease';
                  }
                  return null;
                },
                labelText: 'Disease Discribtion',
                inputType: TextInputType.name,
                preIcon: Icons.description,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldComponent(
                controlleR: CommonSymptomsController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Common Symptoms';
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    'Enter Valid Common Symptoms';
                  }
                  return null;
                },
                labelText: 'Common Symptoms',
                inputType: TextInputType.name,
                preIcon: Icons.description,
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonComponent(
                () {
                  if (formKey.currentState!.validate()) {
                    print('Go to next step success');
                    print(IdDiseaseController.text);
                    print(NameDiseaseController.text);
                    print(DiscribtionDiseaseController.text);
                    print(CommonSymptomsController.text);
                    // Navigator.push(context,
                    // MaterialPageRoute(builder: ((context) {
                    // return AddScreen();
                    // })));
                  }
                },
                buttonName: 'Add',
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'))
            ]),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ligmone/homePage.dart';
import 'package:ligmone/screens/bottomNavigation.dart';

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];

class ApplicationForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppScreenMode();
  }
}

class MyData {
  String name = '';
  String phone = '';
  String email = '';
  String age = '';
  String uploaddoc = '';
}

class MyAppScreenMode extends State<ApplicationForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Ligmone'),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BottomNavigationMenu(),
                  ),
                );
              })),
      body: StepperBody(),
    );
    //  child: Positioned(
    //             top: 0.0,
    //             left: 0.0,
    //             right: 0.0,
    //             child: AppBar(
    //               title: Text(''),// You can add title here
    //               leading: new IconButton(
    //                 icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
    //                 onPressed: () => Navigator.of(context).pop(),
    //               ),
    //               backgroundColor: Colors.blue.withOpacity(0.3), //You can make this transparent
    //               elevation: 0.0, //No shadow
    //             ),),
  }
}

class StepperBody extends StatefulWidget {
  @override
  _StepperBodyState createState() => _StepperBodyState();
}

class _StepperBodyState extends State<StepperBody> {
  int currStep = 0;
  static var _focusNode = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static MyData data = MyData();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
      print('Has focus: $_focusNode.hasFocus');
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  List<Step> steps = [
    Step(
        title: const Text('Loan Information'),
        //subtitle: const Text('Enter your name'),
        isActive: true,
        //state: StepState.error,
        state: StepState.indexed,
        content: Form(
          key: formKeys[0],
          child: Column(
            children: <Widget>[
              TextFormField(
                focusNode: _focusNode,
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String value) {
                  data.name = value;
                },
                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'Please enter name';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Enter your name',
                    hintText: 'Enter a name',
                    //filled: true,
                    icon: const Icon(Icons.person),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ],
          ),
        )),
    Step(
        title: const Text('Personal Information'),
        //subtitle: const Text('Subtitle'),
        isActive: true,
        //state: StepState.editing,
        state: StepState.indexed,
        content: Form(
          key: formKeys[1],
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.phone,
                autocorrect: false,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty || value.length < 10) {
                    return 'Please enter valid number';
                  }
                },
                onSaved: (String value) {
                  data.phone = value;
                },
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: 'Enter your number',
                    hintText: 'Enter a number',
                    icon: const Icon(Icons.phone),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ],
          ),
        )),
    Step(
        title: const Text('Security Information'),
        // subtitle: const Text('Subtitle'),
        isActive: true,
        state: StepState.indexed,
        // state: StepState.disabled,
        content: Form(
          key: formKeys[2],
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Please enter valid email';
                  }
                },
                onSaved: (String value) {
                  data.email = value;
                },
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: 'Enter your email',
                    hintText: 'Enter a email address',
                    icon: const Icon(Icons.email),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ],
          ),
        )),
    Step(
        title: const Text('Upload Documents'),
        // subtitle: const Text('Subtitle'),
        isActive: true,
        state: StepState.indexed,
        // state: StepState.disabled,
        content: Form(
          key: formKeys[3],
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return 'Please enter add all Documents';
                  }
                },
                onSaved: (String value) {
                  data.email = value;
                },
                maxLines: 1,
                decoration: InputDecoration(
                    labelText: 'Enter your email',
                    hintText: 'Enter a email address',
                    icon: const Icon(Icons.email),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ],
          ),
        )),
    Step(
        title: const Text('Confirm and Submit'),
        // subtitle: const Text('Subtitle'),
        isActive: true,
        state: StepState.indexed,
        content: Form(
          key: formKeys[4],
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                autocorrect: false,
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty || value.length > 2) {
                    return 'Please enter valid age';
                  }
                },
                maxLines: 1,
                onSaved: (String value) {
                  data.age = value;
                },
                decoration: InputDecoration(
                    labelText: 'Enter your age',
                    hintText: 'Enter age',
                    icon: const Icon(Icons.explicit),
                    labelStyle:
                        TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ],
          ),
        )),
    //  Step(
    //     title: const Text('Fifth Step'),
    //     subtitle: const Text('Subtitle'),
    //     isActive: true,
    //     state: StepState.complete,
    //     content: const Text('Enjoy Step Fifth'))
  ];

  @override
  Widget build(BuildContext context) {
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
    }

    void _submitDetails() {
      final FormState formState = _formKey.currentState;

      if (!formState.validate()) {
        showSnackBarMessage('Please enter correct data');
      } else {
        formState.save();
        print("Name: ${data.name}");
        print("Phone: ${data.phone}");
        print("Email: ${data.email}");
        print("Age: ${data.age}");

        showDialog(
            context: context,
            child: AlertDialog(
              title: Text("Details"),
              //content:  Text("Hello World"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("Name : " + data.name),
                    Text("Phone : " + data.phone),
                    Text("Email : " + data.email),
                    Text("Age : " + data.age),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
      }
    }

    return Container(
        child: ListView(children: <Widget>[
      Stepper(
        steps: steps,
        type: StepperType.vertical,
        currentStep: this.currStep,
        onStepContinue: () {
          setState(() {
            if (formKeys[currStep].currentState.validate()) {
              if (currStep < steps.length - 1) {
                currStep = currStep + 1;
              } else {
                currStep = 0;
              }
            }
            // else {
            // Scaffold
            //     .of(context)
            //     .showSnackBar( SnackBar(content:  Text('$currStep')));

            // if (currStep == 1) {
            //   print('First Step');
            //   print('object' + FocusScope.of(context).toStringDeep());
            // }

            // }
          });
        },
        onStepCancel: () {
          setState(() {
            if (currStep > 0) {
              currStep = currStep - 1;
            } else {
              currStep = 0;
            }
          });
        },
        onStepTapped: (step) {
          setState(() {
            currStep = step;
          });
        },
      ),
      RaisedButton(
        child: Text(
          'Save details',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: _submitDetails,
        color: Colors.blue,
      ),
    ]));
  }
}

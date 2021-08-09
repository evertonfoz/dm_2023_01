import 'package:flutter/material.dart';

class UsandoStepper extends StatefulWidget {
  UsandoStepper() : super();

  final String title = "Widget Stepper";

  @override
  _UsandoStepperState createState() => new _UsandoStepperState();
}

class _UsandoStepperState extends State<UsandoStepper> {
  int currentStep = 0;
  List<Step> steps = [
    Step(
      title: Text('Step 1'),
      content: Text('Olá!!'),
      isActive: true,
    ),
    Step(
      title: Text('Step 2'),
      content: Text('Mundo!!'),
      isActive: true,
    ),
    Step(
      title: Text('Step 3'),
      content: Text('Olá Mundo!!'),
      state: StepState.complete,
      isActive: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Stepper"),
      ),
      body: Container(
        child: Stepper(
          currentStep: this.currentStep,
          steps: steps,
          type: StepperType.vertical,
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (currentStep < steps.length - 1) {
                currentStep = currentStep + 1;
              } else {
                currentStep = 0;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (currentStep > 0) {
                currentStep = currentStep - 1;
              } else {
                currentStep = 0;
              }
            });
          },
        ),
      ),
    );
  }
}

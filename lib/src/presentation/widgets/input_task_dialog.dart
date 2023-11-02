import 'package:flutter/material.dart';

class InputTaskDialog extends StatefulWidget {
  final Function(String taskName)? tappedSave;

  const InputTaskDialog({Key? key, this.tappedSave}) : super(key: key);

  @override
  State<InputTaskDialog> createState() => _InputTaskDialogState();
}

class _InputTaskDialogState extends State<InputTaskDialog> {
  final TextEditingController _textEditingController = TextEditingController();
  bool isErrorText = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                key: const Key('Textfield-input'),
                controller: _textEditingController,
                decoration: InputDecoration(
                  errorText: isErrorText ? 'Please Input Task Name' : null,
                  labelText: 'Input Task Name',
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                  // hintText: 'Input Task Name'
                ),
              ),
              const SizedBox(height: 20),
              Container(
                key: const Key('Button-Input'),
                width: 320.0,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.tappedSave != null) {
                      if (_textEditingController.text.trim().isEmpty == false) {
                        widget.tappedSave!(_textEditingController.text);
                        isErrorText = false;
                        Navigator.pop(context);
                      } else {
                        setState(() {
                          isErrorText = true;
                        });
                      }
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

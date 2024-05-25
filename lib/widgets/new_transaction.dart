import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({super.key, required this.addTx});
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => submitData(),
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              decoration: const InputDecoration(labelText: 'Amount'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
              onPressed: submitData,
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTransactionHandler;
  TransactionList(this.transaction,this.deleteTransactionHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: transaction.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transaction added yet!'),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : Container(
              height: 230,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      child: Row(
                    children: <Widget>[
                      Container(
                        width: 70,
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          '\$${transaction[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transaction[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          Text(
                            DateFormat.yMMMd().format(transaction[index].date),
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () => deleteTransactionHandler(transaction[index].id),
                      ),
                    ],
                  ));
                },
                itemCount: transaction.length,
              )),
    );
  }
}

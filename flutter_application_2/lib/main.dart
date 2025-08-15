import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(MaterialApp(home: QuoteList()));
}

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quoteList = [
    Quote(
      text: 'Be yourself; everyone else is already taken',
      author: 'Osca Wilde',
    ),
    Quote(
      text: 'You have nothing to declare except your genius',
      author: 'Osca Wilde',
    ),
    Quote(
      text: 'The truth is rarely pure and never simple',
      author: 'Osca Wilde',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Quotes', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quoteList.map((quote) => QuoteCard(
          quote: quote,
          delete: ()
          {
            setState(() {
              quoteList.remove(quote);
            });
          }
        )).toList(),
      ),
    );
  }
}
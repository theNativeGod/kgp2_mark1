import 'package:flutter/material.dart';
import 'package:kgp2_mark1/models/script.dart';
import 'package:provider/provider.dart';

class ProfanityScreen extends StatelessWidget {
  ProfanityScreen({super.key});

  String? str;
  List<String>? prof;
  String? censoredText;

  @override
  Widget build(BuildContext context) {
    final _pageProvider = Provider.of<Script>(context);
    final prof = _pageProvider.prof;
    final censoredText = _pageProvider.censoredText;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Text Profanity'),
            centerTitle: true,
          ),
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Type Something Here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                    onChanged: (value) {
                      _pageProvider.str(value);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Profanity:',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  //profanityList
                  prof == null
                      ? Container()
                      : Wrap(
                          children: [
                            ...prof.map((e) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                margin: const EdgeInsets.all(5),
                                child: Text(
                                  e,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList()
                          ],
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Censored Text:',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 40,
                      )),
                  const SizedBox(
                    height: 10,
                  ),

                  //CensoredText
                  censoredText == null
                      ? Container()
                      : Text(censoredText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.indigo,
                            fontSize: 25,
                          )),
                ],
              ),
            ),
          )),
    );
  }
}

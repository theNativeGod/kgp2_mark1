import 'package:flutter/material.dart';
import 'package:kgp2_mark1/models/photo.dart';
import 'package:provider/provider.dart';

class NudityScreen extends StatelessWidget {
  NudityScreen({super.key});

  TextEditingController? checkController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final _pageProvider = Provider.of<Photo>(context);
    loading = _pageProvider.loading;
    final nudity = _pageProvider.nudity;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nudity Detection'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  TextField(
                    controller: checkController,
                    decoration: InputDecoration(
                      hintText: 'Enter Image URL Here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //onPressed
                      if (checkController!.text != '') {
                        _pageProvider.setImageUrl(checkController!.text);
                        _pageProvider.nudityCheck(checkController!.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
                    child: const Text(
                      'CHECK',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: MediaQuery.of(context).size.height * .4,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(21),
                    ),
                    alignment: Alignment.center,
                    child: loading == true
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : nudity == null
                            ? Container()
                            : nudity == true
                                ? const Text(
                                    'Contains Nudity',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : checkController!.text == ''
                                    ? Container()
                                    : Image.network(checkController!.text),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}

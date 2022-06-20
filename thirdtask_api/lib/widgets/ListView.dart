import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thirdtask_api/providers/provider.dart';
import 'package:thirdtask_api/models/university.dart';
import 'package:thirdtask_api/viewModel/utils.dart';
import 'package:thirdtask_api/widgets/DropDown.dart';
import 'package:flutter/gestures.dart';

class ListViewWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size deviceSize = MediaQuery.of(context).size;
    AsyncValue<List<University>> list_university =
        ref.watch(universityStateFuture);

    return list_university.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stackTrace) => Text("Error..."),
        data: (list_university) {
          return Container(
            height: deviceSize.height - 200,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: list_university.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //height: 90,
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    width: deviceSize.width,
                    margin: EdgeInsets.all(2),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey),
                      color: Colors.white,
                    ),
                    child: Wrap(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${list_university[index].name} ',
                                style: GoogleFonts.pacifico(fontSize: 20),
                              ),
                              Text(
                                  ' Country - ${list_university[index].country} ',
                                  style: TextStyle(fontSize: 18)),
                              if (list_university[index].stateProvince !=
                                  null) ...[
                                Text(
                                  ' State - ${list_university[index].stateProvince} ',
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                              RichText(
                                  text: TextSpan(
                                      text:
                                          '${list_university[index].webPages?.elementAt(0)}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 132, 18, 10),
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Utils.openLink(
                                              url:
                                                  '${list_university[index].webPages?.elementAt(0)}');
                                        })),
                            ]),
                      )
                    ]),
                  );
                }),
          );
        });
  }
}

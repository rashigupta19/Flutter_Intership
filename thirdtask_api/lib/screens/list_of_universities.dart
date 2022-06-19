import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thirdtask_api/providers/provider.dart';
import 'package:thirdtask_api/models/university.dart';

import '../widgets/list_view_widget.dart';

class ListOfUniversities extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size deviceSize = MediaQuery.of(context).size;
    AsyncValue<List<University>> list_university =
        ref.watch(universityStateFuture);

    return Scaffold(
        appBar: AppBar(title: Text("Universities")),
        body: list_university.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, stackTrace) => Text("Error..."),
            data: (list_university) {
              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 90,
                      width: deviceSize.width,
                      margin: EdgeInsets.all(2),
                      color: Color.fromARGB(255, 193, 216, 234),
                      child: Row(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${list_university[index].name} ',
                                style: GoogleFonts.pacifico(fontSize: 18),
                              ),
                              Text(' ${list_university[index].country} ',
                                  style: TextStyle(fontSize: 18)),
                              Text(
                                ' ${list_university[index].stateProvince} ',
                                style: TextStyle(fontSize: 18),
                              )
                            ])
                      ]),
                    );
                  });
            }));
  }
}

import 'package:flutter/material.dart';
import 'package:project1/NoteApp/UpdateNote.dart';

class NoteCardWidget extends StatelessWidget {
  const NoteCardWidget({
    Key? key,
    required this.i,
    required this.data,
  }) : super(key: key);
  final int i;

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        height: 200,
        width: MediaQuery.sizeOf(context).width / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
                  "${data["Create_at"].toString().substring(0, 16)}",
                  style: TextStyle(color: Colors.grey),
                )),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${data["note"]}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  maxLines: 10,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 15,
                    child: Text("${i}"),
                  ),
                  InkWell(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditScren(
                                  Create_at: data["Create_at"],
                                  note: data["note"],
                                  index: i ?? 0,
                                )));
                      },
                      child: Icon(
                        Icons.edit,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

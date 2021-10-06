import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  const Second({Key? key}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  TextEditingController t1 = TextEditingController();
  List mesajListesi = [];

  mesajlariEkle(String metin) {
    setState(() {
      mesajListesi.insert(0, metin);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: mesajListesi.length,
              itemBuilder: (context, indeksNumarasi) =>
                  Text(mesajListesi[indeksNumarasi]),
            ),
          ),
          Row(
            children: [
              Flexible(
                child: TextField(
                    onSubmitted: mesajlariEkle,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    )),
                    controller: t1),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  primary: Colors.red,
                ),
                onPressed: mesajlariEkle(t1.text),
                child: const Text('Gönder'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

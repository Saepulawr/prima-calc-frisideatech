import 'package:calc_frisidea/module/provider/PrimaProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

class PrimaScreen extends StatelessWidget {
  const PrimaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> thisPrima = Provider.of<PrimaProvider>(context).prima;
    return Scaffold(
      body: thisPrima.length == 0
          ? Center(
              child: Text("Tidak ada data"),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Bilangan Prima Dari ${Provider.of<PrimaProvider>(context).angkaAwal} sampai ${Provider.of<PrimaProvider>(context).angkaAkhir}"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(thisPrima[index].toString()),
                          ),
                        );
                      },
                      itemCount: thisPrima.length,
                    ),
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final text = await showTextInputDialog(
            context: context,
            style: AdaptiveStyle.cupertino,
            textFields: const [
              DialogTextField(
                  hintText: 'Angka Awal',
                  initialText: '2',
                  keyboardType: TextInputType.number),
              DialogTextField(
                  hintText: 'Angka Akhir',
                  initialText: '2',
                  keyboardType: TextInputType.number),
            ],
            title: 'Mencari Bilangan Prima',
            message: 'Masukan Angka Awal Dan Akhir',
          );
          if (text != null) {
            if (text.length == 2) {
              //process
              _cariBilanganPrima(
                  context, int.tryParse(text[0])!, int.tryParse(text[1])!);
            } else {
              //isian kurang
            }
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _cariBilanganPrima(BuildContext context, int awal, int akhir) {
    Provider.of<PrimaProvider>(context, listen: false).clearPrima();
    Provider.of<PrimaProvider>(context, listen: false).setAngkaAwal(awal);
    Provider.of<PrimaProvider>(context, listen: false).setAngkaAkhir(akhir);
    for (int i = awal; i <= akhir; i++) {
      if (isPrime(i))
        Provider.of<PrimaProvider>(context, listen: false).addPrima(i);
    }
  }

  bool isPrime(int num) {
    if (num < 2) return false;
    for (int k = 2; k < num; k++) {
      if (num % k == 0) {
        return false;
      }
    }
    return true;
  }
}

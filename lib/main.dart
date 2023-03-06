import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  String resultadoIMC = '';
  //String textoPeso = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Entre com seus dados',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextFormField(
                //onChanged: (value) {
                //textoPeso = value;
                //},
                keyboardType: const TextInputType.numberWithOptions(),
                controller: controllerPeso,
                decoration: const InputDecoration(
                    labelText: "Peso(kg)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextFormField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: controllerAltura,
                decoration: const InputDecoration(
                    labelText: "Altura(cm)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              resultadoIMC,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
                width: 200,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        num numAux = (num.parse(controllerPeso.text) /
                            (num.parse(controllerAltura.text) *
                                num.parse(controllerAltura.text)));

                        resultadoIMC = numAux.toStringAsFixed(2);
                      });
                    },
                    child: const Text('Calcular')))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$contador',
              style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w200,
                  color: Colors.indigo),
            ),
            Text(
              (contador == 1 ? 'clic' : 'clics'),
              style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w100,
                  color: Colors.black38),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            onPressed: () {
              setState(() {
                contador++;
              });
            },
            icono: Icons.add,
          ),
          const SizedBox(height: 10),
          CustomButton(
            onPressed: () {
              setState(() {
                contador != 0 ? contador-- : null;
              });
            },
            icono: Icons.remove,
          ),
          const SizedBox(height: 10),
          CustomButton(
            icono: Icons.refresh,
            onPressed: () {
              setState(() {
                contador = 0;
              });
            },
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icono;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.icono, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: onPressed, child: Icon(icono));
  }
}

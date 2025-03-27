import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:novomobile/donuts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu de Sorvete',
      debugShowCheckedModeBanner: false,
      home: IceCreamMenuScreen(),
    );
  }
}

class IceCreamMenuScreen extends StatefulWidget {
  const IceCreamMenuScreen({super.key});

  @override
  _IceCreamMenuScreenState createState() => _IceCreamMenuScreenState();
}

class _IceCreamMenuScreenState extends State<IceCreamMenuScreen> {
  int quantidadeSorvete = 0;
  final double precoPorSorvete = 10.0;

  void adicionarSorvete() {
    setState(() {
      quantidadeSorvete++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double valorTotal = quantidadeSorvete * precoPorSorvete;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 182, 193), // Cor rosa para o tema de sorvete
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Linha abaixo do retângulo
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.3, // Ajuste fino da posição
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 4, // Espessura do divisor
                      color: Colors.pink, // Cor rosa da linha
                    ),
                  ),
                  // Retângulo branco com "740cal" sobre a linha
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.28, // Ajuste para sobrepor corretamente
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white, // Mantendo o fundo branco
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.pink),
                      ),
                      child: Text(
                        '740cal',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  // Conteúdo principal
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Ícone principal de sorvete
                            Icon(
                              FontAwesomeIcons.iceCream, // Ícone de sorvete
                              size: 50,
                              color: Colors.pink,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Sorvete',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Delicioso!',
                              style: TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            SizedBox(height: 40), // Espaço para o "740cal" encaixar corretamente
                          ],
                        ),
                      ),
                      // Ícones na parte inferior (Leite, Baunilha, Casquinha, Chocolate)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(FontAwesomeIcons.coffee, size: 30, color: Colors.pink), // Baunilha
                          Icon(FontAwesomeIcons.iceCream, size: 30, color: Colors.pink), // Casquinha
                          Icon(FontAwesomeIcons.cookie, size: 30, color: Colors.pink), // Chocolate
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Botão para adicionar sorvete e valor total logo abaixo do container
            ElevatedButton(
              onPressed: adicionarSorvete,
              child: Text('Adicionar Sorvete'),
              style: ElevatedButton.styleFrom(
               
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
            ),
            SizedBox(height: 20),
            // Exibir o valor total
            Text(
              'Valor total: R\$${valorTotal.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      // Botão para redirecionar para a página Donuts
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DonutMenuScreen()),
          );
        },
        backgroundColor: Colors.pink, // Cor rosa do botão
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

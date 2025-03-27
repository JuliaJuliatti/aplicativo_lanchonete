import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:novomobile/main.dart'; // Ajuste o caminho conforme necessário

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu de Donuts',
      debugShowCheckedModeBanner: false,
      home: DonutMenuScreen(),
    );
  }
}

class DonutMenuScreen extends StatefulWidget {
  const DonutMenuScreen({super.key});

  @override
  _DonutMenuScreenState createState() => _DonutMenuScreenState();
}

class _DonutMenuScreenState extends State<DonutMenuScreen> {
  int quantidadeDonuts = 0;
  final double precoPorDonut = 5.0;

  void adicionarDonut() {
    setState(() {
      quantidadeDonuts++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double valorTotal = quantidadeDonuts * precoPorDonut;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 223, 0), // Cor amarela para o tema de donuts
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
                      color: Colors.amber, // Cor da linha
                    ),
                  ),
                  // Retângulo branco com "Donut" sobre a linha
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.28, // Ajuste para sobrepor corretamente
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white, // Mantendo o fundo branco
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.amber),
                      ),
                      child: Text(
                        '380cal',
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
                            Image.asset(
                              'assets/images/rosquinha.png', // Caminho da sua imagem
                              width: 60,  // Definindo a largura da imagem
                              height: 60, // Definindo a altura da imagem
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Donut',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Delicioso!',
                              style: TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            SizedBox(height: 40), // Espaço para o "Donut" encaixar corretamente
                          ],
                        ),
                      ),
                      // Ícones na parte inferior (temática de Donut)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(FontAwesomeIcons.breadSlice, size: 30, color: Colors.amber), // Farinha
                          Icon(FontAwesomeIcons.iceCream, size: 30, color: Colors.amber), // Morango
                          Icon(FontAwesomeIcons.mugHot, size: 30, color: Colors.amber), // Leite
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Botão para adicionar donuts e valor total logo abaixo do container
            ElevatedButton(
              onPressed: adicionarDonut,
              child: Text('Adicionar Donut'),
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
      // Botão para redirecionar para a página de Hambúrguer
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BurgerMenuScreen()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

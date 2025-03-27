import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:novomobile/sorvete.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu de Hambúrguer',
      debugShowCheckedModeBanner: false,
      home: BurgerMenuScreen(),
    );
  }
}

class BurgerMenuScreen extends StatefulWidget {
  const BurgerMenuScreen({super.key});

  @override
  _BurgerMenuScreenState createState() => _BurgerMenuScreenState();
}

class _BurgerMenuScreenState extends State<BurgerMenuScreen> {
  int quantidadeBurguer = 0;
  final double precoPorBurguer = 12.0;

  void adicionarBurguer() {
    setState(() {
      quantidadeBurguer++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double valorTotal = quantidadeBurguer * precoPorBurguer;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 170, 49),
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
                      color: Colors.orange, // Cor da linha
                    ),
                  ),
                  // Retângulo branco com "500cal" sobre a linha
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.28, // Ajuste para sobrepor corretamente
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white, // Mantendo o fundo branco
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.orange),
                      ),
                      child: Text(
                        '500cal',
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
                            Icon(
                              FontAwesomeIcons.hamburger,
                              size: 50,
                              color: Colors.orange,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Burguer',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Mc Donald’s',
                              style: TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            SizedBox(height: 40), // Espaço para o "500cal" encaixar corretamente
                          ],
                        ),
                      ),
                      // Ícones na parte inferior
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(FontAwesomeIcons.breadSlice, size: 30, color: Colors.orange),
                          Icon(FontAwesomeIcons.bacon, size: 30, color: Colors.orange),
                          Icon(FontAwesomeIcons.leaf, size: 30, color: Colors.orange),
                          Icon(FontAwesomeIcons.cheese, size: 30, color: Colors.orange),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Botão para adicionar hambúrguer e valor total logo abaixo do container
            ElevatedButton(
              onPressed: adicionarBurguer,
              child: Text('Adicionar Hambúrguer'),
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
        // Adicionando o botão para redirecionar para a página Donuts
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Redireciona para a página de Donuts
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IceCreamMenuScreen()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

import 'package:aula_flutter/models/moeda.dart';

class MoedaRepository{
  static List<Moeda> tabela = [
    Moeda(
      icone: 'images/icon1.png',
      nome: 'BitCoin',
      sigla:'BTC',
      preco: 164603.00
    ),
    Moeda(
      icone: 'images/icon2.png',
      nome: 'Ethereum',
      sigla:'ETH',
      preco: 9716.00
    ),
    Moeda(
      icone: 'images/icon3.png',
      nome: 'XRP',
      sigla:'XRP',
      preco: 3.34
    ),
    Moeda(
      icone: 'images/icon4.png',
      nome: 'Cardano',
      sigla:'ADA',
      preco: 6.32
    ),
    Moeda(
      icone: 'images/icon5.png',
      nome: 'Litecoin',
      sigla:'LTC',
      preco: 669.93
    ),
  ];
}
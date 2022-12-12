import 'package:aula_flutter/models/moeda.dart';
import 'package:aula_flutter/pages/moedas_detalhes_page.dart';
import 'package:aula_flutter/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR',name: 'R\$');
  List<Moeda> moedasSelecionadas = [];

  appBarDinamica(){
    if (moedasSelecionadas.isEmpty) {
      return AppBar(
            title: const Center(
              child: Text('Cripto Moedas'),
            ),
          );
    } else {
      return AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: (){
                setState(() {
                  moedasSelecionadas = [];
                });
              },
            ),
            title: Center(
              child: Text(
                  '${moedasSelecionadas.length} selecionadas',
                  style: const TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),
                  ),
            ),
            backgroundColor:Colors.blueGrey[50],
            elevation: 1,//Elevacao da sombra
            iconTheme: const IconThemeData(color: Colors.black87),
            
          );
    }
    
  }

  mostrarDetalhes(Moeda moedasSelecionadas){
    Navigator.push(
        context, MaterialPageRoute(
        builder: (_)=>MoedasDetalhesPage(moeda: moedasSelecionadas),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    
    //scaffold e uma widget que traz toda formatacao necessaria para criar um app
    return Scaffold(
      appBar: appBarDinamica(),
      //Lista as visualizacoes com separador
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index){
          //Lista as linhas da tabela
          return ListTile(
            //Bordas redondas
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            leading: //SizedBox(/*child:Image.asset(tabela[index].icone),width: 60,),*/ 
              (moedasSelecionadas.contains(tabela[index]))?
                const CircleAvatar(
                  child: Icon(Icons.check),
                )
                :Image.asset(tabela[index].icone, width: 50),
            title: Text(
              tabela[index].nome, style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(real.format(tabela[index].preco)),//Coloca texto ou icones a direita
            selected: moedasSelecionadas.contains(tabela[index]),
            selectedTileColor: Colors.indigo[50],
            onLongPress: (){
              setState(() {
                (moedasSelecionadas.contains(tabela[index]))?
                  moedasSelecionadas.remove(tabela[index]):
                  moedasSelecionadas.add(tabela[index]);
              });
          
              //print(moedasSelecionadas.length);
            },
            onTap: ()=> mostrarDetalhes(tabela[index]),
          );
        },
        //Espacamentos laterais dos itens da lista
        padding: const EdgeInsets.all(16), 
        separatorBuilder: (_,__)=>const Divider(), 
        itemCount: tabela.length,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: moedasSelecionadas.isNotEmpty?
        FloatingActionButton.extended(
          onPressed: (){},
          icon: const Icon(Icons.star),
          label: const Text(
            'Favoritar',
            style: TextStyle(
              letterSpacing: 0,
              fontWeight: FontWeight.bold
            ),
          )
        ):null,
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:lanchoneteapp/screens/produto_screen.dart';
// import 'package:lanchoneteapp/shared/model/produto_model.dart';

// import 'package:transparent_image/transparent_image.dart';
// import 'package:intl/intl.dart';

// /*
//   Widget responsável por representar um produto na tela da categoria
// */

// class ProdutoTile extends StatelessWidget {
//   final String type;
//   final Produto produto;
//   final BRL = new NumberFormat("#,##0.00", "pt_BR");
//   ProdutoTile(this.type, this.produto);
//   final Color cardBgColor = Colors.white;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).push(
//             MaterialPageRoute(builder: (context) => ProdutoScreen(produto)));
//       },
//       child: Card(
//         color: cardBgColor,

//         /// height: 150,
//         child: type == "grid" ? formatoGrid(context) : formatoLista(context),
//       ),
//     );
//   }

//   Widget formatoGrid(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         AspectRatio(
//           aspectRatio: 1.5, //.8
//           child: Container(
//             margin: EdgeInsets.all(5),
//             child: Image.network(
//               produto.imagens[0].urlImagem,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Expanded(
//           child: Container(
//             padding: EdgeInsets.all(8),
//             child: Column(
//               children: <Widget>[
//                 Text(
//                   produto.nome,
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 ),
//                 Text(
//                   //produto.valor.toStringAsFixed(2)
//                   "R\$ ${BRL.format(produto.valor)}",
//                   style: TextStyle(
//                       color: Theme.of(context).primaryColor,
//                       fontSize: 17,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   Widget formatoLista(BuildContext context) {
//     return Container(
//       height: 150,
//       decoration: BoxDecoration(color: Colors.white),
//       margin: EdgeInsets.only(bottom: 5, top: 5),
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           return Row(
//             children: <Widget>[
//               // DIV 1
//               Container(
//                 width: constraints.maxWidth * .7, // 280
//                 height: 150,
//                 color: cardBgColor,
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       height: 32,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Container(
//                             margin: EdgeInsets.only(left: 0, bottom: 0),
//                             child: Text(
//                               produto.nome,
//                               style: TextStyle(
//                                   fontSize: 28,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.grey),
//                               textAlign: TextAlign.center,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Container(
//                       height: 65,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           Container(
//                             width: constraints.maxWidth * .68, //270
//                             margin: EdgeInsets.only(left: 5, bottom: 0,),
//                             child: Text(
//                               produto.descricao,
//                               style: TextStyle(fontSize: 18),
//                               textAlign: TextAlign.justify,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     // Icons TOP, DESCONTO, PONTOS
//                     Container(
//                       margin: EdgeInsets.only(top: 10),
//                       height: 40,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Container(
//                             margin:
//                                 EdgeInsets.only(left: 5, right: 5, bottom: 0),
//                             width: 60,
//                             height: 20,
//                             decoration: BoxDecoration(
//                                 color: Colors.green,
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Center(
//                               child: Text(
//                                 "TOP",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin:
//                                 EdgeInsets.only(left: 5, right: 5, bottom: 0),
//                             width: 60,
//                             height: 20,
//                             decoration: BoxDecoration(
//                                 color: Colors.red,
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Center(
//                               child: Text(
//                                 "15%",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin:
//                                 EdgeInsets.only(left: 5, right: 5, bottom: 0),
//                             width: 60,
//                             height: 20,
//                             decoration: BoxDecoration(
//                                 color: Colors.blue,
//                                 borderRadius: BorderRadius.circular(15)),
//                             child: Center(
//                               child: Text(
//                                 "5pt",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                   child: Container(
//                 height: 150,
//                 //margin: EdgeInsets.only(right: 5, left: 5),
//                 decoration: BoxDecoration(color: cardBgColor),
//                 child: Column(
//                   children: <Widget>[
//                     //IMAGEM PRODUTO
//                     Container(
//                       margin: EdgeInsets.only(bottom: 18, right: 5, left: 5),
//                       height: 100,
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(18.0),
//                           child: FadeInImage.memoryNetwork(
//                             placeholder: kTransparentImage,
//                             image: produto.imagens[0].urlImagem,
//                             fit: BoxFit.fill,
//                           )),
//                     ),

//                     Center(
//                       child: Text(
//                         "R\$ ${BRL.format(produto.valor)}",
//                         style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.lightBlueAccent),
//                       ),
//                     )
//                   ],
//                 ),
//               ))
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

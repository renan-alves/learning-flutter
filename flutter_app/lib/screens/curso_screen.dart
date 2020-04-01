import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/models/curso_model.dart';
import 'package:flutterapp/repository/curso_repository.dart';

class CursoScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CursoScreen> {
  @override
  Widget build(BuildContext context) {

    List<CursoModel> lista = CursoRepository().findAll();

    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (ctx, index){
          return listTileCurso(lista[index]);
        }
    );
  }

  Card listTileCurso(CursoModel curso) {
    return Card(
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, .9),
        ),
        child: ListTile(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),
              ),
            ),
            child: Icon(
              Icons.autorenew,
              color: Colors.white,
            ),
          ),
          title: Text(
            curso.nome,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: curso.percentualConclusao,
                    valueColor: AlwaysStoppedAnimation(Colors.green),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    curso.nivel,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () {
            print('Navegar');
          },
        ),
      ),
    );
  }
}

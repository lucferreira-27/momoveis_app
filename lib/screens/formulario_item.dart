import 'package:app_momoveis/components/campo_formulario.dart';
import 'package:app_momoveis/model/dao/item_dao.dart';
import 'package:app_momoveis/model/grupo.dart';
import 'package:app_momoveis/model/item.dart';
import 'package:flutter/material.dart';

const String _appBarTitle = "Formulario";
const String _titulo = "Registrar Item";
const String _lblNome = "Nome";
const String _lblResponsavel = "Responsável";
const String _btnRegistrar = "Registrar";
const String _msgSucesso = "Item registrado com sucesso";

class FormularioItem extends StatefulWidget {
  @override
  _FormularioItemState createState() => _FormularioItemState();
}

enum ItemTamanho { pequeno, medio, grande }

class _FormularioItemState extends State<FormularioItem> {


  ItemTamanho _tamanho = ItemTamanho.medio;
  bool _checkedValue = false;
  final TextEditingController _controllerItemNome = new TextEditingController();
  final TextEditingController _controllerResponsavelNome =
      new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text(_appBarTitle),
        ),
        backgroundColor: Color.fromRGBO(38, 50, 56, 1),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                       _titulo,
                        style: TextStyle(fontSize: 34, color: Colors.white),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(30),
                ),
                CampoFormulario(
                  label: _lblNome,
                  controller: _controllerItemNome,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _criarRadioButtonTamanho(
                        "Pequeno", ItemTamanho.pequeno, 200, 0),
                    _criarCheckBoxNovo("Novo")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _criarRadioButtonTamanho(
                        "Médio", ItemTamanho.medio, 180, 200),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _criarRadioButtonTamanho(
                        "Grande", ItemTamanho.grande, 180, 200),
                  ],
                ),
                CampoFormulario(
                  label: _lblResponsavel,
                  controller: _controllerResponsavelNome,
                ),
                SizedBox(
                    width: 375,
                    height: 62,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(38, 50, 56, 1)),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.only(top: 10)),
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 25)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: BorderSide(color: Colors.white)))),
                        child: Text(_btnRegistrar),
                        onPressed: () => _registrar(context))),
              ],
            )));
  }

  _registrar(BuildContext context) {
    if (_formKey.currentState.validate()) {
      final snackBar = SnackBar(
        content: Text(_msgSucesso),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);



      String nome = _controllerItemNome.text;
      String responsavel = _controllerResponsavelNome.text;
      ItemTamanho tamanho = _tamanho;
      bool novo = _checkedValue;

      ItemDao item = new ItemDao(nome, responsavel, tamanho.toString().split('.').last, novo);
      Navigator.pop(context, item);
    }
  }

  _criarRadioButtonTamanho(
      String title, ItemTamanho tamanho, double width, double margin) {
    return Container(
        margin: EdgeInsets.only(right: margin),
        width: width,
        child: RadioListTile<ItemTamanho>(
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          activeColor: Colors.white,
          value: tamanho,
          groupValue: _tamanho,
          onChanged: (ItemTamanho value) {
            setState(() {
              _tamanho = value;
            });
          },
        ));
  }

  _criarCheckBoxNovo(String title) {
    return Container(
        width: 180,
        child: CheckboxListTile(
          title: Text(title),
          value: _checkedValue,
          onChanged: (newValue) {
            setState(() {
              _checkedValue = newValue;
            });
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        ));
  }
}

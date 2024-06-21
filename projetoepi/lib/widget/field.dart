import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projetoepi/style/colors.dart';

Widget customTextField(
  {
    String? title,
    String? hint,
    TextEditingController? controller,
    int? maxLines = 1,
    bool? obscure = false,
    TextInputType? tipo = TextInputType.text, void Function(String)? funcao, List<TextInputFormatter>? formatacao
}){
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: black,
          )
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: yellow,
        ),
        child: TextFormField(
          keyboardType: tipo,
          controller: controller,
          maxLines: maxLines,
          obscureText: obscure!,
          decoration: InputDecoration(hintText: hint, border: InputBorder.none),
          onChanged: funcao, 
          inputFormatters: formatacao,
          validator: (value) {
            if (value == null ||  value.isEmpty) {
              return  '* Preencha o campo';
            }
            return null;
          }
        ),
      )
    ],
  );
}
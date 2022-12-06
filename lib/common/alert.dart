import 'package:agenda_proautismo/common/widgets/btn.dart';
import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

import 'package:provider/provider.dart';

class Alert {
  static Future<void> alert(
      BuildContext context,
      String message,
      {
        Fun? ok,
        String okMsg = "Aceptar",
        Fun? cancel,
        String cancelMsg = "Cancelar",
        String? title
      } ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: title != null ? Text(title) : null,

          content : Row(
            children: <Widget>[

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,16.0,8.0,16.0),
                  child: Text(
                    message,
                    style: TextStyle(
                        fontSize: 16.0,

                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),

            ],
          ),
          actions: <Widget>[

            if(cancel != null) Btn(
              text: cancelMsg,
              onPressed: (){
                cancel.call();
                Navigator.pop(context);
              },

            ),
            Btn(
                text: okMsg,
                onPressed: (){
                  Navigator.pop(context);
                  ok?.call();

                },
                primary:true
            ),
          ],
        );
      },
    );
  }

  static void snackBarMsg(BuildContext context, String msg, {String? title,int millis=3000,String? titleButton,Fun? function}){
    if(msg.isEmpty){
      return;
    }
    if(titleButton != null &&  titleButton!='' )
    {
      Flushbar(
        flushbarStyle: FlushbarStyle.GROUNDED,
        flushbarPosition: FlushbarPosition.BOTTOM,
        title: title,
        message: msg,
        duration:  Duration(milliseconds: millis),
        mainButton: TextButton(
          onPressed: function,
          child: Text(
            titleButton,

          ),
        ),
      ).show(context);

    }else{
      Flushbar(
        flushbarStyle: FlushbarStyle.GROUNDED,
        flushbarPosition: FlushbarPosition.BOTTOM,
        title: title,
        message: msg,
        duration:  Duration(milliseconds: millis),
      ).show(context);

    }
  }

  static void snackBarMsgTop(BuildContext context,String msg,{String? title,int millis=3000,String? titleButton,Fun? function}){

    if(titleButton != null &&  titleButton!='' )
    {

      Flushbar(
        flushbarStyle: FlushbarStyle.GROUNDED,
        flushbarPosition: FlushbarPosition.TOP,
        title: title,
        message: msg,
        duration:  Duration(milliseconds: millis),
        mainButton: TextButton(
          onPressed: function,
          child: Text(
            titleButton,

          ),
        ),

      ).show(context);
    }else{
      Flushbar(
        flushbarStyle: FlushbarStyle.GROUNDED,
        flushbarPosition: FlushbarPosition.TOP,
        title: title,
        message: msg,
        duration:  Duration(milliseconds: millis),


      ).show(context);

    }


  }
}



import 'package:chat/helpers/mostrar_alerta.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/widgets/boton_azul.dart';
import 'package:flutter/material.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(
                  titulo: 'Registro',
                ),
                _Form(),
                Labels(
                  ruta: 'login',
                  textoPregunta: '¿Ya tienes cuenta?',
                  textoNegrita: 'Accede ahora',
                ),
                Text(
                  'Terminas y condiciones de uso',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            textController: nameCtrl,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),
          BotonAzul(
            texto: 'Crear cuenta',
            onPressed: authService.autenticando
                ? () => {}
                : () async {
                    FocusScope.of(context).unfocus();

                    final registroOk = await authService.register(
                        nameCtrl.text.trim(),
                        emailCtrl.text.trim(),
                        passCtrl.text
                            .trim()); // El trim quita los espacios en blanco

                    if (registroOk == true) {
                      Navigator.pushReplacementNamed(context, 'usuarios');
                    } else {
                      mostrarAlerta(context, 'Resgistro incorrecto',
                          registroOk.toString());
                    }
                  },
          ),
        ],
      ),
    );
  }
}

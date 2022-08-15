import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class PaginaLogin extends StatefulWidget{
  const PaginaLogin({Key? key}): super(key: key);
  
  @override
 
    State<PaginaLogin> createState() => _PaginaLogin();
    
     
  }

  class _PaginaLogin extends State<PaginaLogin>{
  @override

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Widget build(BuildContext context) {
   return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.blue,
          Colors.red
        ],)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: _page(),
          
        ),
    );
   
  }
   Widget _page(){
    return Padding( //padding : para reducir el tamaño desde afuera para adentro
      padding: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(height: 50),
            _inputField("Usuario", usernameController ),
            const SizedBox(height: 20),
            _inputField("Password", passwordController,isPassword: true),
            const SizedBox(height: 50),
            _loginBtn(),
            const SizedBox(height: 50),
            _textExtra(),
             


          ],

        ),
      ),
    );
   }

   Widget _icon(){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2,),
        shape: BoxShape.circle),
        child: SvgPicture.asset("assets/usuario.svg",width: 100,height: 100,color: Colors.white,)
        //child: const Icon(Icons.person,color: Colors.white,size: 120)
      );
    
   }
   Widget _inputField(String hintText, TextEditingController controller,{isPassword = false}){
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white));
        
        
        return TextField(
          // campo de texto
          style: const TextStyle(color:Colors.white),
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color:Colors.white),
            enabledBorder: border,
            focusedBorder: border
          ),
          obscureText: isPassword, // ocultar texto de contraseña

        );
    
   }
    
    Widget _loginBtn(){
      return ElevatedButton(
        onPressed: (){
          debugPrint("Usuario: " + usernameController.text);
          debugPrint("Password: "+ passwordController.text);
        }, 
        child:const SizedBox(
          width: double.infinity,
          child: Text("Iniciar Sección",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),),
          ),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: Color.fromARGB(255,228,226,226),
            onPrimary: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 16),

          ),
          );
    }
    Widget _textExtra(){
      return const Text(
        "¿No puedes acceder a tu cuenta?",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16,color: Colors.white ),);
    }
  
}
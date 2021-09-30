import 'dart:async';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';


void main(){
  runApp( MyApp());
}
  
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
  
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
      ()=>Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
          (context) => SecondScreen()
        )
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
// ignore: must_be_immutable
class SecondScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SecondScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('myapp'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign In Page',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name/Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: const Text('Forgot Password'),
                ),
                Container(
                  height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: const Text('Login'),
                      onPressed: () {
                        print;(emailController.text);
                        // ignore: avoid_print
                        print(passwordController.text);
                      },
                    )),
                Row(
                  children: <Widget>[
                    const Text('Does not have account?'),
                    // ignore: deprecated_member_use
                    FlatButton(
                      textColor: Colors.blue,
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            )));
  }
}
/*
class authWrapper extends StatelessWidget{
  const authWrapper({
    Key key,
  }) :super (key: key);
}
@override
Widget build(BuildContext context){
  final firebaseUser = context.watch<User>();
  if (firebaseUser = null){
    return Text ("Signed In")
  }
  return Text ("Not Signed in")
}
class Auth{
  final FirebaseAuth _firebaseAuth
  Auth(this.firebaseAuth)
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  Future <String> signIn({Sting email, String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed In";
    }
      on FirebaseAuthException catch (e){
        return e.message;
      }
  }
    Future <String> signUp({String email, String password }) async{
      try {
        await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        return "Signed Up";
      }
      on FirebaseAuthException catch (e){
        return e.message;
      }
    }
}
*/

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Post createState() => Post();
}

class Post extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("posting app"),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text("Log Out"),
            onPressed: () {},
          )
        ],
      ),
      body: Material(
        color:Colors.white,
        elevation:0.5,
        borderRadius: BorderRadius.circular(15.0),
        child: const Card(child: ListTile(
          title: Text("post", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold ),),
          subtitle: Text("input text"),
        ),),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){},
        child: const Icon(Icons.edit, color:Colors.white),
      backgroundColor: Colors.red,
      tooltip: "add post",),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
  
}

class aPost extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey;
    return Scaffold(
      appBar: AppBar(
        title: Text("add post"),
        elevation: 0.0,
      ),
      body:Form(
        //key: formkey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Posting Page"
              ),
              validator: (val){
                if(val!.isEmpty){
                  return "title input required";
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Posting body"
              ),
              validator: (val){
                if(val!.isEmpty){
                  return "title input required";
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
        child: const Icon(Icons.add, color:Colors.white),
      backgroundColor: Colors.red,
      tooltip: "add post",),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}
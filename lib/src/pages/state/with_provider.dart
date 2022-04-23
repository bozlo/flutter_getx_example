import 'package:flutter/material.dart';
import 'package:flutter_getx_example/src/controller/count_controller_with_provider.dart';
import 'package:provider/provider.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({Key? key}) : super(key: key);

  // context를 넘겨줘야 한다.
  Widget _button(context) {
    return ElevatedButton(onPressed: (){
      Provider.of<CountControllerWithProvider>(context, listen: false).increase();
    },
        child: Text("+", style: TextStyle(fontSize: 30),));
  }
  @override
  Widget build(BuildContext context) {
    print("Should not be called multiple times");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("With Provider",
            style: TextStyle(fontSize: 20),),
          Consumer<CountControllerWithProvider>(builder: (_,snapshot,child) {
            return Text('${snapshot.count}', style: TextStyle(fontSize: 50),);
          }),
          _button(context),
        ],
      ),
    );
  }
}

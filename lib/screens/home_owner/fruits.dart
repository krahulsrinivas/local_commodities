import 'package:flutter/material.dart';
import 'package:local_commodities/models/item.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Weight {
  String wt;

Weight(this.wt);

static List<Weight> getWeights(){
  return <Weight>[
    Weight('100 g                      '),
    Weight('250 g                      '),
    Weight('500 g                      '),
    Weight('1 Kg                       '),
    Weight('2 Kg                       '),
  ];
}
}


class _MyHomePageState extends State<MyHomePage> {
  List<Weight> _weights = Weight.getWeights();
  List<DropdownMenuItem<Weight>> _dropdownMenuItems;
  Weight _selectedWeight;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_weights);
    _selectedWeight = _dropdownMenuItems[3].value;
    super.initState();
  }

  List<DropdownMenuItem<Weight>> buildDropdownMenuItems(List weights) {
    List<DropdownMenuItem<Weight>> items = List();
    for (Weight weight in weights) {
      items.add(
        DropdownMenuItem(
          value: weight,
          child: Text(weight.wt),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Weight selectedWeight){
    setState(() {
      _selectedWeight = selectedWeight;
    });
  }

  

  /*final List<Item> products = [
    Item(
      brand: 'FRESHO',
      name: 'Apple - Red Washington',
      price: 60,
      image:'asset/apple.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Pomegranate',
      price: 80,
      image:'asset/pomegranate.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Pear',
      price: 80,
      image:'asset/pear.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Avocado',
      price: 100,
      image:'asset/avocado.jpg',
    ),
    Item(
      brand: 'FRESHO',
      name: 'Banana - Poovan',
      price: 33,
      image:'asset/banana.jpg',
    ),
  ];*/

  @override
  Widget build(BuildContext context) {

      final products = Provider.of<List<Item>>(context) ?? [];

    return Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: products.map((it) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0,0,10,0),
                        child: Image(
                          image: AssetImage(it.image),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 25.0,),
                          Text(it.name),
                          SizedBox(height: 30.0,),
                          Text(
                            'MRP: Rs ' + it.price.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20.0,),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
      );     
  }
}

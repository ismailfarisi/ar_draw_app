// ignore: import_of_legacy_library_into_null_safe
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArScreenPage extends StatefulHookWidget {
  const ArScreenPage({Key? key}) : super(key: key);

  @override
  State<ArScreenPage> createState() => _ArScreenPageState();
}

class _ArScreenPageState extends State<ArScreenPage> {
  late ArCoreController arCoreController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    useEffect(() {
      arCoreController = controller;
      return arCoreController.dispose;
    }, [arCoreController]);
    add_cube(controller);
  }

  void add_cube(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      metallic: 1.0,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(0.5, 0.5, 0.5),
    );
    final ArCoreNode node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(-0.5, 0.5, -3.5),
    );
    controller.addArCoreNode(node);
  }
}

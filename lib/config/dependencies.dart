import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:social_destiny/data/services/app_gateway.dart';

List<SingleChildWidget> get providersRemote {
  return [
    Provider<AppGateway>(
      create: (context) => AppGateway(url: "http://10.0.2.2:3000"),
    ),
  ];
}

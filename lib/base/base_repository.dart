import 'package:get/get.dart';
import 'package:sample/app/data/network/network_requester.dart';

class BaseRepository {
  NetworkRequester get controller => GetInstance().find<NetworkRequester>();
}

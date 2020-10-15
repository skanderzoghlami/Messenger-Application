import 'package:chatapp/services/base_api.dart';
import 'package:http/http.dart' as http;

class ConversationService extends BaseApi {
  Future<http.Response> getConversations() async {
    return await api.httpGet('conversations');
  }
}

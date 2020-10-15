import 'dart:convert';
import 'package:chatapp/models/conversation_model.dart';
import 'package:chatapp/providers/base_provider.dart';
import 'package:chatapp/services/conversation_service.dart';

class ConversationsProvider extends BaseProvider {
  // All the variables should have theit gettter and setter
  ConversationService _conversationService = ConversationService();
  List<ConversationModel> _conversations = List();
  List<ConversationModel> get conversations => _conversations;
  // those will be useless since we created BaseProvider
  // bool _busy = false;
  //bool get busy => _busy;
  //setBusy(bool val) {
  // _busy = val;
  //notifyListeners();
  //}

  Future<List<ConversationModel>> getConversations() async {
    setBusy(true);
    var response = await _conversationService.getConversations();
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      data['data'].forEach((conversation) =>
          _conversations.add(ConversationModel.fromJson(conversation)));
      print(response.body);
      notifyListeners();
      setBusy(false);
    }
    return _conversations;
  }
}

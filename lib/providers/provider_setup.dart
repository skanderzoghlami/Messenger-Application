import 'package:chatapp/providers/conversations_provider.dart';
import 'package:chatapp/providers/locator.dart';
import 'package:provider/provider.dart';
import 'package:chatapp/providers/auth_provider.dart';

List<SingleChildCloneableWidget> provider = [
  ChangeNotifierProvider(
    builder: (context) => locator<ConversationsProvider>(),
  ),
  ChangeNotifierProvider(
    builder: (context) => locator<AuthProvider>(),
  ),
];

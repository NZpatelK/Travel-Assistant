import 'package:google_generative_ai/google_generative_ai.dart';

late final GenerativeModel _model;
late final ChatSession _chatSession;

void initModel() async {
  _model = GenerativeModel(
      model: 'gemini-pro', apiKey: ''
      // apiKey: const String.fromEnvironment('api_key'),
      );
  _chatSession = _model.startChat();
}

Future<String> generateTravelPlan(String planDetail) async {
  initModel();

  try {
    final response = await _chatSession.sendMessage(
      Content.text(planDetail),
    );
    final planCreate = response.text;
    if (planCreate == null) {
      return 'Generative Plan is unsuccessful';
    } else {
      return planCreate;
    }
  } catch (error) {
    return 'Generative Plan is unsuccessful - $error';
  }
}

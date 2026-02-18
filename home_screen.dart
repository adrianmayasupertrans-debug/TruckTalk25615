import 'package:flutter/material.dart';
import '../services/speech_service.dart';
import '../services/translation_service.dart';
import '../services/tts_service.dart';
import '../services/purchase_service.dart';
import '../services/settings_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final speech = SpeechService();
  final translate = TranslationService();
  final tts = TtsService();
  final purchase = PurchaseService();

  String status = "Apasă și vorbește";
  bool paid = false;

  @override
  void initState() {
    super.initState();
    checkPurchase();
  }

  void checkPurchase() async {
    paid = await purchase.isPurchased();
    setState(() {});
  }

  Future<void> start() async {
    if (!paid) {
      await purchase.buy();
      checkPurchase();
      return;
    }

    setState(() => status = "Ascult...");
    final text = await speech.listen();

    final lang = await SettingsService.getTargetLanguage();
    setState(() => status = "Traduce...");
    final translated = await translate.translate(text, lang);

    setState(() => status = translated);
    await tts.speak(translated, "$lang-${lang.toUpperCase()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TruckTalk"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (v) async {
              await SettingsService.setTargetLanguage(v);
              setState(() {});
            },
            itemBuilder: (_) => const [
              PopupMenuItem(value: "de", child: Text("Germană")),
              PopupMenuItem(value: "en", child: Text("Engleză")),
              PopupMenuItem(value: "fr", child: Text("Franceză")),
              PopupMenuItem(value: "es", child: Text("Spaniolă")),
            ],
          )
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: start,
          child: const Icon(Icons.mic, size: 50),
        ),
      ),
    );
  }
}

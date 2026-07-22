import 'dart:io' show Platform;
import 'dart:math';

String generateRandomSequence(int length) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => chars.codeUnitAt(random.nextInt(chars.length)),
    ),
  );
}

String sanitizePrompt(String prompt) {
  return prompt
      .replaceAll(RegExp(r'[^\w\s-]'), '')
      .trim()
      .replaceAll(RegExp(r'\s+'), '_');
}

String normalizePromptForGeneration(String prompt) {
  if (prompt.isEmpty) return prompt;

  return prompt
      .replaceAll('\r\n', '\n')
      .replaceAll('\r', '\n')
      .trim();
}

String resolvePreferredBackend(String requestedBackend) {
  if (Platform.isAndroid && requestedBackend == 'CPU') {
    return 'Vulkan';
  }
  return requestedBackend;
}

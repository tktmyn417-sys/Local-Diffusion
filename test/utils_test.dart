import 'package:flutter_test/flutter_test.dart';
import 'package:local_diffusion/utils.dart';

void main() {
  test('preserves long multiline prompts for generation', () {
    final prompt = '''A detailed cinematic portrait of a futuristic android in a neon city, wearing a weathered coat, standing under rain, soft glow, ultra detailed, high contrast, cinematic lighting, dramatic atmosphere, complex composition, long prompt support for local generation engines that should not truncate content.''';

    expect(normalizePromptForGeneration(prompt), prompt);
  });

  test('normalizes Windows line endings without collapsing content', () {
    const prompt = 'First line\r\nSecond line\r\nThird line';

    expect(normalizePromptForGeneration(prompt), 'First line\nSecond line\nThird line');
  });
}

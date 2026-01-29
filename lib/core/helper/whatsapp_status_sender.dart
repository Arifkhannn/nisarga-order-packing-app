import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

/// Normalize Indian phone number for WhatsApp
String normalizeIndianPhone(String phone) {
  // Remove spaces, +, -, brackets
  String cleaned = phone.replaceAll(RegExp(r'[^\d]'), '');

  // If already starts with 91 and length is correct
  if (cleaned.startsWith('91') && cleaned.length == 12) {
    return cleaned;
  }

  // If starts with 0 → remove 0, add 91
  if (cleaned.startsWith('0') && cleaned.length == 11) {
    return '91${cleaned.substring(1)}';
  }

  // If 10-digit number → add 91
  if (cleaned.length == 10) {
    return '91$cleaned';
  }

  // Fallback (return as-is)
  return cleaned;
}

Future<void> openWhatsApp(String phone, String message) async {
  final normalizedPhone = normalizeIndianPhone(phone);

  final uri = Uri.parse(
    'https://wa.me/$normalizedPhone?text=${Uri.encodeComponent(message)}',
  );

  debugPrint('WhatsApp URL: $uri');

  final launched = await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  );

  if (!launched) {
    debugPrint('❌ Could not launch WhatsApp');
  }
}

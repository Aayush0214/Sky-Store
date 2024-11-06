/// Custom exception class to handle various format-related errors.
class SkyFormatException implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const SkyFormatException(
      [this.message =
          'An unexpected format error occurred. Please check your input']);

  /// Create a format exception from a specific error message.
  factory SkyFormatException.fromMessage(String message) {
    return SkyFormatException(message);
  }

  /// Get the corresponding error message.
  String get formattedMessage => message;

  /// Create a format exception from a specific error code.
  factory SkyFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const SkyFormatException(
            'The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const SkyFormatException(
            'The provided phone number format is invalid. Please enter a valid email.');
      case 'invalid-date-format':
        return const SkyFormatException(
            'The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const SkyFormatException(
            'The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const SkyFormatException(
            'The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const SkyFormatException(
            'The input should be a valid numeric format.');
      default:
        return const SkyFormatException('Unknown format exception occurred!');
    }
  }
}

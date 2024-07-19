final class LocationNameReduceUsecase {
  String call(String? locationName) {
    if (locationName == null || locationName.isEmpty) return '';

    final words = locationName.split(',');

    final filteredWords = words.where((word) {
      return !RegExp(r'\b[A-Z0-9]+\+[A-Z0-9]+\b').hasMatch(word.trim());
    }).toList();

    if (filteredWords.length > 3) {
      filteredWords.removeRange(2, filteredWords.length);
    }

    return filteredWords.join(',').replaceAll(RegExp(r',\s*$'), '');
  }
}

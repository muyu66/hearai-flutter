abstract final class DateUtils {
  static String shortDate(DateTime date) =>
      '${date.year}-${_pad(date.month)}-${_pad(date.day)}';

  static String timeAgo(DateTime dateTime) {
    final diff = DateTime.now().difference(dateTime);
    if (diff.inSeconds < 60) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return shortDate(dateTime);
  }

  static String _pad(int n) => n.toString().padLeft(2, '0');
}

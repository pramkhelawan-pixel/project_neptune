import 'package:flutter_test/flutter_test.dart';
import 'package:project_neptune/core/services/share/recommend_friend_content.dart';

void main() {
  test('shareText includes the pitch and the Play Store link', () {
    final text = RecommendFriendContent.shareText;
    expect(text, contains('Try Neptune'));
    expect(text, contains(RecommendFriendContent.playStoreUrl));
  });
}

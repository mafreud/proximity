import 'package:algolia/algolia.dart';

class AlgoliaService {
  static Algolia init() {
    return Algolia.init(
      applicationId: 'CKGMLVWF3E',
      apiKey: '4f0142ae3623d628398f01985dcded5d',
    );
  }
}

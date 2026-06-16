// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'words_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WordsController)
final wordsControllerProvider = WordsControllerProvider._();

final class WordsControllerProvider
    extends $AsyncNotifierProvider<WordsController, List<WordDtoModel>> {
  WordsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wordsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wordsControllerHash();

  @$internal
  @override
  WordsController create() => WordsController();
}

String _$wordsControllerHash() => r'3589ad8b54b3e661a7be5ebb3279893ab2495c46';

abstract class _$WordsController extends $AsyncNotifier<List<WordDtoModel>> {
  FutureOr<List<WordDtoModel>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<WordDtoModel>>, List<WordDtoModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<WordDtoModel>>, List<WordDtoModel>>,
              AsyncValue<List<WordDtoModel>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

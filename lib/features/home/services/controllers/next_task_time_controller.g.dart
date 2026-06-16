// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_task_time_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NextTaskTimeController)
final nextTaskTimeControllerProvider = NextTaskTimeControllerProvider._();

final class NextTaskTimeControllerProvider
    extends
        $AsyncNotifierProvider<NextTaskTimeController, NextTaskTimeDtoModel> {
  NextTaskTimeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nextTaskTimeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nextTaskTimeControllerHash();

  @$internal
  @override
  NextTaskTimeController create() => NextTaskTimeController();
}

String _$nextTaskTimeControllerHash() =>
    r'4cf874e2b9944a7f4971af113b5836ddceb4a044';

abstract class _$NextTaskTimeController
    extends $AsyncNotifier<NextTaskTimeDtoModel> {
  FutureOr<NextTaskTimeDtoModel> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<NextTaskTimeDtoModel>, NextTaskTimeDtoModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<NextTaskTimeDtoModel>,
                NextTaskTimeDtoModel
              >,
              AsyncValue<NextTaskTimeDtoModel>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

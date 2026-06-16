import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearai/core/core.dart';
import 'package:hearai/features/home/home.dart';

// 等待卡片
class WaitingCard extends ConsumerStatefulWidget {
  const WaitingCard({super.key});

  @override
  ConsumerState<WaitingCard> createState() => _WaitingCardState();
}

class _WaitingCardState extends ConsumerState<WaitingCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nextTaskTimeAsync = ref.watch(nextTaskTimeControllerProvider);

    return Center(
      child: nextTaskTimeAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stackTrace) {
          debugPrintStack(stackTrace: stackTrace);
          return Center(child: Text('Error: $e'));
        },
        data: (nextTaskTime) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Excellent !",
                textAlign: TextAlign.center,
                style: context.textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              Text(
                nextTaskTime.tomorrow
                    ? "明天见，Bye ~"
                    : "${nextTaskTime.hours}小时后见，Bye ~",
                textAlign: TextAlign.center,
                style: context.textTheme.headlineSmall,
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:hearai/features/home/home.dart';

abstract interface class WordRepository {
  Future<List<WordDtoModel>> getTodayWords();
  Future<void> report(String taskId, ReportWordDtoModel body);
  Future<NextTaskTimeDtoModel> getNextTaskTime();
}

class WordRepositoryImpl implements WordRepository {
  const WordRepositoryImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<WordDtoModel>> getTodayWords() async {
    final response = await dio.get("/daily-tasks/today-words");
    final data = response.data as List<dynamic>;
    return data.map((json) => WordDtoModel.fromJson(json)).toList();
  }

  @override
  Future<void> report(String taskId, ReportWordDtoModel body) async {
    await dio.patch("/daily-tasks/$taskId/report", data: body.toJson());
  }

  @override
  Future<NextTaskTimeDtoModel> getNextTaskTime() async {
    final response = await dio.get("/daily-tasks/next-task-time");
    return NextTaskTimeDtoModel.fromJson(response.data);
  }
}

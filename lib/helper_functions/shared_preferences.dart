import 'package:shared_preferences/shared_preferences.dart';

// Save a list of completed levels in shared preferences
Future<void> saveCompletedLevels(List<int> completedLevels) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList('completedLevels', completedLevels.map((level) => level.toString()).toList());
}

// Retrieve the list of completed levels from shared preferences
Future<List<int>> getCompletedLevels() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? completedLevelsStringList = prefs.getStringList('completedLevels');

  if (completedLevelsStringList != null) {
    List<int> completedLevels = completedLevelsStringList.map((level) => int.parse(level)).toList();
    return completedLevels;
  } else {
    return [];
  }
}

// Add a completed level to the list and update shared preferences
Future<void> addCompletedLevel(int newLevel) async {
  List<int> completedLevels = await getCompletedLevels();

  if (!completedLevels.contains(newLevel)) {
    completedLevels.add(newLevel);
    await saveCompletedLevels(completedLevels);
  }
}
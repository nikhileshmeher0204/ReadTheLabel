import 'package:flutter/material.dart';

Widget MacronutrientSummaryCard(
    BuildContext context, Map<String, double> dailyIntake) {
  final calories = dailyIntake['Energy'] ?? 0.0;
  const calorieGoal = 2000.0;
  final caloriePercent = (calories / calorieGoal).clamp(0.0, 1.0);

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          blurRadius: 20,
          offset: const Offset(5, 5),
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Calories',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  '${calories.toStringAsFixed(0)} / ${calorieGoal.toStringAsFixed(0)} kcal',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 75,
                  height: 75,
                  child: CircularProgressIndicator(
                    value: caloriePercent,
                    backgroundColor: Colors.white24,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.onPrimary,
                    ),
                    strokeWidth: 10,
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Center(
                  child: Text(
                    '${(caloriePercent * 100).toStringAsFixed(0)}%',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildMacronutrientIndicator(
              'Protein',
              dailyIntake['Protein'] ?? 0.0,
              50.0,
              Icons.fitness_center,
            ),
            _buildMacronutrientIndicator(
              'Carbs',
              dailyIntake['Carbohydrate'] ?? 0.0,
              275.0,
              Icons.grain,
            ),
            _buildMacronutrientIndicator(
              'Fat',
              dailyIntake['Fat'] ?? 0.0,
              78.0,
              Icons.opacity,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildMacronutrientIndicator(
  String label,
  double value,
  double goal,
  IconData icon,
) {
  final percent = (value / goal).clamp(0.0, 1.0);
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
          fontFamily: 'Poppins',
        ),
      ),
      const SizedBox(height: 4),
      Text(
        '${value.toStringAsFixed(1)}g',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
    ],
  );
}

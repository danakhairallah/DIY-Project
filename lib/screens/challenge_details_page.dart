import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import '../providers/challenge_provider.dart';
import '../utils/app_localizations.dart';

class ChallengeDetails extends StatefulWidget {
  final String challengeId;
  const ChallengeDetails({super.key, required this.challengeId});

  @override
  State<ChallengeDetails> createState() => _ChallengeDetailsState();
}

class _ChallengeDetailsState extends State<ChallengeDetails> {
  int _currentIndex = 0;
  Timer? _timer;
  List<DateTime> _completedDays = [];

  @override
  void initState() {
    super.initState();
    _startQuoteTimer();
    _loadCompletedDays();
  }

  void _startQuoteTimer() {
    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % 3;
      });
    });
  }

  Future<void> _loadCompletedDays() async {
    final prefs = await SharedPreferences.getInstance();
    final stringDates = prefs.getStringList('completedDays_${widget.challengeId}') ?? [];
    setState(() {
      _completedDays = stringDates.map((s) => DateTime.parse(s)).toList();
    });
  }

  Future<void> _saveCompletedDays() async {
    final prefs = await SharedPreferences.getInstance();
    final stringDates = _completedDays.map((d) => d.toIso8601String()).toList();
    await prefs.setStringList('completedDays_${widget.challengeId}', stringDates);
  }

  void _showCustomTrackerDialog(AppLocalizations loc) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text(loc.translate("track_progress")),
              content: SizedBox(
                width: double.maxFinite,
                height: 350,
                child: GridView.builder(
                  itemCount: 30,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final dayNumber = index + 1;
                    final date = DateTime(2024, 1, dayNumber);
                    final isCompleted = _completedDays.any((d) => d.day == dayNumber);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          final exists = _completedDays.any((d) => d.day == dayNumber);
                          if (exists) {
                            _completedDays.removeWhere((d) => d.day == dayNumber);
                          } else {
                            _completedDays.add(date);
                          }
                          _saveCompletedDays();
                          setStateDialog(() {});
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isCompleted ? Colors.green : Colors.blue[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          isCompleted ? "✔" : "$dayNumber",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _completedDays.clear();
                          _saveCompletedDays();
                          setStateDialog(() {});
                        });
                      },
                      child: Text(loc.translate("reset")),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(loc.translate("close")),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final challenge = Provider.of<ChallengeProvider>(context, listen: false)
        .findById(widget.challengeId);

    final quotes = [
      loc.translate("quote_1"),
      loc.translate("quote_2"),
      loc.translate("quote_3"),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 94),
                child: Text(
                  quotes[_currentIndex],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2083B8),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          challenge.imageUrl,
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        loc.translate(challenge.title),
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        loc.translate(challenge.description),
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: AlignmentDirectional.centerStart,                        child: Text(
                          "${loc.translate("category")}: ${loc.translate(challenge.category)}",                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: AlignmentDirectional.centerStart,                        child: Text(
                          "${loc.translate("rating")}: ${challenge.rating} ⭐",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/upload');
                        },
                        child: Text(loc.translate("take_the_challenge")),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCustomTrackerDialog(loc),
        child: const Icon(Icons.check_box),
      ),
    );
  }
}

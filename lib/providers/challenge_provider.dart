import 'package:flutter/material.dart';
import '../models/challenge.dart';

class ChallengeProvider with ChangeNotifier {
  final List<Challenge> _challenges = [
    Challenge(
      id: 'c1',
      title: 'challenge_drink_water_title',
      description: 'challenge_drink_water_desc',
      category: 'category_physical_health',
      imageUrl: 'assets/images/drink_water.jpeg',
      rating: 5,
    ),
    Challenge(
      id: 'c2',
      title: 'challenge_english_word_title',
      description: 'challenge_english_word_desc',
      category: 'category_personal_growth',
      imageUrl: 'assets/images/english_word.png',
      rating: 4.3,
    ),
    Challenge(
      id: 'c3',
      title: 'challenge_family_time_title',
      description: 'challenge_family_time_desc',
      category: 'category_relationships',
      imageUrl: 'assets/images/family_time.jpeg',
      rating: 3.2,
    ),
    Challenge(
      id: 'c4',
      title: 'challenge_meditation_title',
      description: 'challenge_meditation_desc',
      category: 'category_mindfulness',
      imageUrl: 'assets/images/meditation.jpeg',
      rating: 4.7,
    ),
    Challenge(
      id: 'c5',
      title: 'challenge_walking_title',
      description: 'challenge_walking_desc',
      category: 'category_physical_health',
      imageUrl: 'assets/images/walking.jpg',
      rating: 4.6,
    ),
    Challenge(
      id: 'c6',
      title: 'challenge_read_book_title',
      description: 'challenge_read_book_desc',
      category: 'category_personal_growth',
      imageUrl: 'assets/images/read_book.jpeg',
      rating: 4.9,
    ),
    Challenge(
      id: 'c7',
      title: 'challenge_without_internet_title',
      description: 'challenge_without_internet_desc',
      category: 'category_digital_detox',
      imageUrl: 'assets/images/without_internet.png',
      rating: 4.8,
    ),
    Challenge(
      id: 'c8',
      title: 'challenge_no_junk_food_title',
      description: 'challenge_no_junk_food_desc',
      category: 'category_physical_health',
      imageUrl: 'assets/images/no_junk_food.jpeg',
      rating: 5,
    ),
    Challenge(
      id: 'c9',
      title: 'challenge_waking_up_early_title',
      description: 'challenge_waking_up_early_desc',
      category: 'category_physical_health',
      imageUrl: 'assets/images/waking_up_early.jpg',
      rating: 4,
    ),
    Challenge(
      id: 'c10',
      title: 'challenge_cooking_title',
      description: 'challenge_cooking_desc',
      category: 'category_personal_growth',
      imageUrl: 'assets/images/cooking.jpeg',
      rating: 4.1,
    ),
    Challenge(
      id: 'c11',
      title: 'challenge_read_quran_title',
      description: 'challenge_read_quran_desc',
      category: 'category_spiritual',
      imageUrl: 'assets/images/reading_the_qur’an.jpeg',
      rating: 4,
    ),
    Challenge(
      id: 'c12',
      title: 'challenge_new_skill_title',
      description: 'challenge_new_skill_desc',
      category: 'category_personal_growth',
      imageUrl: 'assets/images/new_skill.png',
      rating: 3.9,
    ),
    Challenge(
      id: 'c13',
      title: 'challenge_push_ups_title',
      description: 'challenge_push_ups_desc',
      category: 'category_physical_health',
      imageUrl: 'assets/images/push-ups.png',
      rating: 3.6,
    ),
    Challenge(
      id: 'c14',
      title: 'challenge_meaningful_conversations_title',
      description: 'challenge_meaningful_conversations_desc',
      category: 'category_relationships',
      imageUrl: 'assets/images/meaningful_conversations.jpeg',
      rating: 5,
    ),
  ];

  List<Challenge> get challenges => [..._challenges];

  Challenge findById(String id) {
    return _challenges.firstWhere((ch) => ch.id == id);
  }
}

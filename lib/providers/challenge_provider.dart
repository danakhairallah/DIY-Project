import 'package:flutter/material.dart';
import '../models/challenge.dart';

class ChallengeProvider with ChangeNotifier {
  final List<Challenge> _challenges = [
    Challenge(
      id: 'c1',
      title: 'Drink Water',
      description: 'Make sure to drink 8 glasses (2 liters) of water today to stay hydrated and healthy.',
      category: 'Physical Health',
      imageUrl: 'assets/images/drink_water.jpeg',
      rating: 5,
    ),
    Challenge(
      id: 'c2',
      title: 'English word',
      description: 'Learn a new English word with its meaning, and use it in a complete sentence to reinforce it.',
      category: 'Personal Growth',
      imageUrl: 'assets/images/english_word.png',
      rating: 4.3,
    ),

    Challenge(
      id: 'c3',
      title: 'Family time',
      description: 'Spend at least one hour with your family today, without devices. Enjoy a shared activity or deep conversation.',
      category: 'Relationships',
      imageUrl: 'assets/images/family_time.jpeg',
      rating: 3.2,
    ),
    Challenge(
      id: 'c4',
      title: 'Meditation',
      description: 'Take 10 minutes today to sit in a quiet space, breathe deeply, and focus on the present moment.',
      category: 'Mindfulness',
      imageUrl: 'assets/images/meditation.jpeg',
      rating: 4.7,
    ),

    Challenge(
      id: 'c5',
      title: 'walking',
      description: 'Go for a 30-minute walk outdoors. Choose a peaceful area and enjoy the movement and fresh air.',
      category: 'Physical Health',
      imageUrl: 'assets/images/walking.jpg',
      rating: 4.6,
    ),
    Challenge(
      id: 'c6',
      title: 'Read Book',
      description: 'Read 10 pages from a book you enjoy or can learn from. Note down one idea that inspired you.',
      category: 'Personal Growth',
      imageUrl: 'assets/images/read_book.jpeg',
      rating: 4.9,
    ),
    Challenge(
      id: 'c7',
      title: 'Without internet',
      description: 'Disconnect from the internet for 2 hours today. Use that time to do something meaningful offline.',
      category: 'Digital Detox',
      imageUrl: 'assets/images/without_internet.png',
      rating: 4.8,
    ),
    Challenge(
      id: 'c8',
      title: 'No Junk Food',
      description: 'Avoid all junk food and sugary drinks today. Choose healthy alternatives and nourish your body.',
      category: 'Physical Health',
      imageUrl: 'assets/images/no_junk_food.jpeg',
      rating: 5,
    ),
    Challenge(
      id: 'c9',
      title: 'Waking up early',
      description: 'Wake up one hour earlier than usual and spend your morning doing something productive like reading or exercising.',
      category: 'Physical Health',
      imageUrl: 'assets/images/waking_up_early.jpg',
      rating: 4,
    ),
    Challenge(
      id: 'c10',
      title: 'Cooking',
      description: 'Cook a healthy meal by yourself today. Try a new recipe and share it with someone you care about.',
      category: 'Personal Growth ',
      imageUrl: 'assets/images/cooking.jpeg',
      rating: 4.1,
    ),
    Challenge(
      id: 'c11',
      title: 'Reading the Qur’an',
      description: 'Read at least one page of the Qur’an today and reflect on its meaning. Make it part of your daily routine.',
      category: 'Spiritual',
      imageUrl: 'assets/images/reading_the_qur’an.jpeg',
      rating: 4,
    ),
    Challenge(
      id: 'c12',
      title: 'New skill',
      description: 'Choose a new skill and learn the basics from a short video or article. Take your first step and share your progress.',
      category: 'Personal Growth',
      imageUrl: 'assets/images/new_skill.png',
      rating: 3.9,
    ),
    Challenge(
      id: 'c13',
      title: 'Push-ups',
      description: 'Do 3 sets of push-ups (10 reps each) with short breaks in between. Improve your strength step by step.',
      category: 'Physical Health',
      imageUrl: 'assets/images/push-ups.png',
      rating: 3.6,
    ),
    Challenge(
      id: 'c14',
      title: 'Meaningful Conversations',
      description: 'Start a meaningful conversation with a friend or family member today. Talk about something that truly matters.',
      category: 'Relationships',
      imageUrl: 'assets/images/meaningful_conversations.jpeg',
      rating: 5,
    ),
  ];

  List<Challenge> get challenges => [..._challenges];

  Challenge findById(String id) {
    return _challenges.firstWhere((ch) => ch.id == id);
  }
}

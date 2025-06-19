import '../models/challenge.dart';

final dummyChallenges = [
  Challenge(
    id: 'c1',
    title: 'Recycle Art Challenge',
    description: 'Create art using recycled materials',
    imageUrl: 'https://via.placeholder.com/400x200.png?text=Challenge+1',
    category: 'Art',
    rating: 4.5,
  ),
  Challenge(
    id: 'c2',
    title: 'Fitness 7-Day Challenge',
    description: 'Complete 7 different workouts in 7 days',
    imageUrl: 'https://via.placeholder.com/400x200.png?text=Challenge+2',
    category: 'Health',
    rating: 4.0,
  ),
  Challenge(
    id: 'c3',
    title: 'Build Your Own App',
    description: 'Create a basic mobile app using Flutter',
    imageUrl: 'https://via.placeholder.com/400x200.png?text=Challenge+3',
    category: 'Tech',
    rating: 5.0,
  ),
];

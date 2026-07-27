import '../domain/rule.dart';

final shadRules = <Rule>[
  Rule(
    id: 'RULE-SHD-0001',
    species: 'Shad',
    topic: 'Fresh Sardine',
    condition: 'Incoming Tide',
    weight: 15,
    explanation:
    'Incoming tide improves the effectiveness of fresh sardine for Shad.',
  ),
];
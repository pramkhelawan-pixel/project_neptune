import '../../domain/evidence_level.dart';
import '../../domain/knowledge_category.dart';
import '../../domain/knowledge_record.dart';
import '../../domain/knowledge_source.dart';

final List<KnowledgeRecord> shadBaitKnowledge = [

  KnowledgeRecord(
    id: 'NKS-SHD-BAIT-0001',

    species: 'Shad',

    category: KnowledgeCategory.bait,

    title: 'Fresh Sardine',

    description:
    'Fresh sardine is regarded by experienced South African surf anglers as the primary natural bait for targeting Shad. It produces excellent results during active feeding periods and can be presented whole, as a fillet or as a butterfly bait.',

    evidenceLevel: EvidenceLevel.experiencedAngler,

    confidence: 0.99,

    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-BAIT-0001',
        reliability: 0.99,
      ),
    ],

    regions: [
      'KwaZulu-Natal',
      'Eastern Cape',
      'Western Cape',
    ],

    seasons: [
      'Autumn',
      'Winter',
      'Spring',
    ],

    tags: [
      'shad',
      'bait',
      'sardine',
      'natural bait',
      'beginner',
    ],

    lastUpdated: DateTime(2026, 7, 29),
  ),

  KnowledgeRecord(
    id: 'NKS-SHD-BAIT-0002',

    species: 'Shad',

    category: KnowledgeCategory.bait,

    title: 'Sardine Fillet',

    description:
    'A sardine fillet provides an aerodynamic bait presentation that casts well into surf conditions while maintaining an attractive natural profile.',

    evidenceLevel: EvidenceLevel.experiencedAngler,

    confidence: 0.95,

    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-BAIT-0002',
        reliability: 0.95,
      ),
    ],

    regions: [
      'KwaZulu-Natal',
    ],

    seasons: [
      'Autumn',
      'Winter',
      'Spring',
    ],

    tags: [
      'fillet',
      'sardine',
      'casting',
      'natural bait',
    ],

    lastUpdated: DateTime(2026, 7, 29),
  ),

  KnowledgeRecord(
    id: 'NKS-SHD-BAIT-0003',

    species: 'Shad',

    category: KnowledgeCategory.bait,

    title: 'Whole Sardine',

    description:
    'A whole sardine creates a larger profile and is often selected when targeting bigger Shad or when baitfish are abundant.',

    evidenceLevel: EvidenceLevel.experiencedAngler,

    confidence: 0.91,

    sources: [
      const KnowledgeSource(
        name: 'Neptune Knowledge Base',
        type: 'Expert Knowledge',
        reference: 'NKS-SHD-BAIT-0003',
        reliability: 0.93,
      ),
    ],

    regions: [
      'KwaZulu-Natal',
    ],

    seasons: [
      'Winter',
      'Spring',
    ],

    tags: [
      'whole sardine',
      'large bait',
      'natural bait',
    ],

    lastUpdated: DateTime(2026, 7, 29),
  ),

];
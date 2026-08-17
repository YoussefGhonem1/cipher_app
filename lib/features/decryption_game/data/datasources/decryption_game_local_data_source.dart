import '../models/category_model.dart';

abstract class DecryptionGameLocalDataSource {
  Future<List<CategoryModel>> getCategories(String langCode);
}

class DecryptionGameLocalDataSourceImpl
    implements DecryptionGameLocalDataSource {
  @override
  Future<List<CategoryModel>> getCategories(String langCode) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final isAr = langCode == 'ar';

    return [
      CategoryModel(
        id: '1',
        title: isAr ? 'أفلام مصرية وعربية' : 'Egyptian & Arabic Movies',
        description: isAr
            ? 'حلل أفلام الأكشن والإثارة والغموض في السينما العربية.'
            : 'Analyze Egyptian and Arabic action and thriller movies.',
        imagePath: 'assets/images/arabic_movies.png',
        intelLevel: isAr ? 'مستوى المعلومات: عالي' : 'INTEL: HIGH',
        wordsPool: const [
          'الجزيرة',
          'إبراهيم الأبيض',
          'ولاد رزق',
          'الفيل الأزرق',
          'الممر',
          'كيرة والجن',
          'تيتو',
          'مافيا',
          'تراب الماس',
          'المشبوه',
          'ملاكي إسكندرية',
          'الخلية',
        ],
      ),
      CategoryModel(
        id: '2',
        title: isAr ? 'أفلام أجنبية وعالمية' : 'Foreign Movies',
        description: isAr
            ? 'أفلام هوليوود العالمية للأكشن والمغامرات والنجاة.'
            : 'Global Hollywood action, adventure, and survival movies.',
        imagePath: 'assets/images/action_movies.png',
        intelLevel: isAr ? 'مستوى المعلومات: متوسط' : 'INTEL: MODERATE',
        wordsPool: const [
          'John Wick',
          'Seven',
          'The Revenant',
          'Mad Max',
          'Die Hard',
          'The Equalizer',
          'Sicario',
          'Inception',
          'The Matrix',
          'Mission Impossible',
          'Interstellar',
          'Gladiator',
        ],
      ),
      CategoryModel(
        id: '3',
        title: isAr ? 'نجوم الفن والكوميديا' : 'Egyptian Stars',
        description: isAr
            ? 'مثل أشهر نجوم الكوميديا والسينما المصرية.'
            : 'Act out famous Egyptian comedy and cinema stars.',
        imagePath: 'assets/images/egyptian_stars.png',
        intelLevel: isAr ? 'مستوى المعلومات: سري جداً' : 'INTEL: CLASSIFIED',
        wordsPool: const [
          'عادل إمام',
          'أحمد حلمي',
          'محمد هنيدي',
          'بيومي فؤاد',
          'كريم عبد العزيز',
          'أحمد السقا',
          'محمد صلاح',
          'إسماعيل ياسين',
          'حسن حسني',
          'أحمد مكي',
        ],
      ),
      CategoryModel(
        id: '4',
        title: isAr ? 'أماكن ومعالم مصرية' : 'Egyptian Landmarks',
        description: isAr
            ? 'حدد معالم ومحافظات وأماكن شهيرة في مصر.'
            : 'Identify famous Egyptian landmarks and cities.',
        imagePath: 'assets/images/egyptian_landmarks.png',
        intelLevel: isAr ? 'مستوى المعلومات: عالي' : 'INTEL: HIGH',
        wordsPool: const [
          'دمياط',
          'أهرامات الجيزة',
          'خان الخليلي',
          'قلعة قايتباي',
          'شارع المعز',
          'برج القاهرة',
          'مكتبة الإسكندرية',
          'الأقصر وأسوان',
          'شرم الشيخ',
          'ميدان التحرير',
        ],
      ),
      CategoryModel(
        id: '5',
        title: isAr ? 'أكلات مصرية أصيلة' : 'Egyptian Food',
        description: isAr
            ? 'مثل أشهى الأكلات والأطباق الشعبية المصرية.'
            : 'Act out delicious traditional Egyptian dishes.',
        imagePath: 'assets/images/egyptian_food.png',
        intelLevel: isAr ? 'مستوى المعلومات: متوسط' : 'INTEL: MODERATE',
        wordsPool: const [
          'كشري',
          'حواوشي',
          'ملوخية',
          'طعمية',
          'فول مصري',
          'فتة باللحمة',
          'ممبار',
          'رقاق باللحمة المفرومة',
          'بصارة دمياطي',
          'أم علي',
        ],
      ),
      CategoryModel(
        id: '6',
        title: isAr ? 'معدات وأدوات نجاة' : 'Survival Gear',
        description: isAr
            ? 'راجع أدوات النجاة والمعدات التكتيكية في المهام.'
            : 'Review survival tools and tactical equipment.',
        imagePath: 'assets/images/survival_gear.png',
        intelLevel: isAr ? 'مستوى المعلومات: عالي' : 'INTEL: HIGH',
        wordsPool: isAr
            ? [
                'سكينة تكتيكية',
                'حبل نجاة',
                'بوصلة',
                'مسدس إضاءة',
                'نظارة رؤية ليلية',
                'فلتر مياه',
                'بطانية حرارية',
                'حقيبة إسعافات',
              ]
            : [
                'Tactical Knife',
                'Survival Rope',
                'Compass',
                'Flare Gun',
                'Night Vision Goggles',
                'Water Filter',
                'Thermal Blanket',
                'First Aid Kit',
              ],
      ),
    ];
  }
}

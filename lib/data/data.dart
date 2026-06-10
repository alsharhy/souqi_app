import 'package:flutter/material.dart';
import '../models/models.dart';

final List<Category> categories = [
  Category(id: 'electronics', name: 'إلكترونيات', icon: '🎧', color: 'indigo'),
  Category(id: 'clothes', name: 'ملابس', icon: '👕', color: 'rose'),
  Category(id: 'books', name: 'كتب', icon: '📚', color: 'amber'),
  Category(id: 'shoes', name: 'أحذية', icon: '👟', color: 'emerald'),
  Category(id: 'accessories', name: 'إكسسوارات', icon: '⌚', color: 'violet'),
];

final List<Product> products = [
  Product(
    id: 1,
    name: 'سماعة لاسلكية AirPods Pro',
    price: 899,
    rating: 4.8,
    reviews: 124,
    categoryId: 'electronics',
    image: '🎧',
    bg: 'indigo',
    description:
        'سماعة لاسلكية احترافية بميزة عزل الضوضاء الفعّال، صوت غني نقي، وعمر بطارية يمتد حتى 30 ساعة مع علبة الشحن، مع جودة مقاومة للماء والعرق ومناسبة للاستخدام اليومي والرياضي.',
  ),
  Product(
    id: 2,
    name: 'ساعة آبل واتش الإصدار 9',
    price: 1850,
    rating: 4.9,
    reviews: 286,
    categoryId: 'electronics',
    image: '⌚',
    bg: 'slate',
    description:
        'ساعة ذكية بشاشة Retina دائماً تعمل، مع تتبع متقدم للنشاط والصحة، قياس الأكسجين وتخطيط القلب، ومقاومة كاملة للماء، وعمر بطارية يصل لـ 18 ساعة.',
  ),
  Product(
    id: 3,
    name: 'كاميرا Sony Alpha A7',
    price: 5400,
    rating: 4.7,
    reviews: 92,
    categoryId: 'electronics',
    image: '📷',
    bg: 'zinc',
    description:
        'كاميرا ميرورليس احترافية بدقة 33 ميجابكسل، تصوير فيديو 4K بمعدل 60 إطار، نظام تثبيت بصري متقدم، ومناسبة للمصورين المحترفين وصناع المحتوى.',
  ),
  Product(
    id: 4,
    name: 'تيشيرت قطني كاجوال',
    price: 95,
    rating: 4.5,
    reviews: 64,
    categoryId: 'clothes',
    image: '👕',
    bg: 'rose',
    description:
        'تيشيرت رجالي بقماش قطن 100% مريح للبشرة، تصميم كاجوال أنيق يناسب الإطلالات اليومية، متوفر بعدة ألوان ومقاسات.',
  ),
  Product(
    id: 5,
    name: 'جاكيت شتوي مبطن',
    price: 420,
    rating: 4.6,
    reviews: 41,
    categoryId: 'clothes',
    image: '🧥',
    bg: 'amber',
    description:
        'جاكيت شتوي عملي بحشوة دافئة، مقاوم للماء، تصميم عصري مناسب للاستخدام اليومي والرحلات الخارجية في الأجواء الباردة.',
  ),
  Product(
    id: 6,
    name: 'حذاء رياضي Nike Air',
    price: 650,
    rating: 4.8,
    reviews: 178,
    categoryId: 'shoes',
    image: '👟',
    bg: 'emerald',
    description:
        'حذاء رياضي بتقنية امتصاص الصدمات Nike Air، مناسب للجري والتمارين اليومية، خامة تنفس عالية ووزن خفيف للراحة المثالية.',
  ),
  Product(
    id: 7,
    name: 'حذاء كلاسيكي جلد',
    price: 540,
    rating: 4.4,
    reviews: 33,
    categoryId: 'shoes',
    image: '👞',
    bg: 'yellow',
    description:
        'حذاء كلاسيكي رجالي من الجلد الطبيعي بتصميم أنيق يناسب الإطلالات الرسمية، نعل مريح ومتين للاستخدام اليومي.',
  ),
  Product(
    id: 8,
    name: 'كتاب أسرار العقل الباطن',
    price: 65,
    rating: 4.9,
    reviews: 412,
    categoryId: 'books',
    image: '📘',
    bg: 'sky',
    description:
        'من أكثر كتب التنمية الذاتية مبيعاً عالمياً، يكشف لك كيف تستخدم قوة عقلك الباطن لتحقيق أهدافك وتغيير حياتك للأفضل.',
  ),
  Product(
    id: 9,
    name: 'كتاب فن اللامبالاة',
    price: 58,
    rating: 4.7,
    reviews: 305,
    categoryId: 'books',
    image: '📕',
    bg: 'red',
    description:
        'كتاب يقدم منهجاً مختلفاً للحياة قائم على التركيز على ما يهم فعلاً، بأسلوب جريء وممتع غيّر حياة الملايين حول العالم.',
  ),
  Product(
    id: 10,
    name: 'نظارة شمسية Ray-Ban',
    price: 380,
    rating: 4.6,
    reviews: 76,
    categoryId: 'accessories',
    image: '🕶️',
    bg: 'slate',
    description:
        'نظارة شمسية كلاسيكية بإطار فاخر وعدسات حماية UV400، تصميم أيقوني يناسب جميع الإطلالات الرسمية والكاجوال.',
  ),
  Product(
    id: 11,
    name: 'حقيبة ظهر Anti-Theft',
    price: 240,
    rating: 4.5,
    reviews: 58,
    categoryId: 'accessories',
    image: '🎒',
    bg: 'violet',
    description:
        'حقيبة ظهر مقاومة للسرقة، مزودة بمنفذ USB لشحن الجوال، خامة مقاومة للماء ومساحة واسعة لأجهزة اللابتوب والإكسسوارات.',
  ),
  Product(
    id: 12,
    name: 'محفظة جلد طبيعي',
    price: 165,
    rating: 4.4,
    reviews: 47,
    categoryId: 'accessories',
    image: '👝',
    bg: 'orange',
    description:
        'محفظة رجالية أنيقة من الجلد الطبيعي، تحتوي على جيوب متعددة للبطاقات والنقود مع حماية RFID للبطاقات البنكية.',
  ),
];

Color getColor(String colorName, {int shade = 500}) {
  switch (colorName) {
    case 'indigo': return Colors.indigo[shade] ?? Colors.indigo;
    case 'rose': return Colors.pink[shade] ?? Colors.pink;
    case 'amber': return Colors.amber[shade] ?? Colors.amber;
    case 'emerald': return Colors.teal[shade] ?? Colors.teal;
    case 'violet': return Colors.purple[shade] ?? Colors.purple;
    case 'slate': return Colors.blueGrey[shade] ?? Colors.blueGrey;
    case 'zinc': return Colors.grey[shade] ?? Colors.grey;
    case 'yellow': return Colors.yellow[shade] ?? Colors.yellow;
    case 'sky': return Colors.lightBlue[shade] ?? Colors.lightBlue;
    case 'red': return Colors.red[shade] ?? Colors.red;
    case 'orange': return Colors.orange[shade] ?? Colors.orange;
    default: return Colors.blue;
  }
}

LinearGradient getGradient(String colorName) {
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      getColor(colorName, shade: 600),
      getColor(colorName, shade: 400),
    ],
  );
}

LinearGradient getLightGradient(String colorName) {
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      getColor(colorName, shade: 100),
      getColor(colorName, shade: 50),
    ],
  );
}

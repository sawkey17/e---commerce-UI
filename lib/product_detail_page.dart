import 'package:flutter/material.dart';

import 'main.dart' show Product;

const _navy = Color(0xFF0C253C);
const _orange = Color(0xFFFE893C);
const _canvas = Color(0xFFF8F9FB);
const _border = Color(0xFFE8ECF0);
const _muted = Color(0xFF7B8491);

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    required this.product,
    required this.initiallySaved,
    required this.onWishlistChanged,
    required this.onAddToCart,
    super.key,
  });

  final Product product;
  final bool initiallySaved;
  final ValueChanged<bool> onWishlistChanged;
  final VoidCallback onAddToCart;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late bool _saved = widget.initiallySaved;
  int _imageIndex = 0;
  int _colorIndex = 0;
  int _planIndex = 0;
  bool _added = false;
  final Set<int> _expanded = {};

  static const _gallery = [
    'https://lh3.googleusercontent.com/aida-public/AB6AXuASPbE1-IrZbzHwjca3JPHEzLvmgR8LYSql3Lr9-616WnybJnFrDmsxY4HtWec7n2JXS2kg_AGTG81XggNajic7_WJBk7D1UQYdRPpYl0a-LufFPsyjVfwG1GAOa6GFpowLg-yL4zXxgJWdk9yaLOic7DzggLryJ5uGsWK7lgqnu2kltOxsvIy8FyGpDNDqc9jMi8QwxcHxtSFqlhRWLNhAtKZT3LfF4_zOvHCN1wA',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuB-gVpKSthbW9ZiwVgcVzk4NcrvnQ2Sn7-B9ux31krWsLeLCrcnB2MLuv0PPJqf1FTqVCahYOwnVZjJJvpWVKSIKWE27ycvI7ayMOSGZ2xXcK9VdNcOMu7CP4TIAHpxwFY4G0fBODhKetWsCy8l_oMwqEbStcIl4q5DVarXzxh0uwmJ0KTxsR7ie5361bWSwi8CaMIMRBOCCKTNVam4Hhd5KZJTrG9U69hVOWy7kvA',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAzYX4z84_SjsIg5eK1iwDssJdQ7QlH_gpV5oqHo1fDlhs4WJEFR5hG7HK0ap-fVqD8sjYNe7pmDETkCY0rEilKfrxzw-iUOeqBgdoP7UzDmIuWmdFhG84oh-hKHAi4RjyjRO2dyWHEWr43kgki-3f7PjkyV0Dqv7mFwu34R90Dhg8v9wu36GJ4fLbG_K9bGWNUuYXXIrQ-iTVJ_oOlAf5bfNxaqb7Fcpf-vig4PVg',
    'https://lh3.googleusercontent.com/aida-public/AB6AXuAlAYtnne3wX-aldy7YN81wMiHSQqddNu0Id-99N3pVXv4VuD6ksAyZTt8rbu-0cx38bY9R2uJPwcMwITH7cFCX-UTosYYBGgT7mwf9Gz2P7Q29OUY44A1VAkqn7vXQ3S-Mr3EeJiAamwpqjpFXJnHzXUk5fGgw-61b4MsqkmTdTulOw2xbK_g2WLEXgz3qg0GOj9v_tlufwGYj2Td448KZIEQeKzQPwqBe6sUtnAI',
  ];

  String get _colorName => ['Space Navy', 'Sandstone Matte', 'Matte Black', 'Chalk White'][_colorIndex];
  double get _price => widget.product.price;
  double get _oldPrice => widget.product.oldPrice ?? _price + 30;

  @override
  Widget build(BuildContext context) {
    final title = widget.product.name == 'Wireless Headphones'
        ? 'NOVA ANC Wireless Headphones - $_colorName'
        : widget.product.name;
    return Scaffold(
      backgroundColor: _canvas,
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          _appBar(),
          Expanded(child: ListView(
            padding: const EdgeInsets.only(bottom: 16),
            children: [
              _gallerySection(),
              _thumbnailRow(),
              _productSummary(title),
              _variants(),
              _specifications(),
              _deliveryCard(),
              _description(),
              _pairedItem(),
              const SizedBox(height: 14),
            ],
          )),
          _bottomBar(),
        ]),
      ),
    );
  }

  Widget _appBar() => Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(16, 7, 16, 9),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
            Text('09:41', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: _navy)),
            Row(children: [Icon(Icons.signal_cellular_alt, size: 15), SizedBox(width: 4), Icon(Icons.wifi, size: 15), SizedBox(width: 4), Icon(Icons.battery_full, size: 17)]),
          ]),
          const SizedBox(height: 9),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _circleButton(Icons.arrow_back, () => Navigator.of(context).maybePop()),
            Row(children: const [Text('NOVA', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: _navy)), SizedBox(width: 5), CircleAvatar(radius: 3, backgroundColor: _orange)]),
            Row(children: [
              _circleButton(Icons.share_outlined, () => _notice('Share product')),
              const SizedBox(width: 7),
              _circleButton(_saved ? Icons.favorite : Icons.favorite_border, () {
                setState(() => _saved = !_saved);
                widget.onWishlistChanged(_saved);
              }, color: _saved ? _orange : _navy),
            ]),
          ]),
        ]),
      );

  Widget _gallerySection() => Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
        child: AspectRatio(aspectRatio: 1.06, child: Container(
          decoration: BoxDecoration(color: Colors.white, border: Border.all(color: _border), borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          child: Stack(children: [
            Positioned.fill(child: Image.network(
              widget.product.name == 'Wireless Headphones' ? _gallery[_imageIndex] : widget.product.image,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.headphones_rounded, size: 120, color: Color(0xFFCBD3DC))),
            )),
            Positioned(left: 12, top: 12, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _badge('-34% FLASH', const Color(0xFFFFDBC9), const Color(0xFF763300)),
              const SizedBox(height: 6),
              _badge('✓  Top Rated', const Color(0xFF243B53), Colors.white),
            ])),
            Positioned(right: 12, top: 12, child: _circleButton(Icons.zoom_in, () => showDialog<void>(context: context, builder: (_) => Dialog(child: InteractiveViewer(child: Image.network(widget.product.image)))) , color: _navy)),
            Positioned(bottom: 12, left: 0, right: 0, child: Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(4, (i) { return AnimatedContainer(duration: const Duration(milliseconds: 180), margin: const EdgeInsets.symmetric(horizontal: 3), width: i == _imageIndex ? 24 : 7, height: 6, decoration: BoxDecoration(color: i == _imageIndex ? _orange : const Color(0xFFC3C6CD), borderRadius: BorderRadius.circular(8))); }))),
          ]),
        )),
      );

  Widget _thumbnailRow() => SizedBox(height: 76, child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (_, __) => const SizedBox(width: 9),
        itemBuilder: (_, i) => InkWell(
          onTap: () => setState(() => _imageIndex = i),
          borderRadius: BorderRadius.circular(9),
          child: Container(width: 56, padding: const EdgeInsets.all(3), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(9), border: Border.all(color: i == _imageIndex ? _orange : _border, width: i == _imageIndex ? 2 : 1)), child: i == 3 ? const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.videocam_outlined, size: 18, color: _muted), Text('360°', style: TextStyle(fontSize: 9, color: _muted))]) : ClipRRect(borderRadius: BorderRadius.circular(5), child: Image.network(widget.product.name == 'Wireless Headphones' ? _gallery[i] : widget.product.image, fit: BoxFit.cover))),
        ),
      ));

  Widget _productSummary(String title) => _card(
        margin: const EdgeInsets.fromLTRB(20, 2, 20, 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('NOVA AUDIO ARCHITECTURE', style: TextStyle(fontSize: 10, letterSpacing: 1.2, color: _orange, fontWeight: FontWeight.bold)), Text('SKU: NV-ANC-09', style: _pillText)]),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 21, height: 1.2, fontWeight: FontWeight.bold, color: _navy)),
          const SizedBox(height: 10),
          Wrap(spacing: 10, runSpacing: 7, crossAxisAlignment: WrapCrossAlignment.center, children: [
            Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5), decoration: BoxDecoration(color: const Color(0xFFEFF4FF), borderRadius: BorderRadius.circular(8)), child: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.star, size: 15, color: _orange), const SizedBox(width: 4), Text(widget.product.rating, style: const TextStyle(fontWeight: FontWeight.bold, color: _navy)), Text(' (${widget.product.reviews} reviews)', style: const TextStyle(fontSize: 11, color: _muted))])),
            const Icon(Icons.local_fire_department, color: Color(0xFF9A4600), size: 17), const Text('350+ ordered this week', style: TextStyle(fontSize: 11, color: _muted)),
          ]),
          const Divider(height: 24, color: _border),
          Row(children: [Text('\$${_price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: _navy)), const SizedBox(width: 9), Text('\$${_oldPrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 14, color: _muted, decoration: TextDecoration.lineThrough)), const Spacer(), _badge('Save \$${(_oldPrice - _price).toStringAsFixed(2)}', const Color(0xFFFFDBC9), const Color(0xFF763300))]),
        ]),
      );

  Widget _variants() => _card(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [const Text('Finish: ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: _navy)), Text(_colorName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: _orange)), const Spacer(), const Text('In Stock (14 units)', style: TextStyle(fontSize: 10, color: _muted))]),
          const SizedBox(height: 13),
          Row(children: List.generate(4, (i) {
            final colors = [const Color(0xFF243B53), const Color(0xFFD2C4BB), const Color(0xFF29313C), Colors.white];
            return GestureDetector(onTap: () => setState(() => _colorIndex = i), child: Container(width: 34, height: 34, margin: const EdgeInsets.only(right: 13), decoration: BoxDecoration(color: colors[i], shape: BoxShape.circle, border: Border.all(color: i == _colorIndex ? _orange : _border, width: i == _colorIndex ? 2 : 1), boxShadow: i == _colorIndex ? [const BoxShadow(color: Color(0x33FE893C), blurRadius: 0, spreadRadius: 2)] : null), child: i == _colorIndex ? const Icon(Icons.check, color: Colors.white, size: 15) : null));
          })),
          const SizedBox(height: 17),
          const Divider(height: 1, color: _border),
          const SizedBox(height: 13),
          Row(children: [const Text('Protection Plan', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: _navy)), const Spacer(), TextButton(onPressed: () => _notice('Standard includes one year of warranty.'), child: const Text('Compare Details', style: TextStyle(fontSize: 11, color: _muted, decoration: TextDecoration.underline)))]),
          Row(children: [
            Expanded(child: _planCard(0, 'Standard (1 Yr)', 'Included free')),
            const SizedBox(width: 9),
            Expanded(child: _planCard(1, 'Extended 2-Yr', '+\$12.00')),
          ]),
        ]),
      );

  Widget _planCard(int index, String title, String detail) => InkWell(
        onTap: () => setState(() => _planIndex = index),
        borderRadius: BorderRadius.circular(9),
        child: Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: _planIndex == index ? const Color(0xFFEFF4FF) : Colors.white, border: Border.all(color: _planIndex == index ? const Color(0xFF243B53) : _border, width: _planIndex == index ? 2 : 1), borderRadius: BorderRadius.circular(9)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Expanded(child: Text(title, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: _navy))), if (_planIndex == index) const Icon(Icons.check_circle, size: 16, color: _orange)]), const SizedBox(height: 5), Text(detail, style: const TextStyle(fontSize: 10, color: _muted))])),
      );

  Widget _specifications() => Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Padding(padding: EdgeInsets.only(bottom: 9), child: Text('Engineered Performance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _navy))),
    Row(children: [
      _spec(Icons.battery_charging_full, '40h', 'Playtime'), _spec(Icons.graphic_eq, '38dB', 'Active ANC', orange: true), _spec(Icons.bluetooth, 'v5.3', 'Multipoint'), _spec(Icons.bolt, '10 min', '5h Boost', orange: true),
    ]),
  ]));

  Widget _spec(IconData icon, String value, String label, {bool orange = false}) => Expanded(child: Container(margin: const EdgeInsets.only(right: 6), padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 3), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: _border)), child: Column(children: [CircleAvatar(radius: 16, backgroundColor: orange ? const Color(0xFFFFDBC9) : const Color(0xFFEFF4FF), child: Icon(icon, size: 17, color: orange ? const Color(0xFF9A4600) : _navy)), const SizedBox(height: 6), Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: _navy)), Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 9, color: _muted))])));

  Widget _deliveryCard() => _card(margin: const EdgeInsets.fromLTRB(20, 0, 20, 12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Row(crossAxisAlignment: CrossAxisAlignment.start, children: [const CircleAvatar(radius: 15, backgroundColor: Color(0xFFE6EEFD), child: Icon(Icons.local_shipping_outlined, size: 17, color: _navy)), const SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Free Priority Delivery', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: _navy)), SizedBox(height: 3), Text('Expected by Tomorrow, 2:00 PM to Brooklyn, NY', style: TextStyle(fontSize: 11, color: _muted))]))]),
    const Divider(height: 22, color: _border),
    const Row(children: [Expanded(child: _Guarantee(icon: Icons.published_with_changes, text: '30-day Free Trial')), Expanded(child: _Guarantee(icon: Icons.shield_outlined, text: 'Official 1-Yr Warranty'))]),
  ]));

  Widget _description() => _card(margin: const EdgeInsets.fromLTRB(20, 0, 20, 12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Text('Sonic Architecture', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _navy)),
    const SizedBox(height: 8),
    const Text('Designed with custom bio-cellulose 40mm drivers, the NOVA Space Navy headset combines tactile architectural acoustics with adaptive Hybrid ANC. Experience ultra-dense low end without masking crystalline vocal transients, encased in cloud-soft memory foam earcups.', style: TextStyle(fontSize: 13, height: 1.5, color: Color(0xFF43474D))),
    const SizedBox(height: 8),
    _accordion(0, 'Technical Specifications', Icons.tune, const ['Transducer: 40mm Dynamic Bio-Cellulose', 'Frequency response: 10Hz - 40,000Hz', 'Weight: 248g (Ultra-lightweight)', 'Audio codecs: LDAC, AAC, SBC']),
    _accordion(1, "What's in the Box", Icons.inventory_2_outlined, const ['NOVA ANC Headphones (Space Navy)', 'Molded Canvas Hard-shell Travel Case', 'Braided USB-C Fast Charging Cable', '3.5mm Audio pass-through cable']),
    _accordion(2, 'Customer Reviews  ·  4.8 / 5', Icons.star_outline, const ['Julian R.  ★★★★★', '“Astonishing ANC quality for \$59. Silenced a transcontinental flight engine noise completely.”', 'Read all 128 reviews →']),
  ]));

  Widget _accordion(int index, String title, IconData icon, List<String> lines) => Column(children: [
    const Divider(height: 18, color: _border),
    InkWell(onTap: () => setState(() => _expanded.contains(index) ? _expanded.remove(index) : _expanded.add(index)), child: Row(children: [Icon(icon, size: 17, color: _navy), const SizedBox(width: 8), Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: _navy))), Icon(_expanded.contains(index) ? Icons.expand_less : Icons.expand_more, color: _muted)])),
    if (_expanded.contains(index)) Container(width: double.infinity, margin: const EdgeInsets.only(top: 9), padding: const EdgeInsets.all(11), decoration: BoxDecoration(color: const Color(0xFFEFF4FF), borderRadius: BorderRadius.circular(9)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: lines.map((line) => Padding(padding: const EdgeInsets.symmetric(vertical: 3), child: Text(line, style: const TextStyle(fontSize: 11, color: Color(0xFF43474D))))).toList())),
  ]);

  Widget _pairedItem() => Padding(padding: const EdgeInsets.fromLTRB(20, 0, 20, 0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Padding(padding: EdgeInsets.only(bottom: 9), child: Text('Frequently Paired', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _navy))), _card(padding: const EdgeInsets.all(11), child: Row(children: [Container(width: 48, height: 48, decoration: BoxDecoration(color: const Color(0xFFEFF4FF), borderRadius: BorderRadius.circular(8)), child: Image.network(widget.product.image, fit: BoxFit.contain)), const SizedBox(width: 10), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Precision Headphone Stand', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: _navy)), SizedBox(height: 4), Text('+\$18.00   \$24.00', style: TextStyle(fontSize: 11, color: _orange, fontWeight: FontWeight.bold))])), OutlinedButton(onPressed: () => _notice('Stand added to your bag'), style: OutlinedButton.styleFrom(foregroundColor: _navy, side: const BorderSide(color: _navy), padding: const EdgeInsets.symmetric(horizontal: 12)), child: const Text('+ Add'))]))]));

  Widget _bottomBar() => Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
        decoration: const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: _border)), boxShadow: [BoxShadow(color: Color(0x18000000), blurRadius: 18, offset: Offset(0, -3))]),
        child: Row(children: [
          _smallAction(Icons.support_agent, () => _notice('Support chat')),
          const SizedBox(width: 8),
          _smallAction(Icons.shopping_bag_outlined, () => _notice('Open your bag')),
          const SizedBox(width: 9),
          Expanded(child: OutlinedButton(onPressed: _add, style: OutlinedButton.styleFrom(foregroundColor: _navy, side: const BorderSide(color: _navy), minimumSize: const Size(0, 48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))), child: Text(_added ? '✓ Added' : 'Add to Bag', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)))),
          const SizedBox(width: 8),
          Expanded(child: FilledButton(onPressed: () { _add(); _notice('Continue to checkout'); }, style: FilledButton.styleFrom(backgroundColor: _orange, foregroundColor: Colors.white, minimumSize: const Size(0, 48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11))), child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Buy Now', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)), SizedBox(width: 4), Icon(Icons.arrow_forward, size: 16)]))),
        ]),
      );

  void _add() {
    widget.onAddToCart();
    setState(() => _added = true);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product added to your bag'), duration: Duration(seconds: 1), behavior: SnackBarBehavior.floating));
  }

  void _notice(String message) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), duration: const Duration(seconds: 1), behavior: SnackBarBehavior.floating));

  Widget _smallAction(IconData icon, VoidCallback onTap) => InkWell(onTap: onTap, borderRadius: BorderRadius.circular(10), child: Container(width: 42, height: 48, decoration: BoxDecoration(color: const Color(0xFFEFF4FF), border: Border.all(color: _border), borderRadius: BorderRadius.circular(10)), child: Icon(icon, color: _navy, size: 20)));

  Widget _circleButton(IconData icon, VoidCallback onTap, {Color color = _navy}) => InkWell(onTap: onTap, borderRadius: BorderRadius.circular(24), child: Container(width: 36, height: 36, decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: _border)), child: Icon(icon, size: 19, color: color)));

  Widget _badge(String text, Color bg, Color fg) => Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)), child: Text(text, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: .3, color: fg)));

  Widget _card({required Widget child, EdgeInsets margin = EdgeInsets.zero, EdgeInsets padding = const EdgeInsets.all(14)}) => Container(margin: margin, padding: padding, decoration: BoxDecoration(color: Colors.white, border: Border.all(color: _border), borderRadius: BorderRadius.circular(13), boxShadow: const [BoxShadow(color: Color(0x08000000), blurRadius: 8, offset: Offset(0, 2))]), child: child);

  TextStyle get _pillText => const TextStyle(fontSize: 9, color: _muted, backgroundColor: Color(0xFFE6EEFD));
}

class _Guarantee extends StatelessWidget {
  const _Guarantee({required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) => Row(children: [Icon(icon, size: 16, color: const Color(0xFF9A4600)), const SizedBox(width: 5), Flexible(child: Text(text, style: const TextStyle(fontSize: 10, color: Color(0xFF43474D))))]);
}



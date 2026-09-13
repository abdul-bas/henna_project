// pubspec.yaml -> dependencies: provider: ^6.1.2

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// ---------------------------------------------------------------------------
/// AppColors — as provided
/// ---------------------------------------------------------------------------
class AppColors {
  AppColors._();

  static const Color background = Color(0xFFF3EEE4);
  static const Color sidebarBg = Color(0xFFFBF9F5);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);

  static const Color successBg = Color(0xFFE3EFE1);
  static const Color successText = Color(0xFF3E7A44);

  static const Color inkDark = Color(0xFF1B2A22);
  static const Color inkGreen = Color(0xFF16241C);
  static const Color brick = Color(0xFFA6573A);

  static const Color chipPeach = Color(0xFFF5DFCB);
  static const Color chipPeachText = Color(0xFFB4623B);
  static const Color textPrimary = Color(0xFF20281F);
  static const Color textSecondary = Color(0xFF7C8577);
  static const Color textMuted = Color(0xFFA9AFA2);

  static const Color primaryBrick = Color(0xFFB4623B);
  static const Color primaryBrickDark = Color(0xFF8C4A2C);

  static const Color sidebarDark = Color(0xFF16241E);
  static const Color divider = Color(0xFFE9E4D8);

  static const Color positiveBg = Color(0xFFE1EEDD);
  static const Color positiveText = Color(0xFF3E7C3F);

  static const Color dangerBg = Color(0xFFFCE8E4);

  static const Color warningBg = Color(0xFFF7E6D9);
  static const Color warningText = Color(0xFFB4632B);

  static const Color dangerText = Color(0xFFB4472B);
  static const Color pendingBg = Color(0xFFF3E3C7);
  static const Color pendingText = Color(0xFF9A6B1E);

  static const Color starGold = Color(0xFFE0A63A);

  static const Color chartDark = Color(0xFF1B2A22);
  static const Color chartBrick = Color(0xFFB06B4B);

  static const Color border = Color(0xFFE7E0D6);

  static const Color gold = Color(0xFFD9A441);
}

/// ---------------------------------------------------------------------------
/// PRODUCT FORM PROVIDER — single source of truth for the Add Product screen
/// ---------------------------------------------------------------------------
enum ProductStatus { active, draft }

class ProductFormProvider extends ChangeNotifier {
  // Text controllers live here so both the provider and the widgets
  // that need raw TextEditingControllers can share the same instances.
  final nameCtrl = TextEditingController(
    text: 'Organic Rajasthani Henna Powder',
  );
  final descCtrl = TextEditingController(
    text:
        'Triple-sifted, chemical-free body art quality henna sourced '
        'directly from Sojat farms. Deep, long-lasting maroon stain.',
  );
  final skuCtrl = TextEditingController(text: 'HNA-RJ-100G');
  final priceCtrl = TextEditingController(text: '349');
  final compareCtrl = TextEditingController(text: '449');
  final costCtrl = TextEditingController(text: '180');
  final stockCtrl = TextEditingController(text: '240');
  final weightCtrl = TextEditingController(text: '100');
  final tagCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final List<String> categories = const [
    'Body Art Henna',
    'Hair Henna',
    'Henna Cones',
    'Henna Kits',
    'Aftercare',
  ];

  String _category = 'Body Art Henna';
  String get category => _category;
  set category(String value) {
    _category = value;
    notifyListeners();
  }

  ProductStatus _status = ProductStatus.active;
  ProductStatus get status => _status;
  set status(ProductStatus value) {
    _status = value;
    notifyListeners();
  }

  bool _trackInventory = true;
  bool get trackInventory => _trackInventory;
  set trackInventory(bool value) {
    _trackInventory = value;
    notifyListeners();
  }

  bool _isSaving = false;
  bool get isSaving => _isSaving;

  bool _isDirty = false;
  bool get isDirty => _isDirty;

  final List<String> _tags = ['Natural', 'Bridal', 'Sojat'];
  List<String> get tags => List.unmodifiable(_tags);

  final List<String?> _images = List<String?>.filled(5, null);
  List<String?> get images => List.unmodifiable(_images);

  ProductFormProvider() {
    for (final c in [
      nameCtrl,
      descCtrl,
      skuCtrl,
      priceCtrl,
      compareCtrl,
      costCtrl,
      stockCtrl,
      weightCtrl,
    ]) {
      c.addListener(_markDirty);
    }
  }

  void _markDirty() {
    if (!_isDirty) {
      _isDirty = true;
      notifyListeners();
    }
  }

  void addTag(String value) {
    final v = value.trim();
    if (v.isEmpty || _tags.contains(v)) return;
    _tags.add(v);
    tagCtrl.clear();
    _isDirty = true;
    notifyListeners();
  }

  void removeTag(String tag) {
    _tags.remove(tag);
    _isDirty = true;
    notifyListeners();
  }

  void setImageSlot(int index, String path) {
    if (index < 0 || index >= _images.length) return;
    _images[index] = path;
    _isDirty = true;
    notifyListeners();
  }

  /// Returns true on success. Sets isSaving state along the way so the UI
  /// (top bar Save button) can reactively show a spinner.
  Future<bool> save() async {
    if (!formKey.currentState!.validate()) return false;
    _isSaving = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 900));

    _isSaving = false;
    _isDirty = false;
    notifyListeners();
    return true;
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    descCtrl.dispose();
    skuCtrl.dispose();
    priceCtrl.dispose();
    compareCtrl.dispose();
    costCtrl.dispose();
    stockCtrl.dispose();
    weightCtrl.dispose();
    tagCtrl.dispose();
    super.dispose();
  }
}

/// ---------------------------------------------------------------------------
/// Entry point (for standalone preview). Remove if wiring into an existing app.
/// ---------------------------------------------------------------------------

class HennaAdminApp extends StatelessWidget {
  const HennaAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Henna Product',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryBrick,
          primary: AppColors.primaryBrick,
        ),
      ),
      home: ChangeNotifierProvider(
        create: (_) => ProductFormProvider(),
        child: const AddProductScreen(),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// ADD PRODUCT SCREEN — web-only content area (no sidebar / nav rail)
/// Reads/writes state via ProductFormProvider (context.watch / context.read).
/// ---------------------------------------------------------------------------
class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  Future<void> _handleSave(BuildContext context) async {
    final provider = context.read<ProductFormProvider>();
    final ok = await provider.save();
    if (!context.mounted || !ok) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.inkGreen,
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: AppColors.gold, size: 18),
            const SizedBox(width: 10),
            Text(
              'Product saved successfully',
              style: TextStyle(color: AppColors.surface),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductFormProvider>();

    return SafeArea(
      child: Column(
        children: [
          Center(
            child: Form(
              key: provider.formKey,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 860;
                  const leftColumn = _LeftColumn();
                  const rightColumn = _RightColumn();

                  if (isWide) {
                    return const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 7, child: leftColumn),
                        SizedBox(width: 24),
                        Expanded(flex: 4, child: rightColumn),
                      ],
                    );
                  }
                  return const Column(
                    children: [leftColumn, SizedBox(height: 24), rightColumn],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// TOP BAR
/// ---------------------------------------------------------------------------
class _TopBar extends StatelessWidget {
  final bool isSaving;
  final bool isDirty;
  final VoidCallback onSave;

  const _TopBar({
    required this.isSaving,
    required this.isDirty,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            child: const Padding(
              padding: EdgeInsets.all(6),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 20,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add New Product',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                isDirty
                    ? 'Henna Catalogue · Unsaved changes'
                    : 'Henna Catalogue · All changes saved',
                style: const TextStyle(
                  fontSize: 12.5,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const Spacer(),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.textPrimary,
              side: const BorderSide(color: AppColors.border),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Cancel'),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: isSaving ? null : onSave,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBrick,
              foregroundColor: AppColors.surface,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: isSaving
                ? const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(AppColors.surface),
                    ),
                  )
                : const Text(
                    'Save Product',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
          ),
        ],
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// LEFT COLUMN — Images, Basic Info, Pricing
/// ---------------------------------------------------------------------------
class _LeftColumn extends StatelessWidget {
  const _LeftColumn();

  @override
  Widget build(BuildContext context) {
    // read (not watch) since text field state is handled by the controllers
    // themselves; this widget doesn't need to rebuild on every keystroke.
    final provider = context.read<ProductFormProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionCard(
          title: 'Product Images',
          subtitle: 'Add up to 6 images. First image is the cover.',
          child: _ImageUploadGrid(),
        ),
        const SizedBox(height: 20),
        _SectionCard(
          title: 'Basic Information',
          subtitle: 'Name and description customers will see.',
          child: Column(
            children: [
              _LabeledField(
                label: 'Product name',
                child: _AppTextField(
                  controller: provider.nameCtrl,
                  hint: 'e.g. Organic Rajasthani Henna Powder',
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Product name is required'
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              _LabeledField(
                label: 'Description',
                child: _AppTextField(
                  controller: provider.descCtrl,
                  hint: 'Describe the henna quality, origin, and usage...',
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _SectionCard(
          title: 'Pricing',
          subtitle: 'Set the sale price and cost for margin tracking.',
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _LabeledField(
                  label: 'Price',
                  child: _AppTextField(
                    controller: provider.priceCtrl,
                    hint: '0.00',
                    prefixText: '₹ ',
                    keyboardType: TextInputType.number,
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'Required' : null,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _LabeledField(
                  label: 'Compare-at price',
                  child: _AppTextField(
                    controller: provider.compareCtrl,
                    hint: '0.00',
                    prefixText: '₹ ',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _LabeledField(
                  label: 'Cost per item',
                  child: _AppTextField(
                    controller: provider.costCtrl,
                    hint: '0.00',
                    prefixText: '₹ ',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// ---------------------------------------------------------------------------
/// RIGHT COLUMN — Status, Inventory, Tags
/// ---------------------------------------------------------------------------
class _RightColumn extends StatelessWidget {
  const _RightColumn();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProductFormProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionCard(
          title: 'Status',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Selector rebuilds only when status changes, not on every
              // provider notifyListeners() call (e.g. from text fields).
              Selector<ProductFormProvider, ProductStatus>(
                selector: (_, p) => p.status,
                builder: (context, status, _) => _StatusPill(
                  status: status,
                  onChanged: (v) =>
                      context.read<ProductFormProvider>().status = v,
                ),
              ),
              const SizedBox(height: 14),
              const Divider(height: 1, color: AppColors.divider),
              const SizedBox(height: 14),
              Selector<ProductFormProvider, String>(
                selector: (_, p) => p.category,
                builder: (context, category, _) => _CategoryDropdown(
                  value: category,
                  items: provider.categories,
                  onChanged: (v) =>
                      context.read<ProductFormProvider>().category =
                          v ?? category,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _SectionCard(
          title: 'Inventory',
          subtitle: 'Track stock levels for this henna product.',
          child: Column(
            children: [
              _LabeledField(
                label: 'SKU',
                child: _AppTextField(
                  controller: provider.skuCtrl,
                  hint: 'HNA-000',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _LabeledField(
                      label: 'Stock quantity',
                      child: _AppTextField(
                        controller: provider.stockCtrl,
                        hint: '0',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _LabeledField(
                      label: 'Weight (g)',
                      child: _AppTextField(
                        controller: provider.weightCtrl,
                        hint: '0',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Selector<ProductFormProvider, bool>(
                selector: (_, p) => p.trackInventory,
                builder: (context, trackInventory, _) => Row(
                  children: [
                    Switch(
                      value: trackInventory,
                      activeColor: AppColors.primaryBrick,
                      onChanged: (v) =>
                          context.read<ProductFormProvider>().trackInventory =
                              v,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Track inventory for this product',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _SectionCard(
          title: 'Tags',
          subtitle: 'Help customers find this product.',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Selector<ProductFormProvider, List<String>>(
                selector: (_, p) => p.tags,
                builder: (context, tags, _) => Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tags
                      .map(
                        (t) => _TagChip(
                          label: t,
                          onRemove: () =>
                              context.read<ProductFormProvider>().removeTag(t),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 12),
              _AppTextField(
                controller: provider.tagCtrl,
                hint: 'Type a tag and press enter',
                onSubmitted: (v) =>
                    context.read<ProductFormProvider>().addTag(v),
                suffixIcon: Icons.add_rounded,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// ---------------------------------------------------------------------------
/// Section card wrapper
/// ---------------------------------------------------------------------------
class _SectionCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;

  const _SectionCard({required this.title, this.subtitle, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15.5,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle!,
              style: const TextStyle(
                fontSize: 12.5,
                color: AppColors.textSecondary,
              ),
            ),
          ],
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Labeled field wrapper
/// ---------------------------------------------------------------------------
class _LabeledField extends StatelessWidget {
  final String label;
  final Widget child;

  const _LabeledField({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

/// ---------------------------------------------------------------------------
/// Reusable text field styled to the palette
/// ---------------------------------------------------------------------------
class _AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final String? prefixText;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;

  const _AppTextField({
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.prefixText,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textMuted, fontSize: 14),
        prefixText: prefixText,
        prefixStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 14,
        ),
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, size: 18, color: AppColors.textSecondary)
            : null,
        filled: true,
        fillColor: AppColors.background,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.primaryBrick,
            width: 1.4,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.dangerText),
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Category dropdown
/// ---------------------------------------------------------------------------
class _CategoryDropdown extends StatelessWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const _CategoryDropdown({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category',
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.border),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.textSecondary,
              ),
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
              items: items
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}

/// ---------------------------------------------------------------------------
/// Status pill selector (Active / Draft)
/// ---------------------------------------------------------------------------
class _StatusPill extends StatelessWidget {
  final ProductStatus status;
  final ValueChanged<ProductStatus> onChanged;

  const _StatusPill({required this.status, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final options = {
      ProductStatus.active: 'Active',
      ProductStatus.draft: 'Draft',
    };
    return Row(
      children: options.entries.map((entry) {
        final selected = entry.key == status;
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () => onChanged(entry.key),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
              decoration: BoxDecoration(
                color: selected ? AppColors.positiveBg : AppColors.background,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selected ? AppColors.positiveText : AppColors.border,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected
                          ? AppColors.positiveText
                          : AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    entry.value,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: selected
                          ? AppColors.positiveText
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Tag chip
/// ---------------------------------------------------------------------------
class _TagChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _TagChip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.chipPeach,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: AppColors.chipPeachText,
            ),
          ),
          const SizedBox(width: 6),
          InkWell(
            onTap: onRemove,
            child: const Icon(
              Icons.close_rounded,
              size: 14,
              color: AppColors.chipPeachText,
            ),
          ),
        ],
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Image upload grid — reads/writes image slots via the provider
/// ---------------------------------------------------------------------------
class _ImageUploadGrid extends StatelessWidget {
  const _ImageUploadGrid();

  @override
  Widget build(BuildContext context) {
    return Selector<ProductFormProvider, List<String?>>(
      selector: (_, p) => p.images,
      builder: (context, images, _) {
        return Wrap(
          spacing: 14,
          runSpacing: 14,
          children: List.generate(images.length, (i) {
            return _UploadTile(
              isCover: i == 0,
              filled: images[i] != null,
              onTap: () => context.read<ProductFormProvider>().setImageSlot(
                i,
                'placeholder.jpg',
              ),
            );
          }),
        );
      },
    );
  }
}

class _UploadTile extends StatelessWidget {
  final bool isCover;
  final bool filled;
  final VoidCallback onTap;

  const _UploadTile({
    required this.isCover,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 132,
        height: 132,
        decoration: BoxDecoration(
          color: filled ? AppColors.chipPeach : AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              filled
                  ? Icons.check_circle_rounded
                  : (isCover
                        ? Icons.add_photo_alternate_rounded
                        : Icons.add_rounded),
              color: filled ? AppColors.chipPeachText : AppColors.textMuted,
              size: 26,
            ),
            const SizedBox(height: 8),
            Text(
              filled ? 'Uploaded' : (isCover ? 'Cover image' : 'Add image'),
              style: const TextStyle(
                fontSize: 11.5,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

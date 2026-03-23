import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../services/supabase_service.dart';

class AddRatingScreen extends StatefulWidget {
  final String productId;
  final String productTitle;
  final VoidCallback onRatingAdded;
  const AddRatingScreen({
    super.key, 
    required this.productId, 
    required this.productTitle,
    required this.onRatingAdded,
  });

  @override
  State<AddRatingScreen> createState() => _AddRatingScreenState();
}

class _AddRatingScreenState extends State<AddRatingScreen> {
  double _rating = 0;
  final TextEditingController _commentController = TextEditingController();
  List<File> _selectedImages = [];
  bool _isSubmitting = false;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppBar(title: 'Ø£Ø¶Ù ØªÙÙÙÙÙ'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text('ÙÙÙ ÙØ°Ø§ Ø§ÙÙÙØªØ¬', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    Text(widget.productTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 24),
                    
                    // ÙØ¬ÙÙ Ø§ÙØªÙÙÙÙ
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _rating = index + 1;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              index < _rating ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                              size: 40,
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _rating == 0 ? 'Ø§Ø®ØªØ± Ø§ÙØªÙÙÙÙ' : 'ØªÙÙÙÙ: $_rating ÙÙ 5',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Ø­ÙÙ Ø§ÙØªØ¹ÙÙÙ
            TextField(
              controller: _commentController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Ø§ÙØªØ¨ ØªØ¹ÙÙÙÙ (Ø§Ø®ØªÙØ§Ø±Ù)',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: 'Ø´Ø§Ø±Ù ØªØ¬Ø±Ø¨ØªÙ ÙØ¹ ÙØ°Ø§ Ø§ÙÙÙØªØ¬...',
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Ø±ÙØ¹ Ø§ÙØµÙØ±
            const Text('Ø¥Ø¶Ø§ÙØ© ØµÙØ± (Ø§Ø®ØªÙØ§Ø±Ù)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _selectedImages.length + 1,
                itemBuilder: (ctx, i) {
                  if (i == _selectedImages.length) {
                    return GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppTheme.goldColor.withOpacity(0.5), style: BorderStyle.solid),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_photo_alternate, color: AppTheme.goldColor, size: 30),
                            const SizedBox(height: 4),
                            const Text('Ø¥Ø¶Ø§ÙØ© ØµÙØ±Ø©', style: TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                    );
                  }
                  return Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: FileImage(_selectedImages[i]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 12,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedImages.removeAt(i);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.close, color: Colors.white, size: 12),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Ø²Ø± Ø§ÙØ¥Ø±Ø³Ø§Ù
            CustomButton(
              text: 'Ø¥Ø±Ø³Ø§Ù Ø§ÙØªÙÙÙÙ',
              onPressed: _rating == 0 ? null : _submitRating,
              isLoading: _isSubmitting,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImages.add(File(image.path));
      });
    }
  }

  Future<void> _submitRating() async {
    setState(() => _isSubmitting = true);

    // ÙÙØ§ ÙÙÙÙ Ø±ÙØ¹ Ø§ÙØµÙØ± Ø¥ÙÙ Supabase Storage ÙØ§ÙØ­ØµÙÙ Ø¹ÙÙ Ø§ÙØ±ÙØ§Ø¨Ø·
    List<String> imageUrls = [];
    // ... Ø±ÙØ¹ Ø§ÙØµÙØ± ...

    final success = await SupabaseService.addRating(
      productId: widget.productId,
      rating: _rating,
      comment: _commentController.text.isNotEmpty ? _commentController.text : null,

    );

    if (!mounted) return;

    setState(() => _isSubmitting = false);

    if (success) {
      widget.onRatingAdded();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ØªÙ Ø¥Ø¶Ø§ÙØ© ØªÙÙÙÙÙ Ø¨ÙØ¬Ø§Ø­!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ø­Ø¯Ø« Ø®Ø·Ø£Ø Ø­Ø§ÙÙ ÙØ±Ø© Ø£Ø®Ø±Ù'), backgroundColor: Colors.red),
      );
    }
  }
}
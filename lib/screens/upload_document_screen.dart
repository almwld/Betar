import 'package:flex_yemen/models/rating_model.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';

class UploadDocumentScreen extends StatefulWidget {
  const UploadDocumentScreen({super.key});

  @override
  State<UploadDocumentScreen> createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  List<File> _selectedFiles = [];
  bool _isLoading = false;

  Future<void> _pickFiles() async {
    // Ø·ÙØ¨ Ø§ÙØ¥Ø°Ù Ø£ÙÙØ§Ù
    var status = await Permission.storage.request();
    
    if (status.isGranted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'txt', 'jpg', 'jpeg', 'png'],
      );

      if (result != null) {
        setState(() {
          _selectedFiles = result.paths.map((path) => File(path!)).toList();
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ø§ÙØ±Ø¬Ø§Ø¡ Ø§ÙØ³ÙØ§Ø­ Ø¨Ø§ÙÙØµÙÙ Ø¥ÙÙ Ø§ÙÙÙÙØ§Øª')),
      );
    }
  }

  Future<void> _uploadFiles() async {
    if (_selectedFiles.isEmpty) return;
    
    setState(() => _isLoading = true);
    
    // ÙØ­Ø§ÙØ§Ø© Ø±ÙØ¹ Ø§ÙÙÙÙØ§Øª
    await Future.delayed(const Duration(seconds: 2));
    
    setState(() => _isLoading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('ØªÙ Ø±ÙØ¹ Ø§ÙÙÙÙØ§Øª Ø¨ÙØ¬Ø§Ø­')),
    );
    
    setState(() => _selectedFiles.clear());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø±ÙØ¹ Ø§ÙÙØ³ØªÙØ¯Ø§Øª'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ÙÙØ·ÙØ© Ø±ÙØ¹ Ø§ÙÙÙÙØ§Øª
            GestureDetector(
              onTap: _pickFiles,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppTheme.goldColor.withOpacity(0.5),
                    style: BorderStyle.solid,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_upload,
                      size: 60,
                      color: AppTheme.goldColor.withOpacity(0.7),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Ø§Ø¶ØºØ· ÙØ§Ø®ØªÙØ§Ø± Ø§ÙÙÙÙØ§Øª',
                      style: TextStyle(
                        fontFamily: 'Changa',
                        fontSize: 16,
                        color: isDark ? AppTheme.darkText : AppTheme.lightText,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'PDF, DOC, XLS, TXT, ØµÙØ±',
                      style: TextStyle(
                        fontFamily: 'Changa',
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // ÙØ§Ø¦ÙØ© Ø§ÙÙÙÙØ§Øª Ø§ÙÙØ®ØªØ§Ø±Ø©
            if (_selectedFiles.isNotEmpty) ...[
              const Text(
                'Ø§ÙÙÙÙØ§Øª Ø§ÙÙØ®ØªØ§Ø±Ø©:',
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _selectedFiles.length,
                itemBuilder: (context, index) {
                  final file = _selectedFiles[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.insert_drive_file,
                          color: AppTheme.goldColor,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                file.path.split('/').last,
                                style: const TextStyle(
                                  fontFamily: 'Changa',
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${(file.lengthSync() / 1024).toStringAsFixed(2)} KB',
                                style: TextStyle(
                                  fontFamily: 'Changa',
                                  fontSize: 11,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _selectedFiles.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Ø±ÙØ¹ Ø§ÙÙÙÙØ§Øª',
                onPressed: _uploadFiles,
                isLoading: _isLoading,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
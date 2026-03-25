import os
import chardet

def try_decode(data, encodings):
    for enc in encodings:
        try:
            return data.decode(enc)
        except UnicodeDecodeError:
            continue
    return None

def fix_file(filepath):
    with open(filepath, 'rb') as f:
        raw = f.read()
    
    # 1. اكتشاف الترميز الحالي
    detected = chardet.detect(raw)
    enc = detected['encoding']
    
    # 2. قائمة الترميزات المحتملة
    candidates = []
    if enc and enc.lower() in ['utf-8', 'ascii']:
        candidates = ['utf-8', 'windows-1256', 'iso-8859-6', 'cp1256']
    else:
        candidates = [enc, 'windows-1256', 'iso-8859-6', 'cp1256', 'utf-8']
    
    # 3. محاولة فك التشفير
    text = try_decode(raw, candidates)
    if text is None:
        print(f"⚠️ لا يمكن فك ترميز: {filepath}")
        return
    
    # 4. إعادة الكتابة بصيغة UTF-8
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(text)
    print(f"✅ تم إصلاح: {filepath} (باستخدام {enc})")

# معالجة كل ملف Dart
for root, dirs, files in os.walk('.'):
    for file in files:
        if file.endswith('.dart'):
            fix_file(os.path.join(root, file))

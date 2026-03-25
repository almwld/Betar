import os
import sys

def fix_file(filepath):
    try:
        with open(filepath, 'rb') as f:
            data = f.read()
        # حاول تفسير البايتات كـ windows-1256 (قد ينتج UTF-8 صحيحاً)
        try:
            # تحويل مباشر من windows-1256 إلى UTF-8 (يعيد تشكيل النص)
            decoded = data.decode('windows-1256')
            # احفظه كـ UTF-8
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(decoded)
            print(f"✓ Fixed: {filepath}")
        except UnicodeDecodeError:
            # إذا فشل، حاول iso-8859-6
            try:
                decoded = data.decode('iso-8859-6')
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(decoded)
                print(f"✓ Fixed (iso-8859-6): {filepath}")
            except:
                print(f"⚠️ Skipped: {filepath}")
    except Exception as e:
        print(f"❌ Error: {filepath} - {e}")

for root, dirs, files in os.walk('.'):
    for file in files:
        if file.endswith('.dart'):
            full = os.path.join(root, file)
            fix_file(full)

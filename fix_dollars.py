import os

files = ['lib/screens/dashboard_screen.dart', 'lib/screens/category_detail_screen.dart']

for filepath in files:
    try:
        with open(filepath, 'r') as file:
            content = file.read()
            
        # Replaces the double backslash (\\$) with a single one (\$)
        fixed_content = content.replace('\\\\$', '\\$')
        
        with open(filepath, 'w') as file:
            file.write(fixed_content)
            
        print(f"✅ Successfully fixed: {filepath}")
    except Exception as e:
        print(f"❌ Error with {filepath}: {e}")


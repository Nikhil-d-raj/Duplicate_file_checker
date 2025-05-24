# Duplicate File Checker (Near-Duplicate Detection Script)

This Bash script is used to detect near-duplicate files in a given directory based on:
- File size
- File name (ignoring the file extension)

### 🚀 Features

- Works recursively in the given directory
- Ignores extensions (`file1.txt`, `file1.csv` → treated as similar)
- Avoids reprocessing using a temp file
- Can be extended to check file content with hash (future improvement)

---

### 🛠️ Usage

```bash
./check_duplicate_files.sh /path_of_the_dir

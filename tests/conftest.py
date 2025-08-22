import os
import sys
import shutil
from pathlib import Path

# Ensure repo root is on sys.path so `from app.main import app` works
REPO_ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(REPO_ROOT))

def ensure_link_or_copy(dst_name: str, src_rel: str):
    dst = REPO_ROOT / dst_name
    src = REPO_ROOT / src_rel
    if dst.exists():
        return
    dst_parent = dst.parent
    dst_parent.mkdir(parents=True, exist_ok=True)

    # Try to symlink first (works on Linux runners)
    try:
        dst.symlink_to(src, target_is_directory=src.is_dir())
        return
    except Exception:
        pass

    # Fallback: copy
    if src.is_dir():
        shutil.copytree(src, dst)
    else:
        shutil.copy2(src, dst)

# Your app mounts/loads these relative to CWD
ensure_link_or_copy("static", "app/static")
ensure_link_or_copy("templates", "app/templates")

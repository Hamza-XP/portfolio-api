import os
import sys
import shutil
from pathlib import Path

# --- Repo root setup ---
REPO_ROOT = Path(__file__).resolve().parents[1]

# Ensure repo root is on sys.path (so `from app.main import app` works)
sys.path.insert(0, str(REPO_ROOT))

# --- Fix import for `data` ---
# Your app expects `from data import ...`, but actually it's in `app/data.py`.
try:
    import app.data as _data
    sys.modules["data"] = _data
except ImportError:
    pass

# --- Ensure static/templates exist for tests (copy or symlink) ---
def ensure_link_or_copy(dst_name: str, src_rel: str):
    dst = REPO_ROOT / dst_name
    src = REPO_ROOT / src_rel
    if dst.exists():
        return
    dst.parent.mkdir(parents=True, exist_ok=True)

    try:
        # Try symlink (works on Linux/GitHub runners)
        dst.symlink_to(src, target_is_directory=src.is_dir())
        return
    except Exception:
        pass

    # Fallback: copy
    if src.is_dir():
        shutil.copytree(src, dst)
    else:
        shutil.copy2(src, dst)

ensure_link_or_copy("static", "app/static")
ensure_link_or_copy("templates", "app/templates")

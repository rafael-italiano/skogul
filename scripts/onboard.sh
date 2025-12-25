#!/usr/bin/env bash
set -euo pipefail

PYTHON_VERSION="3.14"

echo "🚀 Bootstrapping development environment..."

# --------------------------------------------------
# 1. Install uv if missing
# --------------------------------------------------
if ! command -v uv >/dev/null 2>&1; then
  echo "📦 uv not found. Installing uv..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
  export PATH="$HOME/.cargo/bin:$PATH"
else
  echo "✅ uv already installed"
fi

# --------------------------------------------------
# 2. Ensure correct Python version
# --------------------------------------------------
echo "🐍 Ensuring Python ${PYTHON_VERSION} is available..."
uv python install "${PYTHON_VERSION}"

# --------------------------------------------------
# 3. Sync project dependencies
# --------------------------------------------------
echo "📚 Syncing project dependencies..."
uv sync

# --------------------------------------------------
# 4. Install pre-commit as a uv tool (not project dep)
# --------------------------------------------------
if ! command -v pre-commit >/dev/null 2>&1; then
  echo "🪝 Installing pre-commit..."
  uv tool install pre-commit
else
  echo "✅ pre-commit already installed"
fi

# --------------------------------------------------
# 5. Install git hooks
# --------------------------------------------------
echo "🔗 Installing pre-commit hooks..."
pre-commit install

echo "🎉 Setup complete!"
echo
echo "You can now run:"
echo "  uv run python --version"
echo "  pre-commit run --all-files"

#!/usr/bin/env bash
# 把当前分支合并到 daily 并推送到远端，完成后切回原分支
set -euo pipefail

src=$(git branch --show-current)

if [[ -z "$src" ]]; then
  echo "error: 不在任何分支上（detached HEAD？）" >&2
  exit 1
fi

if [[ "$src" == "daily" ]]; then
  echo "error: 当前已在 daily，无需合并" >&2
  exit 1
fi

if ! git diff-index --quiet HEAD --; then
  echo "error: 工作区有未提交改动，请先提交或暂存" >&2
  exit 1
fi

echo "==> 源分支: $src"
git fetch origin daily
git checkout daily
git pull --ff-only origin daily
git merge --no-edit "$src"
git push origin daily
git checkout "$src"

echo "==> 完成: $src → daily（已推送）"

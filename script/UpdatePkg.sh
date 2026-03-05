#!/bin/bash

# --------------------------------------------------

# Source

source "$ZD_LibPath/private/getApp.sh"

# --------------------------------------------------

# ZeroWrtExcludePackages
ZeroWrtExcludePackages=(
  'frp'
)

# UpdatePkg
exclude=()
for excludePackage in "${ZeroWrtExcludePackages[@]}"; do
  exclude+=(--exclude "$excludePackage")
done
appPath=$(getApp 'zerowrt-makefile-linux-amd64') || exit 1
"$appPath" updatepkg \
  "${exclude[@]}" \
  --wrtPath "$WRT_MainPath" \
  --outputPath "$CI_UpdatePath"
cp -a "$CI_UpdatePath/makefile" "$ZD_ReleaseUploadPath/makefile"

#!/bin/bash

# --------------------------------------------------

# Source

source "$ZD_LibPath/private/getLib.sh"

# --------------------------------------------------

# ZeroWrtExcludePackages
ZeroWrtExcludePackages=(
  # 'frp'
)

# UpdatePkg
excludePackages=()
for exclude in "${ZeroWrtExcludePackages[@]}"; do
  excludePackages+=(--exclude "$exclude")
done
appPath=$(getLib 'zerowrt-makefile-linux-amd64') || exit 1
"$appPath" updatepkg \
  "${excludePackages[@]}" \
  --wrtPath "$WRT_MainPath" \
  --outputPath "$CI_UpdatePath"
cp -a "$CI_UpdatePath/makefile" "$ZD_ReleaseUploadPath/makefile"

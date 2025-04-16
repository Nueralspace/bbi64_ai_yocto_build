#!/bin/bash
set -e

echo "Sourcing oe-init-build-env..."
source poky/oe-init-build-env

# The build environment sets the working directory to the build directory.
BUILD_DIR="${PWD}"
PROJECT_ROOT="$(dirname "${BUILD_DIR}")"

BBLAYERS_CONF="${BUILD_DIR}/conf/bblayers.conf"
LOCAL_CONF="${BUILD_DIR}/conf/local.conf"

LAYERS="BBLAYERS ?= \" \\
  ${PROJECT_ROOT}/poky/meta \\
  ${PROJECT_ROOT}/poky/meta-poky \\
  ${PROJECT_ROOT}/poky/meta-yocto-bsp \\
  ${PROJECT_ROOT}/meta-ti/meta-beagle \\
  ${PROJECT_ROOT}/meta-ti/meta-ti-bsp \\
  ${PROJECT_ROOT}/meta-ti/meta-ti-extras \\
  ${PROJECT_ROOT}/meta-arm/meta-arm \\
  ${PROJECT_ROOT}/meta-arm/meta-arm-bsp \\
  ${PROJECT_ROOT}/meta-arm/meta-arm-toolchain \\
  \""

echo "Updating bblayers.conf at ${BBLAYERS_CONF} ..."
# Replace the existing BBLAYERS entry with the updated list
sed -E -i '/^BBLAYERS[[:space:]]*\?=/,/^[[:space:]]*"[[:space:]]*$/d' "${BBLAYERS_CONF}"

echo -e "\n${LAYERS}" >> "${BBLAYERS_CONF}"

echo "Updating local.conf at ${LOCAL_CONF} to set MACHINE to beaglebone-ai64 ..."
# Force the local.conf MACHINE setting to beaglebone-ai64
sed -i 's/^MACHINE[[:space:]]*[?]*=[[:space:]]*.*/MACHINE ?= "beaglebone-ai64"/' "${LOCAL_CONF}"

echo "Setup completed successfully."

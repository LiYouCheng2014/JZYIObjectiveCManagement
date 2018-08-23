#!/bin/sh
set -e
set -u
set -o pipefail

if [ -z ${UNLOCALIZED_RESOURCES_FOLDER_PATH+x} ]; then
    # If UNLOCALIZED_RESOURCES_FOLDER_PATH is not set, then there's nowhere for us to copy
    # resources to, so exit 0 (signalling the script phase was successful).
    exit 0
fi

mkdir -p "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy-${TARGETNAME}.txt
> "$RESOURCES_TO_COPY"

XCASSET_FILES=()

# This protects against multiple targets copying the same framework dependency at the same time. The solution
# was originally proposed here: https://lists.samba.org/archive/rsync/2008-February/020158.html
RSYNC_PROTECT_TMP_FILES=(--filter "P .*.??????")

case "${TARGETED_DEVICE_FAMILY:-}" in
  1,2)
    TARGET_DEVICE_ARGS="--target-device ipad --target-device iphone"
    ;;
  1)
    TARGET_DEVICE_ARGS="--target-device iphone"
    ;;
  2)
    TARGET_DEVICE_ARGS="--target-device ipad"
    ;;
  3)
    TARGET_DEVICE_ARGS="--target-device tv"
    ;;
  4)
    TARGET_DEVICE_ARGS="--target-device watch"
    ;;
  *)
    TARGET_DEVICE_ARGS="--target-device mac"
    ;;
esac

install_resource()
{
  if [[ "$1" = /* ]] ; then
    RESOURCE_PATH="$1"
  else
    RESOURCE_PATH="${PODS_ROOT}/$1"
  fi
  if [[ ! -e "$RESOURCE_PATH" ]] ; then
    cat << EOM
error: Resource "$RESOURCE_PATH" not found. Run 'pod install' to update the copy resources script.
EOM
    exit 1
  fi
  case $RESOURCE_PATH in
    *.storyboard)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile ${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .storyboard`.storyboardc $RESOURCE_PATH --sdk ${SDKROOT} ${TARGET_DEVICE_ARGS}" || true
      ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .storyboard`.storyboardc" "$RESOURCE_PATH" --sdk "${SDKROOT}" ${TARGET_DEVICE_ARGS}
      ;;
    *.xib)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile ${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .xib`.nib $RESOURCE_PATH --sdk ${SDKROOT} ${TARGET_DEVICE_ARGS}" || true
      ibtool --reference-external-strings-file --errors --warnings --notices --minimum-deployment-target ${!DEPLOYMENT_TARGET_SETTING_NAME} --output-format human-readable-text --compile "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$RESOURCE_PATH\" .xib`.nib" "$RESOURCE_PATH" --sdk "${SDKROOT}" ${TARGET_DEVICE_ARGS}
      ;;
    *.framework)
      echo "mkdir -p ${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}" || true
      mkdir -p "${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      echo "rsync --delete -av "${RSYNC_PROTECT_TMP_FILES[@]}" $RESOURCE_PATH ${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}" || true
      rsync --delete -av "${RSYNC_PROTECT_TMP_FILES[@]}" "$RESOURCE_PATH" "${TARGET_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      ;;
    *.xcdatamodel)
      echo "xcrun momc \"$RESOURCE_PATH\" \"${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH"`.mom\"" || true
      xcrun momc "$RESOURCE_PATH" "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcdatamodel`.mom"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc \"$RESOURCE_PATH\" \"${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcdatamodeld`.momd\"" || true
      xcrun momc "$RESOURCE_PATH" "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcdatamodeld`.momd"
      ;;
    *.xcmappingmodel)
      echo "xcrun mapc \"$RESOURCE_PATH\" \"${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcmappingmodel`.cdm\"" || true
      xcrun mapc "$RESOURCE_PATH" "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$RESOURCE_PATH" .xcmappingmodel`.cdm"
      ;;
    *.xcassets)
      ABSOLUTE_XCASSET_FILE="$RESOURCE_PATH"
      XCASSET_FILES+=("$ABSOLUTE_XCASSET_FILE")
      ;;
    *)
      echo "$RESOURCE_PATH" || true
      echo "$RESOURCE_PATH" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}
if [[ "$CONFIGURATION" == "Debug" ]]; then
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0001@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0002@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0003@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0004@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0005@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0006@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0007@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0008@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0009@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0010@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0011@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0012@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0013@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0014@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0015@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0016@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0017@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0018@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0019@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0020@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0021@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0022@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0023@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0024@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0025@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0026@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0027@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0028@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0029@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0030@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0031@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0032@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0033@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0034@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0035@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0036@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0037@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0038@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0039@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0040@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0041@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0042@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0043@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0044@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0045@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0046@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0047@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0048@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0049@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0050@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0051@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0052@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0053@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0054@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0055@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0056@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0057@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0058@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0059@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0060@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0061@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0062@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0063@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0064@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0065@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0066@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0067@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0068@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0069@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0070@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0071@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0072@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0073@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0074@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0075@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0076@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0077@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0078@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0079@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0080@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0001@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0002@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0003@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0004@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0005@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0006@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0007@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0008@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0009@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0010@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0011@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0012@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0013@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0014@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0015@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0016@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0017@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0018@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0019@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0020@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0021@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0022@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0023@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0024@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0025@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0026@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0027@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0028@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0029@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0030@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0031@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0032@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0033@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0034@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0035@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0036@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0037@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0038@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0039@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0040@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0041@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0042@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0043@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0044@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0045@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0046@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0047@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0048@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0049@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0050@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0051@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0052@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0053@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0054@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0055@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0056@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0057@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0058@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0059@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0060@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0061@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0062@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0063@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0064@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0065@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0066@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0067@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0068@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0069@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYISelectPicture/jzyi_icon_add_image_sp@2x.png"
  install_resource "${PODS_ROOT}/MJRefresh/MJRefresh/MJRefresh.bundle"
  install_resource "${PODS_ROOT}/SVProgressHUD/SVProgressHUD/SVProgressHUD.bundle"
  install_resource "${PODS_ROOT}/TZImagePickerController/TZImagePickerController/TZImagePickerController/TZImagePickerController.bundle"
fi
if [[ "$CONFIGURATION" == "Release" ]]; then
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0001@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0002@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0003@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0004@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0005@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0006@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0007@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0008@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0009@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0010@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0011@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0012@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0013@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0014@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0015@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0016@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0017@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0018@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0019@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0020@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0021@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0022@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0023@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0024@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0025@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0026@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0027@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0028@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0029@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0030@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0031@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0032@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0033@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0034@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0035@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0036@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0037@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0038@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0039@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0040@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0041@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0042@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0043@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0044@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0045@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0046@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0047@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0048@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0049@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0050@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0051@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0052@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0053@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0054@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0055@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0056@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0057@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0058@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0059@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0060@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0061@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0062@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0063@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0064@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0065@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0066@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0067@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0068@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0069@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0070@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0071@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0072@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0073@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0074@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0075@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0076@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0077@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0078@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0079@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Loading/zhongjian0080@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0001@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0002@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0003@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0004@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0005@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0006@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0007@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0008@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0009@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0010@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0011@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0012@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0013@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0014@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0015@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0016@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0017@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0018@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0019@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0020@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0021@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0022@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0023@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0024@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0025@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0026@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0027@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0028@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0029@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0030@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0031@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0032@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0033@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0034@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0035@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0036@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0037@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0038@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0039@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0040@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0041@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0042@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0043@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0044@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0045@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0046@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0047@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0048@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0049@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0050@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0051@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0052@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0053@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0054@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0055@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0056@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0057@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0058@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0059@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0060@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0061@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0062@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0063@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0064@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0065@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0066@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0067@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0068@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYILoading/Refresh/xiala0069@2x.png"
  install_resource "${PODS_ROOT}/JZYIui/Assets/JZYISelectPicture/jzyi_icon_add_image_sp@2x.png"
  install_resource "${PODS_ROOT}/MJRefresh/MJRefresh/MJRefresh.bundle"
  install_resource "${PODS_ROOT}/SVProgressHUD/SVProgressHUD/SVProgressHUD.bundle"
  install_resource "${PODS_ROOT}/TZImagePickerController/TZImagePickerController/TZImagePickerController/TZImagePickerController.bundle"
fi

mkdir -p "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
if [[ "${ACTION}" == "install" ]] && [[ "${SKIP_INSTALL}" == "NO" ]]; then
  mkdir -p "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
  rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
rm -f "$RESOURCES_TO_COPY"

if [[ -n "${WRAPPER_EXTENSION}" ]] && [ "`xcrun --find actool`" ] && [ -n "${XCASSET_FILES:-}" ]
then
  # Find all other xcassets (this unfortunately includes those of path pods and other targets).
  OTHER_XCASSETS=$(find "$PWD" -iname "*.xcassets" -type d)
  while read line; do
    if [[ $line != "${PODS_ROOT}*" ]]; then
      XCASSET_FILES+=("$line")
    fi
  done <<<"$OTHER_XCASSETS"

  if [ -z ${ASSETCATALOG_COMPILER_APPICON_NAME+x} ]; then
    printf "%s\0" "${XCASSET_FILES[@]}" | xargs -0 xcrun actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${!DEPLOYMENT_TARGET_SETTING_NAME}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
  else
    printf "%s\0" "${XCASSET_FILES[@]}" | xargs -0 xcrun actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${!DEPLOYMENT_TARGET_SETTING_NAME}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}" --app-icon "${ASSETCATALOG_COMPILER_APPICON_NAME}" --output-partial-info-plist "${TARGET_TEMP_DIR}/assetcatalog_generated_info_cocoapods.plist"
  fi
fi

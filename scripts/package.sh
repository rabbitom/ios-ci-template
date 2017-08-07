#!/bin/sh
ROOT_WORKSPACE=`ls -d *.xcworkspace`
ROOT_PROJECT=`ls -d *.xcodeproj`
if [ -n "$ROOT_WORKSPACE" ]; then
    BUILD_TARGET="-workspace $ROOT_WORKSPACE"
elif [ -n "$ROOT_PROJECT" ]; then
    BUILD_TARGET="-project $ROOT_PROJECT"
else
    err "no workspace or project at root folder"
    return 1
fi
if [ -z "$APP_NAME" ]; then
    err "no build scheme, please set APP_NAME"
    return 2
fi
xcodebuild archive $BUILD_TARGET -scheme $APP_NAME -archivePath bin/app.xcarchive -destination generic/platform=iOS ONLY_ARCHIVE_ARCH=NO 
xcodebuild -exportArchive -archivePath bin/app.xcarchive -exportPath bin/ -exportOptionsPlist scripts/export.plist

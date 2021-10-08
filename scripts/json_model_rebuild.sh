#!/usr/bin/env bash
cd ..
echo ''
echo Start to rebuild JSON models
echo ''
flutter pub run build_runner build --delete-conflicting-outputs
#pub run build_runner watch
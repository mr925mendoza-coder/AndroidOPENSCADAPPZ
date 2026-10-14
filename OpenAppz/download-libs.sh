name: Build APK
on: [push, workflow_dispatch]

jobs:
  build:
    runs-on: ubuntu-latest
    defaults:
      run:
        working-directory: OpenAppz
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-java@v4
        with:
          distribution: temurin
          java-version: 17

      - uses: android-actions/setup-android@v3

      - uses: gradle/actions/setup-gradle@v4
        with:
          gradle-version: "8.10.2"
          build-root-directory: OpenAppz

      # Only needed if the libraries aren't committed to the repo
      - run: sh download-libs.sh

      - run: gradle assembleDebug

      - uses: actions/upload-artifact@v4
        with:
          name: app-debug
          path: OpenAppz/app/build/outputs/apk/debug/*.apk

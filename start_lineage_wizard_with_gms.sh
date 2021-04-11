#!/bin/bash

adb root
wait ${!}
adb shell pm enable com.google.android.setupwizard || true
wait ${!}
if adb shell pm list packages | grep com.android.provision; then
  adb shell pm disable com.android.provision || true
  wait ${!}
fi
adb shell am start com.aicp.setupwizard/com.aicp.setupwizard.SetupWizardTestActivity
wait ${!}
sleep 1
adb shell am start com.google.android.setupwizard/com.google.android.setupwizard.SetupWizardTestActivity

#~/Android/Sdk/emulator/emulator -list-avds	

#~/Android/Sdk/emulator/emulator -avd device_35_55pol

#-- run all tests

#adb shell reboot -p

task(){
	sleep 10;

adb devices

adb install -r ~/Documentos/Automação/Spoon/app-debug.apk

adb install -r ~/Documentos/Automação/Spoon/app-debug-androidTest.apk

echo "save result in $1";

java -jar ~/Documentos/Automação/Spoon/spoon-runner-1.7.1-jar-with-dependencies.jar \ --apk ~/Documentos/Automação/Spoon/demo-app-x86-debug.apk --test-apk ~/Documentos/Automação/Spoon/app-debug-androidTest.apk --sdk /home/marcos/Android/Sdk --output /home/marcos/Documentos/Automação/Spoon/result/$1 --class-name com.ds.android.dschecktest.LayoutTest;

adb shell reboot -p;
}

for DEVICE in $(~/Android/Sdk/emulator/emulator -list-avds)

do
   echo "device $DEVICE done!"
   echo "starting device ..."
	
   ~/Android/Sdk/emulator/emulator -avd $DEVICE -no-boot-anim & task "$DEVICE"
done

java -jar mergeResult.jar '/home/marcos/Documentos/Automação/Spoon/result'


# adb shell reboot -p
#device_35_55pol






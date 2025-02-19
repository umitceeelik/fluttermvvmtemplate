if [ $3 == "bundle" ]
then
flutter build appbundle --build-name=$1 --build-number=$2
start "" "C:\Users\umitc\OneDrive\Belgeler\FlutterProjects\fluttermvvmtemplate\build\app\outputs\bundle\release"
else
flutter build apk --build-name=$1 --build-number=$2
start "" "C:\Users\umitc\OneDrive\Belgeler\FlutterProjects\fluttermvvmtemplate\build\app\outputs\flutter-apk" 
fi
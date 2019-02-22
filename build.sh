#!/bin/bash

set -e
set -x

echo "Doing build..."

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd $DIR

FLUTTER_DIR=$DIR/flutter_project/qchat_client
sed -i '.bak' 's/void main() => runApp(MyApp());/ \
                import "package:flutter\/foundation.dart" \
                    show debugDefaultTargetPlatformOverride; \
                void main() { \
                    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia; \
                    runApp(MyApp());\
                }/' $FLUTTER_DIR/lib/main.dart

pushd $FLUTTER_DIR
flutter build bundle
mv $FLUTTER_DIR/lib/main.dart.bak $FLUTTER_DIR/lib/main.dart
popd


if [ ! -f $DIR/icudtl.dat ] || [ ! -d $DIR/FlutterEmbedder.framework ]
then
    rm -rf .build $DIR/icudtl.dat $DIR/FlutterEmbedder.framework
    mkdir .build
    go run engineDownloader.go
fi

export CGO_LDFLAGS="-F${PWD} -Wl,-rpath,@executable_path"

go build main.go

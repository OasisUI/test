#!/usr/bin/env sh

$VESION = $(npm version patch)
echo 'TEST_VALUE:' $TEST_VALUE;
rm -rf web CI-IN-ACTION
mkdir web
cd web
git clone -b master https://$CI_TOKEN@github.com/joe223/CI-IN-ACTION.git .
npm run build

cd ..
git clone -b gh-pages https://$CI_TOKEN@github.com/joe223/CI-IN-ACTION.git

cp -rf web/* ./CI-IN-ACTION
cd CI-IN-ACTION
git add .
git commit -m "build $VESION"

git push origin gh-pages

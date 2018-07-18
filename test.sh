#!/usr/bin/env sh
echo 'print package version:'
npm version patch

rm -rf web CI-IN-ACTION
mkdir web
cd web
git clone -b master https://$CI_TOKEN@github.com/joe223/CI-IN-ACTION.git .
VERSION=$(npm version patch)

echo 'TEST_VALUE:' $TEST_VALUE;
echo 'VERSION:' $VERSION;

npm run build

cd ..
git clone -b gh-pages https://$CI_TOKEN@github.com/joe223/CI-IN-ACTION.git

cp -rf web/* ./CI-IN-ACTION
cd CI-IN-ACTION

echo '\r\nstart deploying...';

git add .
git commit -m "build $VERSION"

git push origin gh-pages

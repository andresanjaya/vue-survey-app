set -e

npm run build

cd dist

git init 
git add -A
git commit -m 'Deploy Commit'
git push -f git@github.com:andresanjaya/vue-survey-app.git master:gh-pages

cd -
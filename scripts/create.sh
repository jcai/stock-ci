mkdir target

cd target
git config --global user.email "jcai@ganshane.com"
git config --global user.name "Jun Tsai"
git clone https://${CI_USER}:${CI_PASS}@github.com/ganshane/ganshane.github.io.git

#process file using server gz
wget https://github.com/ganshane/shakey/releases/download/shakey-project-1.6/shakey-server-1.6-bin.tar.gz
tar xfvz shakey-server-1.6-bin.tar.gz
cd shakey-server*
export BUILD_ID=`date +%Y%m%d`
echo $BUILD_ID
JAVA_OPTIONS="-Xmx1g" bin/shakey-server shakey.server.internal.Stockanalyzer ../ganshane.github.io/_posts/${BUILD_ID}-strong-stock.markdown
cd -

#push post file
cd ganshane.github.io
ls _posts/*

git add _posts
git commit -a -m "add ${BUILD_ID} strong stock"
#git remote set-url origin https://${CI_USER}:${CI_PASS}@github.com/ganshane/ganshane.github.io.git
git push origin


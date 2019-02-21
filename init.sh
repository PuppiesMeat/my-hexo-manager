#!/bin/sh

echo "初始化hexo"
npm install hexo --save

echo "clone 文档部署仓库"
git clone git@github.com:PuppiesMeat/PuppiesMeat.github.io.git #文档部署仓库

echo "clone hexo主题bmw"
git clone git@github.com:dongyuanxin/theme-bmw.git themes/bmw #hexo主题配置

echo "覆盖安装bmw主题配置备份文件"
cp ./backup/_config.yml ./themes/bmw/ #拷贝主题配置文件
echo "删除bmw主题demo配置备份文件"
rm ./themes/bmw/demo._config.yml # 删除主题demo配置文件

echo "覆盖安装局部模板"
cp ./backup/footer.ejs ./backup/header.ejs ./backup/player.ejs ./themes/bmw/layout/_partial/

echo "安装本地音频文件"
cp -r ./backup/music ./themes/bmw/source/

echo "安装本地图片"
cp ./backup/alipay.png ./backup/wechat.png ./themes/bmw/source/images/

echo "安装结束 开始部署"
./deploy.sh

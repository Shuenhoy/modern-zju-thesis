mkdir -p fonts
pushd fonts

wget -c https://github.com/streetsamurai00mi/ttf-ms-win10/raw/refs/heads/build/times.ttf
wget -c https://github.com/streetsamurai00mi/ttf-ms-win10/raw/refs/heads/build/timesbd.ttf
wget -c https://github.com/streetsamurai00mi/ttf-ms-win10/raw/refs/heads/build/timesbi.ttf
wget -c https://github.com/streetsamurai00mi/ttf-ms-win10/raw/refs/heads/build/timesi.ttf

wget -c https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/refs/heads/master/chinese/%E4%BB%BF%E5%AE%8B%E4%BD%93/FangSong.ttf
wget -c https://raw.githubusercontent.com/Haixing-Hu/latex-chinese-fonts/refs/heads/master/chinese/%E5%AE%8B%E4%BD%93/SimSun.ttc
wget -c https://raw.githubusercontent.com//Haixing-Hu/latex-chinese-fonts/refs/heads/master/chinese/%E9%BB%91%E4%BD%93/SimHei.ttf
wget -c https://raw.githubusercontent.com//Haixing-Hu/latex-chinese-fonts/refs/heads/master/chinese/%E6%A5%B7%E4%BD%93/Kaiti.ttf
wget -c https://raw.githubusercontent.com/Halfish/lstm-ctc-ocr/refs/heads/master/fonts/simkai.ttf
popd

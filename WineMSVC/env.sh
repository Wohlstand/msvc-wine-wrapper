
export WINEDEBUG=-all
export WINE_CROSSTOOLCHAIN=$PWD/cmake
export PATH=$PWD/bin/:$PATH

wineserver -k
wineboot -k
wineboot -i
wineserver -p

wx-cl


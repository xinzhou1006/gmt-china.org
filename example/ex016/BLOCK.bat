gmt gmtset MAP_ANNOT_OBLIQUE 6
gmt gmtset MAP_TICK_LENGTH_PRIMARY 0
gmt gmtset MAP_FRAME_TYPE plain

set R=78/12/149/53r
set J=B105/10/25/47/15c
set PS=BLOCK.ps

gmt psxy -R%R% -J%J% -T -K > %PS%

REM ============��ͼ
gmt psbasemap -R%R% -J%J% -Bx10 -By5 -BNEWS -K -O >> %PS%
gmt pscoast -R%R% -J%J% -Ggray95 -S83/216/238 -A5000 -Dh -K -O>> %PS%
gmt psxy CN-border-L1.dat -R%R% -J%J% -W0.2p -Gwhite -O -K >> %PS%

REM ============���ư��߽�
gmt psxy CN-plate-neighbor.dat -R%R% -J%J% -W2.0p,2/138/210 -Sf0.5+t+l -G2/138/210 -O -K >> %PS%
REM ============�����ƶϵؿ�߽�
gmt psxy CN-block-L1-deduced.dat -R%R% -J%J% -W1.0p,2/138/210,- -O -K >> %PS%
REM ============���ƶ����ؿ�߽�
gmt psxy CN-block-L2.dat -R%R% -J%J% -W1.0p,orange -O -K >> %PS%
REM ============����һ���ؿ�߽�
gmt psxy CN-block-L1.dat -R%R% -J%J% -W1.0p,2/138/210 -O -K >> %PS%

REM ============��ؿ��ע
echo 90 45 �����ؿ� > blockname
echo 122 46 �����ǻ�ؿ� >> blockname
echo 120 35 ������ؿ� >> blockname
echo 110 27 ���ϻ�ؿ� >> blockname
echo 90 33 ��ػ�ؿ� >> blockname
echo 97 23 �����ؿ� >> blockname
gmt pstext blockname -R%R% -J%J% -F+f10p,37 -O -K >> %PS%

REM ============�߽�ͼ��
echo S 0.3i f0.5+t+l 0.4i/0.3c 2/138/210 2.0p,2/138/210 0.7i ���߽� > legend
echo S 0.3i - 0.50i 2/138/210 1.0p,2/138/210 0.7i  һ���ؿ�߽� >> legend
echo S 0.3i - 0.44i - 1.0p,2/138/210,- 0.7i  �ƶϵؿ�߽� >> legend
echo S 0.3i - 0.50i orange 1.0p,orange 0.7i �����ؿ�߽� >> legend
gmt pslegend legend -R%R% -J%J% -DjTL+w1.5i+jTL+o0.1c/0.1c -F+gwhite+p0.5p -O -K --FONT_ANNOT_PRIMARY=8p,37 >> %PS%

REM ============�Ϻ��
gmt psbasemap -R%R% -J%J% -DjBR+w2c+t -K -O >> %PS%
gmt pscoast -R106/121/3/24 -JM2c -Ggray95 -S83/216/238  -A5000 -Dh -K -O >> %PS%
gmt psxy CN-border-L1.dat -R106/121/3/24 -JM2c -B0 -W0.2p -Gwhite -O -K >> %PS%

gmt psxy -R%R% -J%J% -T -O >> %PS%
del gmt.* blockname legend
pause
[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=97124dfc-5b20-4c4a-ac8a-1b16b41f07de
Description=自动剪辑脚本
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=279
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]

判断进程结束 = 0
For 600
FindPic 711,240,1173,339,"C:\Users\Administrator\Desktop\脚本\图片\开始创作.bmp",0.9,开始创作X,开始创作Y
If 开始创作X > 0 And 开始创作Y > 0 Then 
判断进程结束=1
Exit For
End If
Delay 100
Next
Call 判断是否找到
Delay 300

MoveTo 开始创作X, 开始创作Y//开始创作
LeftClick 1
Delay 200

MoveTo 211, 697//bgm位置
For 100
FindPic 584,565,989,841,"C:\Users\Administrator\Desktop\脚本\图片\剪映打开了.bmp",0.9,主轨位置X,主轨位置Y
If 主轨位置X > 0 And 主轨位置Y > 0 Then 
LeftDown 1
判断进程结束 = 1
Exit For
End If
Delay 200
Next
Call 判断是否找到

Delay 200
MoveTo 411, 697//任意位置
Delay 200
MoveTo 789, 697//剪映位置
LeftUp 1


//bgm响应结束了吗
For 600
FindPic 1501,134,1870,266,"C:\Users\Administrator\Desktop\脚本\图片\bgm的基本.bmp",0.9,bgm基本X,bgm基本Y
If bgm基本X> 0 And bgm基本Y> 0 Then
判断进程结束 = 1
Exit For
End If
Delay 100
Next
Call 判断是否找到
Delay 300


//踩点
MoveTo 788, 552//自动踩点
LeftClick 1
Delay 500
MoveTo 827, 637//踩节拍II
LeftClick 1
Delay 500

For 600
FindPic 1751,482,1895,594,"C:\Users\Administrator\Desktop\脚本\图片\放大镜.bmp",0.9,放大镜X,放大镜Y
If 放大镜X> 0 And 放大镜Y> 0 Then
判断进程结束 = 1
Exit For
End If
Delay 100
Next
Call 判断是否找到
Delay 300

//放大
MoveTo 1860, 555//放大位置
LeftClick 1
Delay 300


//记录bgm尾部位置
KeyPress "Num -", 1
Delay 500
FindColor 1159,796,1810,822,"8D8D8D",endX,endY
If endX > 0 And endY > 0 Then
End If
Delay 200

KeyPress "Home", 1
Delay 200

//将文件拉到剪映
MoveTo 72, 697//文件夹位置
FindColorEx 43,698,43,698,"9CE7FF",0,0.5,intX,intY//判断文件是否用完
If intX > 0 And intY > 0 Then 
Else 
MessageBox "结束"
End If
LeftDown 1
MoveTo 600, 707//任意位置
Delay 200
MoveTo 647, 661//剪映位置
LeftUp 1
Delay 200

For 600
FindPic 1502,176,1876,236,"C:\Users\Administrator\Desktop\脚本\图片\画面里的基础.bmp",0.9,画面里的基础X,画面里的基础Y
If 画面里的基础X> 0 And 画面里的基础Y> 0 Then
判断进程结束 = 1
Exit For
End If
Delay 100
Next
Call 判断是否找到
Delay 300

//文件下拉
For 100
	是否可以下拉 = GetCursorShape(0)
	If 是否可以下拉 = 553556112 Then //是否是普通鼠标
	Exit For
	Else 
	MoveR 1, 0
	End If
	Delay 100
Next
LeftDown 1
MoveR 1, 25//任意位置
Delay 200
MoveR 1, 50//目标位置
LeftUp 1
Delay 200



标记 = 0
Delay 300
KeyPressS "Home", 1
Delay 300
KeyPressS "Down", 1
Delay 300

距离X=0
//转场
MoveTo 784, 156//转场
LeftClick 3
For 20
FindColorEx 622, 591, 1833, 636, "8D8D8D", 0, 0.7, 跳动X, 跳动Y

For 5
If Abs(距离X - 跳动X) > 15 Then 
Exit For
Else 
Call 防止黄条出现
KeyPressS "Down", 1
Delay 300
FindColorEx 622, 591, 1833, 636, "8D8D8D", 0, 0.7, 跳动X, 跳动Y
Delay 300
End If
Next


随机转场 = zmRnd(1, 14)
Call 选择转场
If 跳动X > endX - 50 Then
Exit For
End If

距离X=跳动X
Call 防止黄条出现
KeyPressS "Down", 1
Delay 300
Next



Call 防止黄条出现
Delay 300
KeyPressS "Home", 1
Delay 300


Sub 选择转场
转场X = 655
转场Y = 291


If 随机转场 < 4 Then 
MoveTo 513,402//拍摄
LeftClick 5
Delay 300
If 随机转场 = 1 Then 
MoveTo 转场X,转场Y+234//抽象前景
End If
If 随机转场 = 2 Then 
MoveTo 转场X+306,转场Y+117//相片拼接
End If
If 随机转场 = 3 Then 
MoveTo 转场X+306,转场Y+234//拍摄期II
End If
End If

If 随机转场 > 3 and 随机转场 < 12 Then //故障
MoveTo 513,474//故障
LeftClick 5
Delay 300
If 随机转场 = 4 Then 
MoveTo 转场X,转场Y//色差故障
End If
If 随机转场 = 5 Then 
MoveTo 转场X+102,转场Y//故障
End If
If 随机转场 = 6 Then 
MoveTo 转场X+204,转场Y//雪花故障
End If
If 随机转场 = 7 Then 
MoveTo 转场X+306,转场Y+234//波动故障
End If
If 随机转场 = 8 Then 
MoveTo 转场X,转场Y+117//横线
End If
If 随机转场 = 9 Then 
MoveTo 转场X+102,转场Y+117//竖线
End If
If 随机转场 = 10 Then 
MoveTo 转场X+102,转场Y+234//色块故障
End If
If 随机转场 = 11 Then 
MoveTo 转场X+204,转场Y+234//透镜故障
End If
End If

If 随机转场 > 11 and 随机转场 < 15 Then //热门
MoveTo 513,366//光效
LeftClick 5
Delay 200
If 随机转场 = 12 Then 
MoveTo 转场X+204,转场Y//光束
End If
If 随机转场 = 13 Then 
MoveTo 转场X,转场Y+234//扫光
End If
If 随机转场 = 14 Then 
 MoveTo 转场X+102,转场Y+234//星光
End If
End If
Delay 200
LeftClick 5


If 标记 = 0 Then 
For 100
FindPic 996, 395, 1354, 560, "C:\Users\Administrator\Desktop\脚本\图片\知道了.bmp", 0.8, 知道了X, 知道了Y
If 知道了X > 0 And 知道了Y > 0 Then 
Delay 200
MoveTo 知道了X, 知道了Y
LeftClick 1
标记 = 1
Exit For
End If
Delay 2
Next

End If
Delay 400

End Sub




//定格与滤镜
//先让滤镜到底
MoveTo 844, 154
LeftClick 1
Delay 300
MoveR 35, 50//目标位置
MouseWheel - 99 
MouseWheel - 99 
Delay 300

//选择每个片段的位置然后定格
For 16
KeyPressS "Down", 1
Delay 300
FindColorEx 593,599,1726,648,"8D8D8D",0,0.6,定格白条X,定格白条Y
If 定格白条X > 0 And 定格白条Y > 0 Then 
Else 
MessageBox "找不到白条"
End If
If 定格白条X > endX - 60 Then 
Delay 500
Exit For
End If
MoveTo 定格白条X - 15, 定格白条Y//定位白条
LeftClick 1
Delay 300
MoveTo 定格白条X - 15, 定格白条Y + 100//选定画面
LeftClick 1
Delay 300
MoveTo 788,550//定格
LeftClick 1
Delay 200
MoveTo 725,436//默片
LeftDown 1
MoveTo 定格白条X, 定格白条Y + 95
Delay 500
Call 激活鼠标
LeftUp 1
Delay 200
Call 防止黄条出现
KeyPress "Right", 15//删除的部分
Delay 500
KeyPressS "W", 1
Delay 300
KeyPressS "Up", 1
Delay 300
KeyPressS "Down", 4
Delay 300
Next


Sub 防止黄条出现
MoveTo 1016, 544
LeftClick 1
Delay 300
End Sub

Sub 激活鼠标
For 20
MoveR 2, 0
Delay 10
MoveR - 2 , 0
Next
End Sub


//删除多余的
MoveTo 1813, 713
LeftDown 1
Delay 200
MoveTo endX-50, 600
LeftUp 1
Delay 200
KeyPress "BackSpace", 1
Delay 500
KeyPress "Num -", 1
Delay 200

//找到白条
For 600
FindColorEx 1053,593,1851,647,"8D8D8D",0,0.7,白条X,白条Y
If 白条X> 0 And 白条Y> 0 Then
判断进程结束 = 1
Exit For
End If
Delay 100
Next
Call 判断是否找到
Delay 300


//辅助画面拉到剪映
MoveTo 56, 921//辅助
LeftDown 1
Delay 200
MoveTo 白条X + 10, 白条Y//任意位置
Delay 200
MoveTo 白条X+13, 白条Y+67//剪映位置
LeftUp 1
Delay 500
LeftClick 1
Delay 200
LeftDown 1
Delay 200
MoveTo 白条X, 白条Y//任意位置
Delay 200
MoveTo 白条X+13, 白条Y+137//目标位置
LeftUp 1
Delay 400


MoveTo endX - 2, 678
For 60
If GetPixelColor(endX + 2, 678) = "252424" Then 
Else 
Exit For
End If
For 250
MoveR - 1 , 0
If GetCursorShape(0) = 1707384992 Then 
SaveMousePos
Call bx
RestoreMousePos 
MoveR - 14 , 0
Exit For
End If
Delay 20


GetCursorPos 鼠标位置X, 鼠标位置Y
If 鼠标位置X < 611 Then 
MoveTo endX - 2, 678
End If

Next

Delay 300
Next

//删除多余的
SetSimMode 2
Delay 200
KeyPress "Num -", 1
Delay 200
KeyPress "Up", 1
MoveTo X + 0.5, Y - 60//选择最后的片段
LeftClick 1
Delay 400
MoveTo 709, 552//向左裁剪
LeftClick 10
SetSimMode 0

Sub bx
LeftClick 1
For 10
FindPic 1500, 122, 1880, 194, "C:\Users\Administrator\Desktop\脚本\图片\变速.bmp", 0.9, 变速X, 变速Y
FindPic 1497,120,1837,189,"C:\Users\Administrator\Desktop\脚本\图片\变速(亮).bmp",0.9,变速亮X,变速亮Y
If (变速X> 0 And 变速Y> 0) or  (变速亮X> 0 And 变速亮Y> 0)  Then
Exit For
Else 
Exit Sub
End If
Delay 70
Next
Delay 300
MoveTo 变速X,变速Y//改倍速
LeftClick 1
Delay 300
MoveTo 1855, 290//改倍速
LeftClick 1
End Sub

//白条定位到辅助画面前一个片段
Delay 400
KeyPressS "Num -", 1
Delay 200
KeyPressS "Up", 1
Delay 200
FindColorEx 1100,600,1827,629,"8D8D8D",0,0.6,白条X,白条Y
If 白条X > 0 And 白条Y > 0 Then
End If

//特效
Dim 特效不重复(60)
下标 = 0
下标变化 = 0
MoveTo 726, 151//特效的最外层
LeftClick 1
Delay 200

Call 设置特效
Delay 200
Call 设置特效





Sub 设置特效
位置X=636
For 300
MoveTo 位置X, 592//定位
LeftClick 1
Delay 200
随机特效加号 = zmRnd(1, 60)

For 60
For 60
If 随机特效加号 <> 特效不重复(下标) Then 
下标=下标+1
Else 
随机特效加号 = zmRnd(1, 60)
下标 = 0
End If
Next
If 下标 > 60 Then 
Exit For
End If
Next

特效不重复(下标变化)=随机特效加号
下标变化 = 下标变化 + 1
下标=0

Call 选择特效2(位置X)
位置X = 位置X + 50
If 位置X > endX Then 
Exit For
End If
Delay 200
Next
End Sub






//删除
Delay 200
MoveTo 1770, 676
LeftDown 1
Delay 200
MoveTo 白条X, 592
LeftUp 1
Delay 200
KeyPress "BackSpace", 1
Delay 200

KeyPress "Home", 1
Delay 200

//设置字的
MoveTo 616,153//文本
LeftClick 1
Delay 200
For 600
FindPic 563,301,702,457,"C:\Users\Administrator\Desktop\脚本\图片\危险动作.bmp",0.9,危险X,危险Y
If 危险X> 0 And 危险Y> 0 Then
判断进程结束 = 1
Exit For
End If
Delay 100
Next
Call 判断是否找到

Delay 300

For 20
MoveTo 654, 412//预设文本
MoveTo 655, 411//预设文本
Delay 50
Next
LeftClick 1
Delay 300

For 20
MoveTo 675, 646//拖动文本
MoveTo 676, 647//拖动文本
Delay 50
Next

LeftDown 1
Delay 200
MoveTo 1566, 647
LeftUp 1

Delay 200
SetSimMode 2
Delay 200
KeyPress "Num -", 1
Delay 200
KeyPress "Up", 1
Delay 200
KeyPress "W", 1
SetSimMode 0
Delay 500
//Ctrl+A全选
KeyDown 17, 1
KeyPress 65, 1
KeyUp 17, 1
Delay 300
//Alt+G复合
KeyDown 18, 1
KeyPress 71, 1
KeyUp 18, 1
Delay 500


//复合后需要等一会才显示
For 600
FindPic 1505,128,1875,194,"C:\Users\Administrator\Desktop\脚本\图片\动画.bmp",0.9,动画X,动画Y
If 动画X> 0 And 动画Y> 0 Then
判断进程结束 = 1
Exit For
End If
Delay 100
Next

Call 判断是否找到
Delay 300
MoveTo 动画X,动画Y//动画
LeftClick 1
Delay 600
MoveTo 1687, 202//出场
LeftClick 1
Delay 200

//找渐隐
For 600
FindPic 1504,175,1878,540,"C:\Users\Administrator\Desktop\脚本\图片\渐隐.bmp",0.9,渐隐X,渐隐Y
If 渐隐X> 0 And 渐隐Y> 0 Then
判断进程结束 = 1
Exit For
End If
Delay 100
Next
Call 判断是否找到
Delay 300
MoveTo 渐隐X,渐隐Y-50//渐隐时长
LeftClick 3
Delay 400
MoveTo 1827, 509//渐隐时长
Delay 400
LeftClick 3
Delay 200
SayString "2"
Delay 400

MoveTo 1000, 707//选择片段
LeftClick 1
//复制
KeyDown 17, 1
KeyPress 67, 1
KeyUp 17, 1

Delay 400
KeyPress "Home", 1
Delay 200

//粘贴
KeyDown 17, 1
KeyPress 86, 1
KeyUp 17, 1

//背景
MoveTo 1056, 741//选择背景
LeftClick 10
Delay 200
MoveTo 1777, 298//调整大小
LeftClick 3
Delay 200
SayString "320"
Delay 200
MoveTo 728, 154//选择背景
LeftClick 2
Delay 400
MoveTo 522, 209//画面特效
LeftClick 1
Delay 400

For 600
FindPic 476,179,570,531,"C:\Users\Administrator\Desktop\脚本\图片\特效里的基础.bmp",0.9,基础X,基础Y
If 基础X> 0 And 基础Y> 0 Then
判断进程结束 = 1
Exit For
End If
Delay 100
Next
Call 判断是否找到
Delay 300

MoveTo 基础X,基础Y
LeftClick 3
Delay 400
MoveTo 830, 416//为了可以用滚轮
MouseWheel - 8 


For 600
FindPic 564,172,1023,537,"C:\Users\Administrator\Desktop\脚本\图片\模糊.bmp",1,模糊X,模糊Y
If 模糊X> 0 And 模糊Y> 0 Then
判断进程结束 = 1
Exit For
End If
Delay 100
Next
Call 判断是否找到
Delay 300
MoveTo 模糊X+50,模糊Y-50
LeftDown 1
Delay 300
MoveTo 1006, 741//任意位置
Delay 200
MoveTo 1056, 741//背景
LeftUp 1
Delay 300

//调成9：16
MoveTo 1445, 503
LeftClick 1
Delay 300
MoveTo 1504, 716 //9:16
LeftClick 1
Delay 500

//黑场
KeyPress "Num -", 1
Delay 300
MoveTo 500, 155//媒体
LeftClick 1
For 600
FindPic 469,123,577,535,"C:\Users\Administrator\Desktop\脚本\图片\素材库.bmp",0.9,素材库X,素材库Y
If 素材库X> 0 And 素材库Y> 0 Then
判断进程结束 = 1
Exit For
End If
Delay 100
Next
Call 判断是否找到
Delay 300
Delay 200
MoveTo 素材库X,素材库Y
LeftClick 1
Delay 300
MoveTo 691, 344//黑场
For 50
MoveR 1, 1
MoveR - 1 , - 1 
Delay 5
Next
LeftClick 1
Delay 300


//导出
KeyDown 17, 1
KeyPress 69, 1
KeyUp 17, 1
For 600
FindPic 1117,622,1573,841,"C:\Users\Administrator\Desktop\脚本\图片\导出.bmp",0.9,导出X,导出Y
If 导出X> 0 And 导出Y> 0 Then
判断进程结束 = 1
Exit For
End If
Delay 100
Next
Call 判断是否找到
Delay 300
KeyPress "Enter", 1
Delay 500
MoveTo 1441, 653

//等待导出后点击关闭
For 600
FindColorEx 1441, 722,1442, 722,"787373",0,0.9,intX,intY
If intX > 0 And intY > 0 Then 
LeftClick 1
Exit For
End If
MoveTo 1441, 722
Delay 100
MoveTo 1442, 722
Next
LeftClick 1

//alt+f4
Delay 200
KeyDown 18, 1
KeyPress 115, 1
KeyUp 18, 1
Delay 400


For 1000
FindPic 711,240,1173,339,"C:\Users\Administrator\Desktop\脚本\图片\开始创作.bmp",0.9,开始创作X,开始创作Y
If 开始创作X > 0 And 开始创作Y > 0 Then 
判断进程结束=1
Exit For
End If
Delay 100
Next
Call 判断是否找到
Delay 300

MoveTo 65, 707//打斗
Delay 200
LeftDown 1
Delay 200
MoveTo 450, 200//任意位置
Delay 200
MoveTo 342, 242//放入别的文件夹
Delay 200
LeftUp 1
Delay 200

MoveTo 56, 921//辅助
Delay 200
LeftDown 1
Delay 200
MoveTo 450, 200//任意位置
Delay 200
MoveTo 342, 242//放入别的文件夹
Delay 200
LeftUp 1
Delay 200

MoveTo 176, 658//bgm
LeftDown 1
MoveTo 545, 721//任意位置
Delay 200
MoveTo 336, 236//目标位置
LeftUp 1
Delay 200



Function zmRnd(最小值, 最大值)
    Randomize
    zmRnd = Int((最大值 - 最小值 + 1) * Rnd() + 最小值)
End Function

Sub 蒙版动画
UserVar 蒙版X=0 "设置内容"
UserVar 蒙版Y=0 "设置内容"
蒙版X=1541
蒙版Y = 256

If suijimb < 16 Then 
MouseWheel - 9 
Delay 200
If suijimb=1 Then
MoveTo 蒙版X+80, 蒙版Y//四格转动
End If
If suijimb=2 Then
MoveTo 蒙版X+160, 蒙版Y//四格转动II
End If
If suijimb=3 Then
MoveTo 蒙版X+240, 蒙版Y//左右分割
End If
If suijimb=4 Then
MoveTo 蒙版X, 蒙版Y+80//左右分割II
End If
If suijimb=5 Then
MoveTo 蒙版X+80, 蒙版Y+80//四格滑动
End If
If suijimb=6 Then
MoveTo 蒙版X160, 蒙版Y+80//四格滑动二
End If
If suijimb=7 Then
MoveTo 蒙版X+240, 蒙版Y+80//分身
End If
If suijimb=8 Then
MoveTo 蒙版X, 蒙版Y+160//分身II
End If
If suijimb=9 Then
MoveTo 蒙版X+80, 蒙版Y+160//小陀螺
End If
If suijimb=10 Then
MoveTo 蒙版X+160, 蒙版Y+160//小陀螺II
End If
If suijimb=11 Then
MoveTo 蒙版X+240, 蒙版Y+160//上下分割
End If
If suijimb=12 Then
MoveTo 蒙版X, 蒙版Y+240//上下分割II
End If
If suijimb=13 Then
MoveTo 蒙版X+80, 蒙版Y+240//三分割
End If
If suijimb=14 Then
MoveTo 蒙版X+160, 蒙版Y+240//三分割II
End If
If suijimb=15 Then
MoveTo 蒙版X+240, 蒙版Y+240//荡秋千
End If
End If

If suijimb>15 and suijimb<28 Then
MouseWheel - 13 
Delay 200
If suijimb=16 Then
MoveTo 蒙版X, 蒙版Y//荡秋千II
End If
If suijimb=17 Then
MoveTo 蒙版X+80, 蒙版Y//形变缩小
End If
If suijimb=18 Then
MoveTo 蒙版X+160, 蒙版Y//形变左缩
End If
If suijimb=19 Then
MoveTo 蒙版X+240, 蒙版Y//形变右缩
End If
If suijimb=20 Then
MoveTo 蒙版X, 蒙版Y+80//抖入放大
End If
If suijimb=21 Then
MoveTo 蒙版X+80, 蒙版Y+80//小火车
End If
If suijimb=22 Then
MoveTo 蒙版X+80, 蒙版Y+160//中间分割
End If
If suijimb=23 Then
MoveTo 蒙版X+160, 蒙版Y+160//中间分割II
End If
If suijimb=24 Then
MoveTo 蒙版X+240, 蒙版Y+160//滑滑梯
End If
If suijimb=25 Then
MoveTo 蒙版X, 蒙版Y+240//滑滑梯II
End If
If suijimb=26 Then
MoveTo 蒙版X+80, 蒙版Y+240//回弹伸缩
End If
If suijimb=27 Then
MoveTo 蒙版X+160, 蒙版Y+240//旋转伸缩
End If
If suijimb=28 Then
MoveTo 蒙版X+240, 蒙版Y+240//晃动炫出
End If
End If

If suijimb > 28 and suijimb < 34 Then 
MouseWheel -17
Delay 200

If suijimb=29 Then
MoveTo 蒙版X, 蒙版Y//炫入晃动
End If
If suijimb=30 Then
MoveTo 蒙版X+80, 蒙版Y//弹入旋转
End If
If suijimb=31 Then
MoveTo 蒙版X+80, 蒙版Y+80//四格翻转
End If
If suijimb=32 Then
MoveTo 蒙版X+160, 蒙版Y+80//缩放
End If
If suijimb=33 Then
MoveTo 蒙版X+240, 蒙版Y+240//旋入渐隐
End If
End If

Delay 600
LeftClick 1
Delay 200

End Sub

Sub 蒙版形状

If xingzhuang=1 Then
Delay 200
MoveTo 1619, 315//线性
Delay 200
LeftClick 1
End If

If xingzhuang=2 Then
Delay 200
MoveTo 1698, 315//线性
Delay 200
LeftClick 1
End If

If xingzhuang=3 Then
Delay 200
MoveTo 1539, 406//线性
Delay 200
LeftClick 1
End If

End Sub

Sub 滤镜样式(LLX,LLY)
MoveTo 780, 336//为了可以用滚轮
MouseWheel - 99 
MouseWheel - 99 
Delay 400
UserVar LX=0 "设置内容"
UserVar LY=0 "设置内容"
LX = 630
LY = 207

If lvjing=1 Then
MoveTo LX, LY//快照
Delay 200
LeftClick 1
Delay 200
LeftDown 1
Delay 200
MoveTo 922, 504//任意位置
Delay 200
MoveTo LLX-4, LLY//目标位置
End If

If lvjing=2 Then
MoveTo LX+100, LY//快照II
Delay 200
LeftClick 1
Delay 200
LeftDown 1
Delay 200
MoveTo 922, 504//任意位置
Delay 200
MoveTo LLX-4, LLY//目标位置
End If

If lvjing=3 Then
MoveTo LX+200, LY//蓝调
Delay 200
LeftClick 1
Delay 200
LeftDown 1
Delay 200
MoveTo 922, 504//任意位置
Delay 200
MoveTo LLX-4, LLY//目标位置
End If

If lvjing=4 Then
MoveTo LX + 300, LY//布朗
Delay 200
LeftClick 1
Delay 200
LeftDown 1
Delay 200
MoveTo 922, 504//任意位置
Delay 200
MoveTo LLX-4, LLY//目标位置
End If

If lvjing=5 Then
MoveTo LX, LY+100//赫本
Delay 200
LeftClick 1
Delay 200
LeftDown 1
Delay 200
MoveTo 922, 504//任意位置
Delay 200
MoveTo LLX-4, LLY//目标位置
End If


If lvjing=6 Then
MoveTo LX+300, LY+100//牛皮纸
Delay 200
LeftClick 1
Delay 200
LeftDown 1
Delay 200
MoveTo 922, 504//任意位置
Delay 200
MoveTo LLX-4, LLY//目标位置
End If

If lvjing=7 Then
MoveTo LX, LY+200//默片
Delay 200
LeftClick 1
Delay 200
LeftDown 1
Delay 200
MoveTo 922, 504//任意位置
Delay 200
MoveTo LLX-4, LLY//目标位置
End If

If lvjing=8 Then
MoveTo LX+100, LY+200//褪色
Delay 200
LeftClick 1
Delay 200
LeftDown 1
Delay 200
MoveTo 922, 504//任意位置
Delay 200
MoveTo LLX-4, LLY//目标位置
End If
End Sub




Sub 判断是否找到
	If 判断进程结束 = 1 Then 
	判断进程结束 = 0
	Else 
	MessageBox "stop"
	End If
	Delay 300
End Sub
Sub 选择特效2(位置X)
UserVar 加号特效X=0 "设置内容"
UserVar 加号特效Y=0 "设置内容"
UserVar 被减去的值=0 "设置内容"
If 随机特效加号 <=  12 Then 
MoveTo 655,292
加号特效X = 655
加号特效Y = 292
被减去的值 = 13
End If

If 随机特效加号 <= 24 and 随机特效加号 >=13 Then 
MoveTo 655,283
MouseWheel - 4 
加号特效X = 655
加号特效Y = 283
被减去的值 = 25
End If

If 随机特效加号 <= 36 and 随机特效加号 >= 25 Then 
MoveTo 655,283
MouseWheel - 8
加号特效X = 655
加号特效Y = 274
被减去的值 = 37
End If

If 随机特效加号 <= 48 and 随机特效加号 >= 37 Then 
MoveTo 655,283
MouseWheel - 12
加号特效X = 655
加号特效Y = 265
被减去的值 = 49
End If

If 随机特效加号 <= 60 and 随机特效加号 >= 49 Then 
MoveTo 655,283
MouseWheel - 16
加号特效X = 655
加号特效Y = 256
被减去的值 = 61
End If


被减去的值 = 被减去的值 - 13
If 随机特效加号 = (被减去的值 + 1) Then 
MoveTo 加号特效X, 加号特效Y
End If

If 随机特效加号 = (被减去的值 + 2) Then 
MoveTo 加号特效X+102, 加号特效Y
End If

If 随机特效加号 = (被减去的值 + 3) Then 
MoveTo 加号特效X+204, 加号特效Y
End If

If 随机特效加号 = (被减去的值+4) Then 
MoveTo 加号特效X+306, 加号特效Y
End If

If 随机特效加号 = (被减去的值+5) Then 
MoveTo 加号特效X, 加号特效Y + 117
End If

If 随机特效加号 = (被减去的值+6) Then 
MoveTo 加号特效X+102, 加号特效Y+117
End If

If 随机特效加号 = (被减去的值+7) Then 
MoveTo 加号特效X+204, 加号特效Y+117
End If

If 随机特效加号 = (被减去的值+8) Then 
MoveTo 加号特效X+306, 加号特效Y+117
End If

If 随机特效加号 = (被减去的值+9) Then 
MoveTo 加号特效X, 加号特效Y+234
End If

If 随机特效加号 = (被减去的值+10) Then 
MoveTo 加号特效X+102, 加号特效Y+234
End If

If 随机特效加号 = (被减去的值+11) Then 
MoveTo 加号特效X+204, 加号特效Y+234
End If

If 随机特效加号 = (被减去的值+12) Then 
MoveTo 加号特效X+306, 加号特效Y+234
End If

GetCursorPos 加号X, 加号Y
For 10
MoveTo 加号X + 1, 加号Y + 1
MoveTo 加号X - 1, 加号Y - 1//激活加号
Delay 10
Next

Delay 300
LeftClick 1
Delay 200
MouseWheel 99
Delay 200
MoveTo 位置X + 90, 579//避开障碍
Delay 300
LeftClick 1
Delay 300
MoveTo 位置X + 9, 579//删掉多少？
Delay 200
LeftClick 1
Delay 200
MoveTo 669, 552//向左裁剪
Delay 300
LeftClick 1
Delay 300
End Sub

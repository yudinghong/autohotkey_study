# auto hot key
## 修饰符
^ ctrl  
! alt  
\# win  
\+ shift  
& 组合任意两个按键和鼠标按钮  
< 使用成对键左边那个
\> 使用成对键右边那个  
\* 通配符  
~ 激发热键不屏蔽原功能   
$ 通常只在脚本使用 Send 命令发送包含了热键自身的按键时才需要使用此符号  
UP 单词 UP 可以跟在热键名后面使得在释放按键时触发热键  

## 按键
RWin 右win

多个热键通过垂直叠放来执行相同动作  
```autohotkey
^Numpad0::  
^Numpad1::  
MsgBox Pressing either Control+Numpad0 or Control+Numpad1 will display   this message.  
return  
```
通过不为按键或按键组合的热键指定任何操作可以在整个系统中完全禁用它们  
```autohotkey
RWin::return
```

### 上下文相关热键



按下 Control-Alt-S 会让系统以为您按下了 Control-Alt-Delete (由于系统对 Ctrl-Alt-Delete 的侵略性检测). 要变通解决此问题, 请使用 KeyWait 来等待按键释放; 
> ^!s::  
KeyWait Control  
KeyWait Alt  
Send {Delete}  
return  

>:*:]d::  ; 此热字串通过后面的命令把 "]d" 替换成当前日期和时间.
FormatTime, CurrentDateTime,, M/d/yyyy h:mm tt  ; 看起来会像 9/1/2005 3:53 PM 这样
SendInput %CurrentDateTime%
return

``#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t`` 可以修改终止符集合  

* \* 自动触发
* ? 前面不管，最后符合即可
* B0 不进行自动退格删除缩写，可以使用`{left n}`来手动退格，`:*b0:<em>::</em>{left 5}`
* C 区分大小写 c0关闭
* C1 不遵循输入的大小写形式 c0关闭
* Kn 按键延迟
* O 忽略终止符 o0关闭
* R 发送原始文本  延续片段自动使用该选项 r0关闭
* SI SP SE 设置自动替换热字串发送键击的方法
* Z 这个非常少用的选项会在每次热字串触发后重置热字串识别器. 换句话说, 脚本将开始等待全新的热字串, 而不考虑您之前输入的任何内容. 这可以避免意外地触发字符串. 为了进行说明, 请思考下面的字符串:
  >:b0*?:11::  
SendInput xx  
return
  
延续片段
>::text1::
(
Any text between the top and bottom parentheses is treated literally, including commas and percent signs.
By default, the hard carriage return (Enter) between the previous line and this one is also preserved.
    By default, the indentation (tab) to the left of this line is preserved.		
See continuation section for how to change these default behaviors.
)

要在替换文本后发送额外的空格或 tab, 可以把它们加在替换文本后, 但需要在末尾加上重音符/反引号 (`).
>:*:btw::By the way `

## 鼠标
|概述||
|:-|:-|
|LButton|左键|
|RButton|右键|
|MButton|中键|
|高级||
|XButton1|4键|
|XButton2|5键|
|wheel||
|WheelDown|向下滚轮|
|WheelUp|向上滚轮|

## 键盘
|概述||
|:-|:-|
|CapsLock|大写锁定|
|Space|空格键|
|Tab|tab|
|Enter或Return|回车|
|Escape或Esc|退出|
|Backspace或BS|退格|
|光标控制||
|ScrollLock|滚动锁定|
|Delete或Del|dle|
|Insert或Ins|insert|
|Home|Home|
|End|End|
|PgUp|Pageup|
|PgDn|Pagedown|
|Up|上|
|Down|下|
|Left|左|
|Right|右|
|功能||
|F1-F12|F1-F12|
|按键修饰符||
|LWin|左win,<#|
|RWin|右win,>#|
|Control或Ctrl|单独热键时弹起触发，^时按下触发|
|Alt|同上，!|
|Shift|同上，+|
|LControl LCtrl|<^|
|RControl RCtrl|>^|
|LShift|<+|
|RShift|>+|
|LAlt|<!|
|RAlt|>!|
|Browser_Back|后退|
|Browser_Forward|前进|
|Browser_Refresh|刷新|
|Browser_Stop|停止|
|Browser_Search|搜索|
|Browser_Favorites|收藏夹|
|Browser_Home|主页|
|Volume_Mute|静音|
|Volume_Down|调低音量|
|Volume_Up|调高音量|
|Media_Next|下一首|
|Media_Prev|上一首|
|Media_Stop|停止|
|Media_Play_Pause|播放暂停|

### 默认转移符号为反引号 `

`,`和`%`需要转义  \`r \`n \`t

任何命令中的首个逗号可以省略（除非首个参数为空或`:=` 或 `=`开始，或命令单独处于延续片段顶部）

;注释，左侧至少一个空格

/* */注释整块

以and or || && , .开头的句子会自动合并到上一行，所以可以换行书写


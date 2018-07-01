--[[
	文件名:
		scripts/config/colorpicker/keymap.lua
	说明:
		抓色器快捷键映射配置文件


	可以使用的自定义全局函数列表:

		msgbox(text)
			弹出一个显示有文本 @text 提示窗

		writePasteboard(text)
			将文本 @text 写入系统剪贴板

		text|nil = readPasteboard()
			当系统剪贴板中有文本之时，返回文本 @text ，否则返回 nil

		text = inputBox([default, title])
			弹出一个输入提示窗，阻塞并返回
			@default 为文本框中默认存在的文本
			@title 为弹出窗口的标题
			返回最终的文本框中的文本内容 @text

		sel = actionSheet([list])
			弹出一个选择表，阻塞并返回
			@list 为一个顺序表，表中值类型为文本
			@sel 返回被用户选择的那个项的顺序编号

		x,y,color = getCurrentXY()
			获取鼠标最后指向的图片上那个点的相对坐标值及该点颜色值
			@x 横坐标    @y 纵坐标    @color 该点颜色值

		setColorToRegister(reg_idx, color)
			设置某寄存位旁的颜色值
			@reg_idx 寄存位编号(范围 0~9)
			@color 目标颜色值

		setTextToRegister(reg_idx, text) [f 1.7.3]
			设置某寄存位的文本
			@reg_idx 寄存位编号(范围 0~9)
			@text 文本

		text = getTextWithRegister(reg_idx)
			获取某寄存位的文本
			@reg_idx 寄存位编号(范围 0~9)
			@text 寄存位中的文本

		setTextToScriptRegister(reg_idx, text) [f 1.7.3]
			设置某脚本代码寄存位的文本
			@reg_idx 寄存位编号(范围 1~3)
			@text 文本

		text = getTextWithScriptRegister(reg_idx)
			获取某脚本代码寄存位的文本
			@reg_idx 寄存位编号(范围 1~3)
			@text 寄存位中的文本

		setRegA(x, y) [+ 1.7.3]
			设置取色面板上 A 点的坐标记录
			@x 横坐标    @y 纵坐标

		setRegS(x, y) [+ 1.7.3]
			设置取色面板上 S 点的坐标记录
			@x 横坐标    @y 纵坐标

		setRegX(x, y) [+ 1.7.3]
			设置取色面板上 X 点的坐标记录
			@x 横坐标    @y 纵坐标

		setRegC(x, y) [+ 1.7.3]
			设置取色面板上 C 点的坐标记录
			@x 横坐标    @y 纵坐标

		x,y = getRegA() [+ 1.7.3]
			获取取色面板上 A 点的坐标记录
			@x 横坐标    @y 纵坐标

		x,y = getRegS() [+ 1.7.3]
			获取取色面板上 S 点的坐标记录
			@x 横坐标    @y 纵坐标

		x,y = getRegX() [+ 1.7.3]
			获取取色面板上 X 点的坐标记录
			@x 横坐标    @y 纵坐标

		x,y = getRegC() [+ 1.7.3]
			获取取色面板上 C 点的坐标记录
			@x 横坐标    @y 纵坐标

		setTempRectText(text) [+ 1.7.3]
			设置取色面板上临时区域文本
			@text 需要设置的文本

		setClearButtonCallback(clear_callback) [+ 1.7.3]
			设置取色面板清除按钮被点击的回调函数
			@clear_callback
				回调函数，当按钮点击事件触发时，会调用这个函数，并传递被点击的按钮的索引作为唯一的参数
				按钮 全部清除(Z) 的索引为 -1

		setASXCButtonCallback(asxc_callback) [+ 1.7.3]
			设置取色面板 A、S、X、C 四个按钮被点击的回调函数
			@asxc_callback
				回调函数，当按钮点击事件触发时，会调用这个函数，并传递被点击的按钮的索引作为唯一的参数
				四个按钮的索引分别为字符串 "A"，"S"，"X"，"C"

		setMakeScriptButtonCallback(makescript_callback) [+ 1.7.3]
			设置取色面板 生成脚本(F) 按钮被点击的回调函数
			@makescript_callback
				回调函数，当按钮点击事件触发时，会调用这个函数，这个没有参数

		setCtrlMouseLeftCallback(ctrlmouse_callback) [+ 1.7.3]
			设置 Ctrl + 鼠标左键点击 回调函数
			@ctrlmouse_callback
				回调函数，当该事件触发时，会调用这个函数，这个没有参数

		setRemoteCmdCallback(remotecmd_callback) [+ 1.7.10]
			设置 远程指令 回调函数
			@remotecmd_callback
				回调函数，当接收到远程指令的时候，会调用这个函数，并将指令附带的字符串参数当作唯一参数

		port = getRemoteCmdPort() [+ 1.7.10]
			获取接收远程指令的端口，每个抓色器实例的端口都是本机唯一
			@port 将此端口传递给外部程序，然后外部程序可以使用此端口给抓色器传递消息

		table = customFormatsTable()
			获取当前自定义格式配置表
			@table 返回总表

		index = currentFormatIndex()
			获取当前用户所选择的自定义格式的编号
			@index 当前自定义格式在顺序选择中的编号

		w,h = getImageSize() [+ 1.7.4]
			获取当前图片的尺寸
			@w 宽度    @h 高度

		color = getColor(x, y)
			获取图片上某坐标的颜色值
			@x 横坐标    @y 纵坐标
			@color 图片上其坐标点上的颜色值

		r,g,b = getColorRGB(x, y)
			获取图片上某坐标的 R/G/B 值
			@x 横坐标    @y 纵坐标
			@r,@g,@b 图片上其坐标点上的 R/G/B 值

		moveMouseToXY(x, y)
			将鼠标指针移动到图片上的坐标上
			@x 图片上的横坐标
			@y 图片上的纵坐标

		set = getSettingRuleSet()
			获取抓色用户对当前自定义格式的配置设置
			@set 一个对应格式的设置数组(顺序表)

		viewZoomIn()
			放大当前图片

		viewZoomOut()
			缩小当前图片

		viewRotateLeft()
			左旋当前图片

		viewRotateRight()
			右边旋当前图片

--]]

local VK = require("scripts.config.virtual_keycodes")

-- 直接按键
local SK_PRESS_ = {
	[ VK["{A}"		] ] = posToRegA, -- 直接按 A
	[ VK["{S}"		] ] = posToRegS,
	[ VK["{X}"		] ] = posToRegX,
	[ VK["{C}"		] ] = posToRegC,
	[ VK["{D}"		] ] = copyRect,
	[ VK["{Z}"		] ] = clearAllColorRegisters,
	[ VK["{F}"		] ] = makeScripts,
	[ VK["{W}"		] ] = reloadPasteboard,
	[ VK["{`~}"		] ] = colorToPasteboard,
	[ VK["{=+}"		] ] = viewZoomIn,
	[ VK["{-_}"		] ] = viewZoomOut,
	[ VK["{J}"		] ] = viewRotateLeft,
	[ VK["{K}"		] ] = viewRotateRight,
	[ VK["{UP}"		] ] = moveMouseUp,
	[ VK["{DOWN}"	] ] = moveMouseDown,
	[ VK["{LEFT}"	] ] = moveMouseLeft,
	[ VK["{RIGHT}"	] ] = moveMouseRight,
	[ VK["{RETURN}"	] ] = colorToNextColorRegister,
	[ VK["{E}"		] ] = function() -- [+ 1.7.4]
		local x, y = getRegA()
		setRegA(getRegX())
		setRegX(x, y)
		x, y = getRegS()
		setRegS(getRegC())
		setRegC(x, y)
	end,
	[ VK["{R}"		] ] = repickColor, -- [+ 1.7.4]
}

for i=0,9 do
	SK_PRESS_[ VK["{"..(i).."}"] ] = _G["colorToColorRegister"..(i)]
end


-- Shift + 按键
local SK_SHIFT_ = {
	[ VK["{A}"		] ] = moveMouseToPosOfRegA, -- 按住 Shift 键再按 A
	[ VK["{S}"		] ] = moveMouseToPosOfRegS,
	[ VK["{X}"		] ] = moveMouseToPosOfRegX,
	[ VK["{C}"		] ] = moveMouseToPosOfRegC,
	[ VK["{D}"		] ] = clearRect,
	[ VK["{UP}"		] ] = moveMouseUp10,
	[ VK["{DOWN}"	] ] = moveMouseDown10,
	[ VK["{LEFT}"	] ] = moveMouseLeft10,
	[ VK["{RIGHT}"	] ] = moveMouseRight10,
	[ VK["{E}"		] ] = function() -- [+ 1.7.4]
		setRegA(0, 0)
		setRegS(0, 0)
	end,
}

for i=0,9 do
	SK_SHIFT_[ VK["{"..(i).."}"] ] = _G["clearColorRegister"..(i)]
end


-- Ctrl + 按键
local SK_CTRL_ = {
	[ VK["{UP}"		] ] = moveMouseUp100, -- 按住 Ctrl 键再按 ↑
	[ VK["{DOWN}"	] ] = moveMouseDown100,
	[ VK["{LEFT}"	] ] = moveMouseLeft100,
	[ VK["{RIGHT}"	] ] = moveMouseRight100,
}

-- Alt + 按键
local SK_ALT_ = {
	[ VK["{D}"		] ] = function() -- Alt + D 是一个快捷键注册演示
		local cfg = customFormatsTable()[currentFormatIndex()]
		local r = dialogPickArgs{
			title = "一个弹窗",
			caption = {"参数", "值"},
			args = {
				{"参数一", "100"},
				{"参数二", "200"},
				{"当前选择的自定义格式的标题", cfg[1]},
			},
		}
		if r then
			for i,v in ipairs(r) do
				print(i,v)
			end
		end
	end,
	[ VK["{UP}"		] ] = moveMouseUp100,
	[ VK["{DOWN}"	] ] = moveMouseDown100,
	[ VK["{LEFT}"	] ] = moveMouseLeft100,
	[ VK["{RIGHT}"	] ] = moveMouseRight100,
}


-- Ctrl + Shift + 按键
local SK_CTRL_SHIFT_ = {

}


-- Ctrl + Alt + 按键
local SK_CTRL_ALT_ = {

}


-- Alt + Shift + 按键
local SK_ALT_SHIFT_ = {

}


-- Ctrl + Alt + Shift + 按键
local SK_CTRL_ALT_SHIFT_ = {

}


------------------------------------------------------------------------------
return {
	SK_PRESS_,
	SHIFT = SK_SHIFT_,
	CTRL = SK_CTRL_,
	ALT = SK_ALT_,
	CTRL_SHIFT = SK_CTRL_SHIFT_,
	CTRL_ALT = SK_CTRL_ALT_,
	ALT_SHIFT = SK_ALT_SHIFT_,
	CTRL_ALT_SHIFT = SK_CTRL_ALT_SHIFT_,
}

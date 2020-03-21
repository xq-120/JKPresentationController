# JKPresentationController
JKPresentationController封装了弹窗的显示与隐藏，并提供了默认的淡入淡出动画。使用者只需关注弹窗的内容，其他的交给这个库就完事了。

特点
* 提供统一的弹出与隐藏方法，规范 API。
* 提供默认的淡入淡出动画，支持自定义弹出/隐藏动画。
* 与具体的弹窗内容无关，自由度更高。
* 采用扩展的方式实现，对代码无侵入性。
* 兼容 OC。

# 使用
创建好弹窗控制器后,调用弹出方法即可.
```
let alert = JKBroadcastBeginAlertViewController.init()
//在内部创建的 window 上弹出。
alert.jk_show(withAnimated: true) {

}
```
或
```
let alert = JKPublishCommentAlertViewController.init()
//在当前控制器上弹出
alert.jk_show(withViewController: self, animated: true) {

}
```
弹出时默认是淡入淡出效果,可根据需要自己实现其他动画.

关闭弹窗:
```
self.jk_hide(withAnimated: true) { [unowned self] in

}
```

一些弹窗示例:

<img src="https://raw.githubusercontent.com/xq-120/cloudImage/master/pictures/20200315223637.png" alt="图片替换文本" width="200" height="400" align="middle" />

<img src="https://raw.githubusercontent.com/xq-120/cloudImage/master/pictures/20200315223713.png" alt="图片替换文本" width="200" height="400" align="middle" />

<img src="https://raw.githubusercontent.com/xq-120/cloudImage/master/pictures/20200315223732.png" alt="图片替换文本" width="200" height="400" align="middle" />

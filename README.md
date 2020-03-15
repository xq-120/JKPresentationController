# JKPresentationController
基于UIPresentationController对弹窗公共部分的一层封装.
JKPresentationController封装了弹窗的显示与隐藏功能并提供了默认的淡入淡出效果,弹出的内容由使用者决定,自由度更高.采用扩展的方式实现,代码侵入性更小.

# 使用
创建好弹窗控制器后,调用弹出方法即可.
```
let alert = JKBroadcastBeginAlertViewController.init()
alert.jk_show(withAnimated: true) {

}
```
或
```
let alert = JKPublishCommentAlertViewController.init()
alert.jk_show(withViewController: self, animated: true) {

}
```
弹出时默认是淡入淡出效果,可根据需要自己实现其他动画.

关闭弹窗:
```
self.jk_hide(withAnimated: true) { [unowned self] in

}
```

示例如下:

![](https://raw.githubusercontent.com/xq-120/cloudImage/master/pictures/20200315223637.png)

![](https://raw.githubusercontent.com/xq-120/cloudImage/master/pictures/20200315223713.png)

![](https://raw.githubusercontent.com/xq-120/cloudImage/master/pictures/20200315223732.png)

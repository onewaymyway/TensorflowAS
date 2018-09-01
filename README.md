# TensorflowAS
AS3.0 version of tensorflow.js

突然有个大胆的想法，想要翻译一版tensorflow

机器学习是未来不可逆的大趋势，还是得好好学习才行

目前打算两步走战略

经实践，发现得插入当前在走的第0步，那就是先把几个好玩的库先搞个AS能跑的Demo运行看看

看看能不能先搞出点好玩的东西，先在应用层玩，应用层玩熟了再去搞底层的东西

0.1.PoseNet demo 可运行

0.2.FaceAPI demo 可运行

0.3.webcam-transfer-learning demo 可运行


第一步：

生成as版的语法提示，目的是能在as3项目中使用tensorflow.js的api

这一步打算用python抓取官方文档，分析文档内容自动生成as3代码提示类


状态:

1.初步版本已经完成

2.现在类的继承关系还没处理，原因是官方文档中的类是不全的，需要手动加一些没有的类才能在加入继承关系之后不报错，下一步打算补全类然后加上继承

2.1.加上了继承，但是又发现新的坑了，文档里的方法不全，Tensor类的好多方法文档里没写，要做好这个提示得搞个TS文件提取描述的程序，又是工作量啊！！

2.2.其实解析TS文件我是拒绝的，在犹豫这个到底还做不做了

3.as3现在最大的缺陷是，不能优雅的写await,单纯的用Promise方式写代码感觉很丑


第二步：

考虑是不是真的要翻译一版，目的是了解tensorflow.js的实现细节

如果这一步真的做了就会对tensorflow的底层有个细致的了解，是成为引擎级的玩家的必经之路

这一步不一定会走，待定

前一阵子也粗略的看了一下ts版本的代码，感觉好多语法as真的无能为力，而且ts代码的代码结构也没有as那么清晰

想要真的翻译一版感觉有点不靠谱，所以还是只做个代码提示算了，不翻译了



另外：

打算看看是不是能做个tensorflow的图像化编辑器，毕竟这是现在的老本行

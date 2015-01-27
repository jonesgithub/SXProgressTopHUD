# SXProgressTopHUD
这是一个在屏幕顶端的消息指示器
---

<br />
甩出一个信息，里面可以填充类似于“成功”的消息。
````objc
[SXProgressTopHUD throwSuccess:@"保存成功 ^。^"];
````


甩出一个信息，里面可以填充类似于“失败”的消息。
````objc
[SXProgressTopHUD throwError:@"保存失败 0.0"];
````
<br />
<br />

甩出一个信息，里面可以填充类似于“耐心等待”的消息，但本消息不会自动消失，需要配合completeLoading方法使用
建议：传入字数不要超过10个汉字，即20个字符。以达到最佳效果
````objc
[SXProgressTopHUD throwLoading:@"正在玩命加载中。。。"];
````
加载完毕后 隐藏等待信息。
````objc
[SXProgressTopHUD completeLoading];
````
<br />
<br />

甩出一个信息，传入图片名，里面可以填充自定义消息和自定义图片
````objc
[SXProgressTopHUD throwMessage:@"欢迎来到沙盒" withImageName:@"welcome.png"];
````

甩出一个信息，传入图片，里面可以填充自定义消息和自定义图片
````objc
[SXProgressTopHUD throwMessage:@"请勿重复点击" withImage:imgNo];
````

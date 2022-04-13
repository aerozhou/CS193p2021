# CS193p2021

Stanford CS193p 2021的所有代码和学习笔记。

## 1. Lecutre 1 

学习时间：2022.4.9

### 1.1 课程内容

老师讲得太好了，虽然开头略显冗长。

Assets.xcassets的作用：存放所有素材资源。

分析代码：

```swift
var body: some View {
    Text("Hello, world.") // 其实是 return Text("Hello, world.")
}
```

Some View 的意思：

1. 说明可能有几种类型的View，可能是 Text，image或者其他。

.padding() 的意思：距离边界一个值。就好像把东西填充了，正好这个view就在相对中间了。

ZStack的两种用法

Zstack垂直于页面方向布局

```swift
ZStack(alignment: .top, content: {
    Text("Hello, world")
})
// 或者下面这种，更简洁。
ZStack(alignment: .top){
  Text("Hello, world")
}
```

修改字体大小为20: 

```swift
.font(.system(size: 20))
```

## 2. Lecture 2

### 2.1 课程内容：

做出一个卡片，点击时翻面。

1. 做一个CardView
2. 翻面的情况（用isFaceUp）
3. 点击翻面（用onTapGesture()）

CardView 里的小问题：

一个 RoundedRectangle 是没有办法同时填充内部，并且定义轮廓线。因此可以叠加两个 RoundedRectangle。

```swift
RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 5)
RoundedRectangle(cornerRadius: 20).fill(.blue)
```

```swift
@State var isFaceUp: Bool = false
```

慎用`@State`因为值并没有改变。



定义卡片里的图形时，用ForEach

```swift
ForEach(emojis, id: \.self, content: { emoji in
    CardView(content: emoji)
})
```

```swift
LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
    code
}
```



遇到的Bug

```swift
var emojis = ["🦏", "🦏", "🦚", "🐶", "🐶"]
LazyVGrid(columns: [GridItem(), GridItem()]) {
                ForEach(emojis[0..<emojiCount], id: \.self) {emoji in
                    CardView(content: emoji)
                }
            }
```

一旦 emojis 数组里有重复的，LazyVGrid 就会报错：



非常奇怪。

emojis 数组改成不重复的以后，就正常了。



@State 的用法

这个以后会不常用。



LazyVGrid 官方文档

```swift
var columns: [GridItem] =
         Array(repeating: .init(.flexible()), count: 2)
 ScrollView {
     LazyVGrid(columns: columns) {
         ForEach((0...79), id: \.self) {
             // $0 传递闭包里的第一个参数
             let codepoint = $0 + 0x1f600
             let codepointString = String(format: "%02X", codepoint)
             Text("\(codepointString)")
             let emoji = String(Character(UnicodeScalar(codepoint)!))
             Text("\(emoji)")
         }
     }.font(.largeTitle)
 }
```

$0表示传递给Swift闭包的第一个参数


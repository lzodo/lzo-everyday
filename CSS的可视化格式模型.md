> * CSS中规定每一个元素都有自己的盒子模型（相当于规定了这个元素如何显示）
> * 然后可视化格式模型则是把这些盒子按照规则摆放到页面上，也就是如何布局
> * 换句话说，盒子模型规定了怎么在页面里摆放盒子，盒子的相互作用等等
> * CSS的可视化格式模型就是规定了浏览器在页面中如何处理文档树

#### 包含块（Containing Block）
>一个元素的box的定位和尺寸，会与某一矩形框有关，这个框就称之为包含块。
* 根元素是最顶端的元素，它没有父节点，它的包含块就是初始包含块
* static和relative的包含块由它最近的块级、单元格或者行内块祖先元素的内容框（content）创建
* fixed的包含块是当前可视窗口
* absolute的包含块由它最近的position 属性为absolute、relative或者fixed的祖先元素创建

#### 控制框（Controlling Box）
#### BFC（Block Formatting Context）
#### IFC（Inline Formatting Context）
#### 定位体系
#### 浮动
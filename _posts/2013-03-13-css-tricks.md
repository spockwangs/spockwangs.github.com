---
layout: post
title: Some CSS Tricks
tags:
- css
---

## 多列布局

多列布局在网页设计中十分普遍，但是实现起来却不容易，因为CSS布局模型内置并不
支持。我们要求多列布局每一列都等高，以方便每一列设置背景色。

HTML代码为

    <div class="col-wrapper">
      <div class="col-3-4">
      </div>
      <div class="col-1-4">
      </div>
    </div>

相应的CSS代码为

    .col-wrapper {
        display: block;
        overflow: hidden;
    }
    .col-3-4, .col-1-4 {
        display: block;
        float: left;
        padding-bottom: 9999px;
        margin-bottom: -9999px;
    }
    .col-3-4 {
        display: block;
        width: 75%;
        float: left;
        background-color: red;
    }
    .col-1-4 {
        display: block;
        width: 25%;
        float: left;
        background-color: blue;
    }

上面的CSS规则利用了背景颜色和padding的关系来设置背景色，使得两列的背景色一
样高。利用margin的负值来平衡高度的计算。`overflow`属性用来去掉超出的背景色。

## Grid布局

Grid布局是一种使包含的元素自适应地从左到右从上到下的布局方式，相当于把block
元素当成文字一样排版。

我们用`<li>`元素表示每个格子，像下面这样。

    <div class="grid">
      <li>
        <!-- 放置你要布局的内容 -->
      </li>
      <li>
      </li>
    </div>

`grid`的样式如下：

    .grid {
        display: block;
        list-style-type: none;
        overflow: hidden;
    }
    
如果每个格子的宽度是固定的，可以这样定义`<li>`的样式：

    .grid > li {
        display: block;
        width: 100px;
        margin: 0;
        padding: 0;
        float: left;
    }

如果格子之间要留一定的空格可以这样定义：

    .grid > li {
        display: block;
        width: 100px;
        margin: 0;
        padding: 0;        
        padding-right: 10px;
        box-sizing: border-box;
        float: left;
    }
    .grid > li:last-of-type {
        padding-right: 0;
    }

注意：最后一个格子右边没有空格。

如果格子的宽度是由包含的元素决定的，可以这样：

    .grid > li {
        display: inline-block;
        float: left;
        margin-left: 10px;
    }

`inline-block`元素的宽度是由内部包含的元素决定的。

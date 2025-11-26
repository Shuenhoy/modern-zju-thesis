#import "../lib.typ": flex-caption, fonts, mulcite

#import fonts: *

= 一个Chapter
旧历的年底毕竟最像年底，村镇上不必说，就在天空中也显出将到新年的气象来。灰白色的沉重的晚云中间时时发出闪光，接着一声钝响，是送灶的爆竹；近处燃放的可就更强烈了，震耳的大音还没有息，空气里已经散满了幽微的火药香。我是正在这一夜回到我的故乡鲁镇的。虽说故乡，然而已没有家，所以只得暂寓在鲁四老爷的宅子里。他是我的本家，比我长一辈，应该称之曰“四叔”，是一个讲理学的老监生。他比先前并没有甚么大改变，单是老了些，但也还未留胡子，一见面是寒暄，寒暄之后说我“胖了”，说我“胖了”之后即大骂其新党。但我知道，这并非借题在骂我：因为他所骂的还是康有为。但是，谈话是总不投机的了，于是不多久，我便一个人剩在书房里。
== 一个Section
我们可以用 image 来插入现有的 jpg 等格式的图片，如@fig:zju-logo。

#figure(
  image("../assets/zju-emblem.svg", width: 40%),
  caption: [浙江大学 LOGO],
) <zju-logo>
如@tbl:sample 所示，这是一张自动调节列宽的表格。


#figure(
  table(
    columns: (auto, 1fr),
    align: (center, center),
    stroke: black,
    [第一列], [第二列],
    [xxx], [xxx],
    [xxx], [xxx],
    [xxx], [xxx],
  ),
  caption: "自动调节列宽的表格",
)<sample>


如@eqt:eq:sample 所示，这是一个公式。
$
  A = overbrace((a + b + c) + underbrace(i(d + e + f), "虚数"), "复数")
$<eq:sample>

如@lst:code-sample 所示，这是一段代码 @zjuthesis，@floater2005surface，@WANG2022102149，@chCurl。这是连续引用测试 #mulcite(<zjuthesis>, <floater2005surface>, <WANG2022102149>, <chCurl>)。

#figure(
  image("../assets/zju-emblem.svg", width: 40%),
  caption: flex-caption(long: [#lorem(100)一个很长的caption11。 @chCurl], short: "长Caption"),
)<zju-2>
#figure(
  ```
  #include <stdio.h>

  int main(int argc, char *argv[])
  {
      printf("Hello, zjuthesis\n");
      return 0;
  }
  ```,
  caption: "simple.c",
) <code-sample>

=== 关于字体
英文字体通常提供了粗体和斜体的组合，中文字体通常没有粗体或斜体，本模板使用了 "stroke" 来实现中文伪粗体，但不提供中文斜体。

#figure(
  caption: "一些字体示例",
  table(
    columns: 5,
    [字体], [常规], [粗体], [斜体], [粗斜体],
    [Times New Roman], [Regular], [*Bold*], [_Italic_], [*_Bold Italic_*],
    [仿宋],
    [#show: fangsong; 常规],
    [#show: fangsong; *粗体*],
    [#show: fangsong; _斜体_],
    [#show: fangsong; *_斜粗体_*],

    [宋体], [#show: songti; 常规], [#show: songti; *粗体*], [#show: songti; _斜体_], [#show: songti; *_斜粗体_*],
    [黑体], [#show: heiti; 常规], [#show: heiti; *粗体*], [#show: heiti; _斜体_], [#show: heiti; *_斜粗体_*],
    [楷体], [#show: kaiti; 常规], [#show: kaiti; *粗体*], [#show: kaiti; _斜体_], [#show: kaiti; *_斜粗体_*],
  ),
)

== 另一个Section
第二天我起得很迟，午饭之后，出去看了几个本家和朋友；第三天也照样。他们也都没有甚么大改变，单是老了些；家中却一律忙，都在准备着“祝福”。这是鲁镇年终的大典，致敬尽礼，迎接福神，拜求来年一年中的好运气的。杀鸡，宰鹅，买猪肉，用心细细的洗，女人的臂膊都在水里浸得通红，有的还带着绞丝银镯子。煮熟之后，横七竖八的插些筷子在这类东西上，可就称为“福礼”了，五更天陈列起来，并且点上香烛，恭请福神们来享用，拜的却只限于男人，拜完自然仍然是放爆竹。年年如此，家家如此，——只要买得起福礼和爆竹之类的——今年自然也如此。天色愈阴暗了，下午竟下起雪来，雪花大的有梅花那么大，满天飞舞，夹着烟霭和忙碌的气色，将鲁镇乱成一团糟。我回到四叔的书房里时，瓦楞上已经雪白，房里也映得较光明，极分明的显出壁上挂著的朱拓的大“寿”字，陈抟老祖写的，一边的对联已经脱落，松松的卷了放在长桌上，一边的还在，道是“事理通达心气和平”。我又无聊赖的到窗下的案头去一翻，只见一堆似乎未必完全的《康熙字典》，一部《近思录集注》和一部《四书衬》。无论如何、我明天决计要走了。

况且，一直到昨天遇见祥林嫂的事，也就使我不能安住。那是下午，我到镇的东头访过一个朋友，走出来，就在河边遇见她；而且见她瞪着的眼睛的视线，就知道明明是向我走来的。我这回在鲁镇所见的人们中，改变之大，可以说无过于她的了：五年前的花白的头发，即今已经全白，会不像四十上下的人；脸上瘦削不堪，黄中带黑，而且消尽了先前悲哀的神色，仿佛是木刻似的；只有那眼珠间或一轮，还可以表示她是一个活物。她一手提着竹篮。内中一个破碗，空的；一手拄著一支比她更长的竹竿，下端开了裂：她分明已经纯乎是一个乞丐了。我就站住，豫备她来讨钱。
=== 一个Subsection
“你回来了？”她先这样问。

“是的。”
==== 一个Subsubsection
“你回来了？”她先这样问。

“是的。”
== 又一个Section

#lorem(100)

#lorem(120)

#lorem(130)
== AA
== BB
#lorem(10)

= 另一个Chapter first<chap:1>
#figure(
  image("../assets/zju-emblem.svg", width: 40%),
  caption: [浙江大学 LOGO],
) <zju-logo3>
== 又一个Section<sec:1>
@chap:1
@sec:1
=== 又一个Subsection<subsec:1>
@subsec:1

“就是——”她走近两步，放低了声音，极秘密似的切切的说，“一个人死了
之后，究竟有没有魂灵的？”

# 浙江大学 Typst 学位论文模板 `modern-zju-thesis`

* **警告：** 本模板目前处于实验性阶段，请谨慎使用，对输出结果应进行检查和确认。在实验性阶段本模板可能会不加预告地对接口进行破坏性更改。

## 使用方法
1. 本模板尚未发布至 Typst Universe，请先以 Git Submodule 等方式使用。一种可能的目录结构为：
* `/`
    * `templates/`
        * `modern-zju-thesis/`
    * `fonts/`
    * `main.typ`
    * `ref.bib`

2. 安装所需字体：`FangSong` `Kaiti` `SimHei` `SimKai` `TimesNewRoman`。 亦可通过本仓库目录 `scripts/get-fonts.sh` 将该字体下载至 `fonts` 路径。若采用后者，则需要在 Typst 的命令中添加 `--font-path <path-to-fonts-dir>` 选项来指定字体目录。

3. 在`main.typ`填入下列内容，亦可从本仓库目录 `examples` 下得到稍复杂的样例，和本科生模板样例。

```typ
#import "./templates/modern-zju-thesis/lib.typ":  graduate-general
#import graduate-general: *

#let info = (
  title: ("毕业论文/设计题目", ""),
  title-en: ("Graduation Thesis Title", ""),
  grade: "2014级",
  student-id: "学号",
  author: "姓名",
  department: "学院",
  major: "专业",
  degree: "博士",
  supervisor: "指导教师",
  submit-date: "递交日期",
)


#let doc = graduate-general(info: info, twoside: true)
#show: doc.style

#doc.pages.cover
#doc.pages.title-zh
#doc.pages.title-en

#doc.pages.decl

#show: frontmatter

#let individual = doc.pages.individual
#individual("致 谢")[]
#individual("摘 要")[]
#individual("Abstract")[]

#doc.pages.outline
#doc.pages.figure-outline
#doc.pages.table-outline

#show: mainmatter

= Hello
== World

#individual("参考文献", outlined: true)[
  #bibliography("ref.bib", style: "gb-7714-2015-numeric", title: none)
]

#individual("附录", outlined: true)[
  #appendix(level: 1)[
    == 一个附录 <app1>
    @app1
    == 另一个附录

  ]
]

#individual("作者简历", outlined: true)[
  *基本信息：*
  - 姓名：
  - 性别：
  - 民族：
  - 出生年月：
  - 籍贯：

  *教育经历：*
  - 2199.09 - 2203.06：浙江大学攻读学士学位

  *攻读#(info.degree)学位期间主要的研究成果：*

]

```

4. 编译 `typst compile main.typ` 或 `typst compile --font-dir fonts main.typ`

## 已知问题
* 本科模板不支持双语参考文献（英文文献未能显示“et al.”而是“等”）。
* 本科模板仅能以 `@name` 的形式引用参考文献，而不能使用 `cite(<name>)` 的形式，否则分部分参考文献编号会有错误。
* Prose citations (即 LaTeX 的 `\citep`，例如 `Alec et al. [5]`) 格式不正确。
* 目录中章节的页码有误。（推测由 https://github.com/typst/typst/issues/4527 导致，等待上游修复）
* 本模板的部分样式可能与 `zjuthesis` 不同，有待根据学校官方文件分辨哪部分不同是需要处理的。
* 目前仅包含计算机学院本科（论文）与研究生通用模板。


## 致谢
* https://github.com/TheNetAdmin/zjuthesis
* https://github.com/nju-lug/modern-nju-thesis

## License
* MIT License
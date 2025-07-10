\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nwuthesis}[2025/07/10 Northwest University Thesis Class v1.1]

% 1. 加载基础类
\LoadClass[zihao=-4, a4paper, oneside, UTF8]{ctexart} % 小四, A4纸, 单面, UTF8编码

% 2. 页面几何尺寸
\RequirePackage[a4paper,top=2.50cm,bottom=2.50cm,left=2.00cm,right=2.00cm,footskip=1cm]{geometry}

% 3. 字体设置
\RequirePackage{fontspec}
\setmainfont{Times New Roman} % 如果学校要求特定西文字体，取消注释并设置
% ctexart 会设置默认中文字体。以下是用户自定义特定字体文件或特性：
\let\kaishu\relax % 清除旧定义
\newCJKfontfamily\kaishu{KaiTi}[AutoFakeBold]   % 楷体, 伪粗体 (确保系统有 KaiTi 字体)
\let\songti\relax % 清除旧定义
\newCJKfontfamily\songti{SimSun}[AutoFakeBold,AutoFakeSlant] % 宋体, 伪粗体, 伪斜体 (确保系统有 SimSun 字体)
% 如果 \heiti 也需要特殊指定 (例如用于图表标题)，则类似定义:
% \let\heiti\relax
% \newCJKfontfamily\heiti{SimHei}[AutoFakeBold]

% 4. 图像处理
\RequirePackage{graphicx}
\graphicspath{{figures/}{images/}}   % 图片搜索路径 (可添加更多)

% 5. 目录格式控制
\RequirePackage{tocloft}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}} % section 条目在目录中的前导符为点
\renewcommand{\cfttoctitlefont}{\centering\zihao{-2}\bfseries} % 目录标题字体大小


% 6. 表格相关宏包
\RequirePackage{booktabs}       % 专业三线表
\RequirePackage{threeparttable} % 表格注释
\RequirePackage{longtable}      % 跨页表格
\RequirePackage{array}          % 增强 tabular 和 array 环境
\RequirePackage{tabularx}       % 用于 tabularx 环境和 X 列
\RequirePackage{ragged2e}       % 用于 X 列中的 \RaggedRight, \Centering, \RaggedLeft (可选，改善对齐)
\RequirePackage{multirow}       % 多行单元格


% 7. 数学公式相关
\RequirePackage{amsmath, amssymb}

% 8. 算法排版
\RequirePackage[ruled,linesnumbered]{algorithm2e} % linesnumbered 显示行号

% 9. 浮动体控制
\RequirePackage[section]{placeins} % 避免图片/表格浮动超过其所在 Section
\RequirePackage{float}             % 强制图片/表格浮动到指定位置

% 10. 列表环境自定义
\RequirePackage{enumitem}

% 11. 子图排版
\RequirePackage{subcaption}

% 12. 参考文献引用样式 (natbib)
\RequirePackage[numbers,super,square]{natbib} % 数字引用, 上标, 方括号
% 自定义citeinline命令，用于在正文中引用文献时，不显示上标
\makeatletter
\newcommand{\citeinline}[1]{{%
    \begingroup
    \renewcommand{\textsuperscript}[1]{##1}%
    \cite{#1}%
    \endgroup
}}
\makeatother



% 13. 行距设置
\RequirePackage{setspace}
\renewcommand{\baselinestretch}{1.62}  % 全局1.5倍行距（修正为1.62匹配WPS的1.5倍行间距）

% 14. 代码列表 (listings)
\RequirePackage{listings}
\lstset{
    breaklines=true,                % 自动断行
    basicstyle=\ttfamily\small,     % 基本字体: 等宽, 小号
    keywordstyle=\color{blue},      % 关键词颜色 (示例)
    commentstyle=\color{green!70!black}, % 注释颜色 (示例)
    stringstyle=\color{red},        % 字符串颜色 (示例)
    showstringspaces=false,         % 不显示字符串中的空格符号
    % numbers=left,                 % 行号位置 (可选)
    % numberstyle=\tiny\color{gray},% 行号样式 (可选)
    % frame=single,                 % 代码块边框 (可选)
}

% 15. 页眉页脚设置 (fancyhdr)
\RequirePackage{fancyhdr}
\pagestyle{fancy} % 默认使用 fancy 样式
\fancyhf{} % 清空所有页眉页脚域
\renewcommand{\headrulewidth}{0pt} % 去除页眉分割线
\renewcommand{\footrulewidth}{0pt} % 去除页脚分割线

% 定义 'plain' 页面样式 (通常用于章节首页、空白页等)
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[C]{\zihao{-5}\thepage}% 页脚居中页码，小五号
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}

% 定义常规 'fancy' 页面样式 (用于普通正文页)
\fancyhead{} % 清空页眉 (如果需要页眉内容，在此设置，如 \fancyhead[L]{\leftmark})
\fancyfoot[C]{\zihao{-5}\thepage} % 页脚居中页码，小五号

% 16. 全局排版调整和自定义命令
% \xeCJKsetup{CJKecglue=} % 如果全局需要调整中西文间距，在此设置。
                         % ctexart 已有默认处理，请测试效果决定是否保留。



% 图、表、公式编号格式 (与章节关联)
\numberwithin{figure}{section}
\numberwithin{table}{section}
\numberwithin{equation}{section} % 公式也按章节编号

\renewcommand{\thefigure}{\thesection-\arabic{figure}} % 图编号：节-序号
\renewcommand{\thetable}{\thesection-\arabic{table}}   % 表编号：节-序号
\renewcommand{\theequation}{\thesection-\arabic{equation}} % 公式编号：(节-序号)

% 图、表标题格式 (caption)
\RequirePackage{caption} % 确保 caption 包在 \captionsetup 前加载
\DeclareCaptionFont{heiti}{\heiti} % 声明用于标题的黑体 (确保 \heiti 已定义)
\captionsetup{
    labelfont={heiti},        % 标签字体: 黑体, 加粗 (bf可选)
    textfont={heiti},         % 标题文本字体: 黑体
    font=small,               % 整体字号: small (五号)
    labelformat=default,      % 标签格式，如 "图 1-1"
    labelsep=space,           % 标签和标题之间的分隔符: 空格
    % format=hang,            % 标题悬挂缩进 
    justification=centering   % 图表标题居中
}

% 参考文献环境格式 (thebibliography)
\RequirePackage{etoolbox} % 用于 \AtBeginEnvironment
\AtBeginEnvironment{thebibliography}{%
  \zihao{5} % 参考文献条目: 五号字
  \kaishu   % 参考文献条目: 楷体 
  \setlength{\itemsep}{5pt}  % 条目间垂直间距
  \setlength{\bibsep}{5pt}   % (natbib) 条目间垂直间距
}

% 修改参考文献条目标号格式 ([1])
\makeatletter
% \renewcommand\@biblabel[1]{\quad\quad[#1]} % 原右对齐尝试
\renewcommand\@biblabel[1]{[#1]\hfill}  % 标号左对齐，并用空白填充 (适用于左对齐列表)
\makeatother

% 17. 封面信息宏定义
\makeatletter % 允许在命令名中使用 @ 符号

% 定义存储封面信息的内部变量 (并给予默认值，以免未设置时出错)
\def\@papertitle{在此处填写论文题目}
\def\@studentname{未填写}
\def\@studentid{未填写}
\def\@supervisor{未填写}
\def\@faculty{未填写}
\def\@major{未填写}
\def\@grade{未填写}

% 定义用户用于设置信息的命令
\newcommand{\PaperTitle}[1]{\def\@papertitle{#1}}
\newcommand{\StudentName}[1]{\def\@studentname{#1}}
\newcommand{\StudentID}[1]{\def\@studentid{#1}}
\newcommand{\Supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\Faculty}[1]{\def\@faculty{#1}}
\newcommand{\Major}[1]{\def\@major{#1}}
\newcommand{\Grade}[1]{\def\@grade{#1}}

% 定义生成封面信息的命令
\newcommand{\MakeCoverInfo}{%
    % 题目
    % 原来的 \underline{标题} 是一个固定长度的下划线区域
    % 如果希望下划线长度随标题内容变化，可以直接 \underline{\@papertitle}
    % 如果希望标题在一个固定宽度的下划线区域内居中，可以使用 \underline{\makebox[<width>][c]{\@papertitle}}
    % 这里我假设标题内容本身被下划线，并且字体较大
    \vspace{0.65cm}
    \songti
    \parbox[t]{\textwidth}{\centering % 使用 parbox 并配合 \centering 使标题居中
        \zihao{3}\textbf{题目：}%
        \zihao{2}\heiti\underline{\hspace{0.5em}\@papertitle\hspace{0.5em}}% 在标题内容前后加一点空白
    }

    \vspace{1.5cm}

    % 学生信息表格
    \centering % 使表格居中
    { % 加一个分组，使得 \zihao 和 \renewcommand 的作用范围局限在此处
        \zihao{-3}\bfseries % 小三号字，加粗
        \renewcommand{\arraystretch}{1.25} % 调整行间距系数
        \begin{tabular}{r@{\hspace{1em}}l} % 右对齐标签，然后是1em的间隔，然后是左对齐内容
            \textbf{学生姓名}         &\underline{\makebox[5cm][c]{\@studentname}} \\
            \textbf{学\quad\quad 号} & \underline{\makebox[5cm][c]{\@studentid}} \\
            \textbf{指导教师}         & \underline{\makebox[5cm][c]{\@supervisor}} \\
            \textbf{院\quad\quad 系} & \underline{\makebox[5cm][c]{\@faculty}} \\
            \textbf{专\quad\quad 业} & \underline{\makebox[5cm][c]{\@major}} \\
            \textbf{年\quad\quad 级} & \underline{\makebox[5cm][c]{\@grade}} \\
        \end{tabular}
    }
}
\makeatother

% 18. 关键词宏定义 (expl3 版本)
\RequirePackage{xparse} % expl3 命令定义需要
\ExplSyntaxOn
\seq_new:N \l_thesis_keywords_seq % 使用特定前缀
\NewDocumentCommand{\keywords}{m}
 {
  {% 新增分组，确保 \xeCJKsetup 和 \noindent 局部有效
  \par % 新行开始
  \xeCJKsetup{CJKecglue=} % 仅在关键词内部调整中西文间距
  \textbf{关键词：}
  \seq_set_split:Nnn \l_thesis_keywords_seq { , } { #1 } % 按逗号分割
  \seq_remove_all:Nn \l_thesis_keywords_seq { } % 移除空项
  \seq_use:Nn \l_thesis_keywords_seq { \hspace*{0.5em} } % 用指定间距连接
  \par % 结束关键词段落
  }%
 }
\ExplSyntaxOff

% 19. 标题格式设置
\RequirePackage{titlesec}
\titleformat{\section}
  {\normalfont\zihao{-2}\bfseries\centering}{\thesection}{1em}{}
\titleformat{\subsection}
  {\normalfont\zihao{-3}\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}
  {\normalfont\zihao{4}\bfseries}{\thesubsubsection}{1em}{}
\titleformat{\subsubsubsection}
  {\normalfont\zihao{4}\bfseries}{\thesubsubsubsection}{1em}{}


% 20. PDF 书签和链接 (hyperref) - 建议较晚加载
\RequirePackage[
    bookmarksnumbered=true,   % 书签编号
    bookmarksopen=true,       % 默认展开书签树
    bookmarksopenlevel=2,     % 展开到第2级 (chapter, section)
    colorlinks=true,          % 使用颜色链接而非边框
    linkcolor=black,          % 内部链接颜色 (目录, 交叉引用)
    citecolor=black,          % 参考文献引用颜色
    urlcolor=blue,            % URL链接颜色
    % pdfsubject={},          % PDF主题 (可选)
    % pdfkeywords={}          % PDF关键词 (可选, 可考虑用 \keywords 的内容)
]{hyperref}


% 确保类文件末尾有此命令
\endinput
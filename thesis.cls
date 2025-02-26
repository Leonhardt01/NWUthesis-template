\NeedsTeXFormat{LaTeX2e}

% 检查编译引擎，要求使用 XeLaTeX 或 LuaLaTeX。
\RequirePackage{iftex}
\ifXeTeX\else
  \ifLuaTeX\else
    \ustc@error{XeLaTeX or LuaLaTeX is required to compile this document}
  \fi
\fi

\ProvidesClass{thesis}
%12pt即为全局小四
\LoadClass[12pt, a4paper, oneside, UTF8]{ctexart}
\RequirePackage{fontspec}    % 使用 fontspec 包
\RequirePackage{graphicx}    % 使用 graphicx 包
\RequirePackage{tocloft}     % 目录格式控制
% 33\RequirePackage{ctex}        % 中文支持

% % 设置中文字体
% \newfontface\songti{SimSun}   % 宋体
% \newfontface\kaishu{KaiTi}    % 楷体
% \newfontface\heiti{SimHei}    % 黑体

% 设置自定义字号（例如：小二，小四，五号）
\newcommand{\one}{\fontsize{26pt}{31.2pt}\selectfont}
\newcommand{\smallone}{\fontsize{24pt}{28.8pt}\selectfont}
\newcommand{\two}{\fontsize{22pt}{26.4pt}\selectfont}
\newcommand{\smalltwo}{\fontsize{18pt}{21.6pt}\selectfont}
\newcommand{\three}{\fontsize{16pt}{19.2pt}\selectfont}
\newcommand{\smallthree}{\fontsize{15pt}{18pt}\selectfont}
\newcommand{\four}{\fontsize{14pt}{16.8pt}\selectfont}
\newcommand{\smallfour}{\fontsize{12pt}{14.4pt}\selectfont}
\newcommand{\five}{\fontsize{10.5pt}{12.6pt}\selectfont}


% 设置行间距
\renewcommand{\baselinestretch}{1.5}  % 行间距为1.5倍

% 设置标题样式
\newcommand{\mytitlefont}{\huge\bfseries}
\newcommand{\mycontentfont}{\LARGE}

% 自定义间距
\newcommand{\myvspace}{\vspace{1cm}} % 自定义垂直空白1cm

% 设置参考文献字体大小
\def\bibfont{\fontsize{10.5pt}{12.6pt}\selectfont} 
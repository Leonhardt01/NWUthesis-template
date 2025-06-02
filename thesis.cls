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
% \RequirePackage{ctex}        % 中文支持

% % 设置中文字体
% \newfontface\songti{SimSun}   % 宋体
% \newfontface\kaishu{KaiTi}    % 楷体
% \newfontface\heiti{SimHei}    % 黑体


% 设置行间距
\renewcommand{\baselinestretch}{1.5}  % 行间距为1.5倍

% 设置标题样式
\newcommand{\mytitlefont}{\huge\bfseries}
\newcommand{\mycontentfont}{\LARGE}

% 自定义间距
\newcommand{\myvspace}{\vspace{6pt}} % 自定义垂直空白6pound

% % 设置页码字号为小五
% \makeatletter
% \renewcommand{\@evenfoot}{
%   \hfil \zihao{2} \thepage \hfil
% }
% \renewcommand{\@oddfoot}{\@evenfoot}
% \makeatother



\RequirePackage{etoolbox}       
\AtBeginEnvironment{thebibliography}{
  \zihao{5}
  \kaishu                    % 楷体
  \setlength{\itemsep}{0pt}  % 可选：调整条目间距
}


\makeatletter
% \renewcommand\@biblabel[1]{\quad\quad[#1]} % 参考文献标号右对齐
\renewcommand\@biblabel[1]{[#1]\hfill}  % 参考文献标号左对齐
\makeatother



\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hainnuthesis}[2021/11/03 Thesis Template for Hainan Normal University]

\LoadClass[UTF8,fontset=none,zihao=-4,linespread=1.42]{ctexbook}
%设置页边距
\newcommand\checkbox{\raisebox{.5ex}{\fbox{\phantom{\rule{.5ex}{.5ex}}}}}
\RequirePackage[%
%showframe,
a4paper,
hmargin=3.17cm,
vmargin=2.54cm,
headheight=\baselineskip,
headsep=0.5cm
]{geometry}

%文档选项
\RequirePackage{kvoptions}

\SetupKeyvalOptions{
	family = @hainnuthesis,
	prefix = @hainnuthesis@
}

\DeclareBoolOption[true]{arabictitlenum}       % automatically creates \ifmypackage@fullpage
\DeclareComplementaryOption{chinesetitlenum}{arabictitlenum}  % automatically inverses the former
\DeclareBoolOption[true]{academdegree}       % automatically creates \ifmypackage@fullpage
\DeclareComplementaryOption{profesdegree}{academdegree}  % automatically inverses the former
\ProcessKeyvalOptions*{}
\if@hainnuthesis@arabictitlenum
	\ctexset{%
		chapter={%
			pagestyle=hainnu@headings,
			format=\centering\heiti\zihao{3},
			number={\thechapter},
			name={第,章\quad},
			aftername={},
			fixskip=true,
			beforeskip=1.4cm,
			afterskip=1.0cm,
		},
		section={% 四号字体
			format=\raggedright\heiti\zihao{4}\hspace{8mm},
			number={\thesection\quad},
			name={},
			aftername={},
			beforeskip=0pt,
			afterskip=0pt
		},
		subsection={% 小四号字体 
			format=\raggedright\bfseries\heiti\zihao{-4}\hspace{2\ccwd},
			afterskip=0pt,
			number={\thesubsection},
			name={},
		}
	}
\else
	\ctexset{%
		chapter={%
			pagestyle=hainnu@headings,
			format=\centering\heiti\zihao{3},
			number={\chinese{chapter}},
			name={第,章\quad},
			aftername={},
			fixskip=true,
			beforeskip=1.4cm,
			afterskip=1.0cm,
		},
		section={% 四号字体
			format=\raggedright\heiti\zihao{4}\hspace{8mm},
			number={\chinese{section}},
			name={第,节\quad},
			aftername={},
			beforeskip=0pt,
			afterskip=0pt
		},
		subsection={% 小四号字体 
			format=\raggedright\bfseries\heiti\zihao{-4}\hspace{2\ccwd},
			afterskip=0pt,
			number={\chinese{subsection}},
			name={第,小节\quad},
		}
	}
\fi

\newlength\twolineskip
\setlength\twolineskip{\baselineskip}

\RequirePackage{diagbox}

%参考文献按照国家标准GB/T-7714指定的格式自动生成
\RequirePackage{gbt7714}


% 数学字体设定
\RequirePackage{amsmath,amssymb,amsfonts}%
\RequirePackage{pifont}%

% 列表设定
\RequirePackage{enumerate}


% 插图设定
\RequirePackage{graphics}%
\RequirePackage{graphicx}%
\RequirePackage[rgb]{xcolor}%
\RequirePackage{subfigure}%
\RequirePackage{caption}%
\RequirePackage{float}%
\RequirePackage{epsfig}%

% 表格设定
\RequirePackage{multirow}%
\RequirePackage{makecell}%
\RequirePackage{array}%
\RequirePackage{booktabs}%
\RequirePackage{longtable}%
\RequirePackage{tabularx}%
\def\tabularxcolumn#1{m{#1}}


% 程序代码环境
\RequirePackage{listings} 

%Tikz绘图工具包
\RequirePackage{tikz}
\usetikzlibrary{arrows,math,calc,topaths,positioning,automata,shapes,chains}
\RequirePackage{pgfplots}
\RequirePackage{tikz-3dplot}
\usetikzlibrary{backgrounds,mindmap}

\pgfplotsset{compat=1.14}
\tikzset{>=latex}


\RequirePackage{subfigure}
\RequirePackage{graphicx}
\RequirePackage{array}
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

%字体设置
\RequirePackage{newtxtext,newtxmath}
\RequirePackage{xeCJKfntef}
\RequirePackage{fontspec}

\newCJKfontfamily{\songti}{simsun.ttc}[%
Path={./fonts/},
UprightFont = *,
AutoFakeBold=2.5
]

\newCJKfontfamily{\heiti}{simhei.ttf}[%
Path={./fonts/},
UprightFont = *,
AutoFakeBold=1.5
]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set Figures path
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\graphicspath{{figures/}{logoimage/}}

%页眉设置
\RequirePackage{fancyhdr}
\if@hainnuthesis@arabictitlenum
	\renewcommand{\chaptermark}[1]{\markboth{第\,\thechapter \,章\quad #1}{}}
\else
	\renewcommand{\chaptermark}[1]{\markboth{第\,\chinese{chapter} \,章\quad #1}{}}
\fi
	
\fancypagestyle{hainnu@headings}{%
    \fancyhead{}
    \fancyhead[OC]{\songti\zihao{5}\leftmark}
    \fancyhead[EC]{\songti\zihao{5}海南师范大学{\hainnu@degreelevel}学位论文}
    \fancyfoot{}
    \fancyfoot[C]{\zihao{-5}\thepage}
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0pt}}
\renewcommand\frontmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{roman}
    \pagestyle{plain}}
\renewcommand\mainmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmattertrue
    \pagenumbering{arabic}
    \pagestyle{hainnu@headings}}
\renewcommand\backmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagestyle{hainnu@headings}}

\setcounter{tocdepth}{1} 


%定义关键字
\RequirePackage{xparse}
\RequirePackage{xkeyval, kvsetkeys}
\NewDocumentCommand\hainnu@define@key{m}{%
    \csdef{hainnu@set@#1}##1{\csdef{hainnu@#1}{##1}}	
    \define@key{hainnu}{#1}{\csuse{hainnu@set@#1}{##1}}}
\NewDocumentCommand{\hainnu@setkeys}{m}{\kvsetkeys{hainnu}{#1}}
\let\hainnuset\hainnu@setkeys
% -- keys in Chinese
\hainnu@define@key{schoolcode}
\hainnu@define@key{classifier}
\hainnu@define@key{studentid}
\hainnu@define@key{secretlevel}
\hainnu@define@key{author}
\hainnu@define@key{supervisor}
\hainnu@define@key{supervisorB}
\hainnu@define@key{acadetitle}
\hainnu@define@key{acadetitleB}
\hainnu@define@key{primarydisc}
\hainnu@define@key{secndrydisc}
\hainnu@define@key{profesfield}
\hainnu@define@key{researchdir}
\hainnu@define@key{degreelevel}
\hainnu@define@key{degreetype}
\hainnu@define@key{submitdate}
\hainnu@define@key{title}
% -- keys in English
\hainnu@define@key{eauthor}
\hainnu@define@key{etitle}
\hainnu@define@key{edegreelevel}
\hainnu@define@key{esupervisor}
\hainnu@define@key{eacadetitle}
\hainnu@define@key{esupervisorB}
\hainnu@define@key{eacadetitleB}
\hainnu@define@key{ethesistype}   
%% ==== Cover and titlepage
\renewcommand\maketitle{%
    \parindent=0pt
    \cleardoublepage\thispagestyle{empty}
    \begin{center}
        \mbox{}\par\vspace{.25cm}
        {\bfseries\zihao{-4}
            \renewcommand\arraystretch{.9}
            \setlength\tabcolsep{0pt}
            \begin{tabular}{p{5\ccwd}p{10\ccwd}p{6\ccwd}l}
                \makebox[5\ccwd][s]{学校代码：}  & \CJKunderline{\makebox[6\ccwd][c]{\hainnu@schoolcode}} & \makebox[6\ccwd][s]{研究生学号：} & \CJKunderline{\makebox[8\ccwd][c]{\hainnu@studentid}} \\
                \makebox[5\ccwd][s]{分类号：}   & \CJKunderline{\makebox[6\ccwd][c]{\hainnu@classifier}} & \makebox[6\ccwd][s]{密级：} & \CJKunderline{\makebox[8\ccwd][c]{\hainnu@secretlevel}}
        \end{tabular}}
        \par\vspace{2cm}
        \includegraphics[width=.55\textwidth]{logo.jpg}
        \par\vspace{.6cm}
        {\zihao{0}\heiti {\hainnu@degreelevel}学位论文}
        \par\vspace{1.2cm}
        {\zihao{2}\bfseries\heiti\linespread{1}\selectfont
            \setlength\tabcolsep{0pt}
            \begin{tabular*}{.85\textwidth}{P{.85\textwidth}}
                \hainnu@title
        \end{tabular*}}
        \par\vspace{2.5cm}
        {\zihao{3}\heiti
            \renewcommand\arraystretch{1.1}
            \if@hainnuthesis@academdegree
	            \begin{tabular}{@{}p{7\ccwd}@{~}p{13\ccwd}@{}}
	            	\makebox[7\ccwd][s]{论文作者} & \CJKunderline{\makebox[13\ccwd][c]{\hainnu@author}\hfill\mbox{}} \\
	            	\makebox[7\ccwd][s]{指导教师} & \CJKunderline{\makebox[13\ccwd][c]{{\hainnu@supervisor}\quad{\hainnu@acadetitle}}\hfill\mbox{}} \\
	            	\makebox[7\ccwd][s]{一级学科} & \CJKunderline{\makebox[13\ccwd][c]{\hainnu@primarydisc}\hfill\mbox{}} \\
	            	\makebox[7\ccwd][s]{二级学科} & \CJKunderline{\makebox[13\ccwd][c]{\hainnu@secndrydisc}\hfill\mbox{}} \\
	            	\makebox[7\ccwd][s]{研究方向} & \CJKunderline{\makebox[13\ccwd][c]{\hainnu@researchdir}\hfill\mbox{}} \\
	            	\makebox[7\ccwd][s]{申请学位类别} & \CJKunderline{\makebox[13\ccwd][c]{\hainnu@degreetype}\hfill\mbox{}} \\
	            	\makebox[7\ccwd][s]{提交日期} & \CJKunderline{\makebox[13\ccwd][c]{\hainnu@submitdate}\hfill\mbox{}} 
	        	\end{tabular}
            \else
                \begin{tabular}{@{}p{7\ccwd}@{~}p{13\ccwd}@{}}
	            	\makebox[7\ccwd][s]{论文作者} & \CJKunderline{\makebox[13\ccwd][c]{\hainnu@author}\hfill\mbox{}} \\
	            	\makebox[7\ccwd][s]{指导教师} & \CJKunderline{\makebox[13\ccwd][c]{{\hainnu@supervisor}\quad{\hainnu@acadetitle}}\hfill\mbox{}} \\
	            	\quad & \CJKunderline{\makebox[13\ccwd][c]{{\hainnu@supervisorB}\quad{\hainnu@acadetitleB}}\hfill\mbox{}} \\
	            	\makebox[7\ccwd][s]{专业学位领域} & \CJKunderline{\makebox[13\ccwd][c]{\hainnu@profesfield}\hfill\mbox{}} \\
        		    \makebox[7\ccwd][s]{申请学位类别} & \CJKunderline{\makebox[13\ccwd][c]{\hainnu@degreetype}\hfill\mbox{}} \\
	            	\makebox[7\ccwd][s]{提交日期} & \CJKunderline{\makebox[13\ccwd][c]{\hainnu@submitdate}\hfill\mbox{}} 
            	\end{tabular}
            \fi
        }
    \end{center}
    \cleardoublepage
    \begin{center}
        \mbox{}\par\vspace{1.25cm}
        {\zihao{-2}\bfseries
            \setlength\tabcolsep{0pt}
            \begin{tabular*}{.8\textwidth}{P{.8\textwidth}}
                \hainnu@etitle
        \end{tabular*}}
        \par\vspace{1cm}
        {\zihao{-3} A {\hainnu@ethesistype} Submitted for the Degree of {\hainnu@edegreelevel}}
        \par\vspace{5cm}
        {\zihao{-3}\bfseries
       	\if@hainnuthesis@academdegree
	        \begin{tabular*}{6.5cm}{rp{3cm}}
	                Candidate: & {\hainnu@eauthor} \\
	                Supervisor: & {\hainnu@eacadetitle}~~{\hainnu@esupervisor}
	        \end{tabular*}
	    \else 
	    	\begin{tabular*}{6.5cm}{rp{5cm}}
	    	Candidate: & {\hainnu@eauthor} \\
	    	Supervisor: & {\hainnu@eacadetitle}~~{\hainnu@esupervisor}\\
	    	\quad & {\hainnu@eacadetitleB}~~{\hainnu@esupervisorB}
	    	\end{tabular*}
 	    \fi
		}
        \par\vspace{7cm}
        {\zihao{-3}\bfseries
            Hainan Normal University
            \par\vspace{.5cm}
            Haikou, China}
    \end{center}
    \cleardoublepage
    \begin{center}\makebox[5cm][s]{\zihao{-3}\bfseries\songti 独创性声明}\end{center}
    \hspace{2\ccwd}本人声明所呈交的{\hainnu@degreelevel}学位论文是本人在导师指导下进行的研究工作及取得的研究成果。除文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，\kern-.5ex也不包含为获得海南师范大学或其他教育机构的学位或证书而使用过的材料。\kern-.5ex与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。\par
    \hspace{2\ccwd}学位论文作者签名：\rule[-2mm]{37mm}{.4pt}\hfill 日期：\rule[-2mm]{37mm}{.4pt}
    \par\vspace{1.5cm}
    \begin{center}\makebox[5cm][s]{\zihao{-3}\bfseries\songti 学位论文著作权声明}\end{center}
    \hspace{2\ccwd}本论文作者声明：\par
    \hspace{2\ccwd}~\checkbox~本论文全部成果均为本人和指导教师合作研究取得，本人和指导教师都有权使用本成果学术内容（有第三方约定者除外）。\par
    \hspace{2\ccwd}~\checkbox~本论文为指导教师指导下，本人独自完成。本人独自享有本论文的全部著作权。\par
    \hspace{2\ccwd}学位论文作者签名：\rule[-2mm]{25mm}{.4pt}\hfill 指导教师签名：\rule[-2mm]{25mm}{.4pt}
    \par\vspace{.5cm}
    \hspace{2\ccwd}\makebox[9\ccwd][s]{日期：}\rule[-2mm]{25mm}{.4pt}\hfill \makebox[7\ccwd][s]{日期：}\rule[-2mm]{25mm}{.4pt}
    \par\vspace{1.5cm}
    \begin{center}\makebox[6cm][s]{\zihao{-3}\bfseries\songti 学位论文版权使用授权书}\end{center}
    \hspace{2\ccwd}本学位论文作者完全了解海南师范大学有关保留、使用学位论文的规定，即：海南师范大学有权保留并向国家有关部门或机构送交学位论文的复印件和电子文本，允许论文被查阅和借阅。本人授权海南师范大学可以将学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或其它复制手段保存、汇编学位论文。(保密的学位论文在解密后适用本授权书) \par
    \hspace{2\ccwd}学位论文作者签名：\rule[-2mm]{25mm}{.4pt}\hfill 指导教师签名：\rule[-2mm]{25mm}{.4pt}
    \par\vspace{.5cm}
    \hspace{2\ccwd}\makebox[9\ccwd][s]{日期：}\rule[-2mm]{25mm}{.4pt}\hfill \makebox[7\ccwd][s]{日期：}\rule[-2mm]{25mm}{.4pt}
    %
    \parindent=2\ccwd
}
%


%
%% ==== Abstract Environment
\RequirePackage[inline]{enumitem}
\def\c@abstractname{摘\hspace{2\ccwd}要}
\def\e@abstractname{Abstract}
\NewDocumentCommand { \abstract } { o }
{%
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\IfNoValueTF{#1}{中文摘要}{英文摘要}}
    \mbox{}
    \par\vspace{\baselineskip}
    \noindent
    \makebox[\textwidth][c]{%
        \zihao{-3}\IfNoValueTF{#1}{\heiti\c@abstractname}{\bfseries\e@abstractname}}
    \par\vspace{\baselineskip}
}
% ---- innovation
\NewDocumentEnvironment { inovation } { o +m } {%
    \par\vspace{\baselineskip}
    {\bfseries\IfNoValueTF{#1}{创新点：}{#1:}}
    \par
    \begin{enumerate*}[label=\arabic*.~,itemjoin=\\\hspace*{\parindent}]
        #2
}{\end{enumerate*}}
% ---- \keywords
\NewDocumentCommand { \keywords } { o +m } {%
    \par\vspace{\baselineskip}
    \textbf{\IfNoValueTF{#1}{关键词：}{#1:~}}#2
}

%% Command for create special chapters
\NewDocumentCommand\special@chapter%
{ s m O{\zihao{3}\heiti} m m m }%
{\csdef{#2}{%
\cleardoublepage%
\phantomsection%
\IfBooleanTF{#1}{\thispagestyle{empty}}{\addcontentsline{toc}{chapter}{#4}\chaptermark{#4}}%
\markboth{{#4}}{{#4}}
\mbox{}%
\\[#5]%
\noindent\makebox[\textwidth][c]{#3#4}%
\par\vspace{#6}%
}}
%

% ==== Preface
\def\@introname{序\hspace{2\ccwd}言}
\special@chapter% 
{introduction}%     <- command name
[\zihao{3}\heiti]%  <- chapter titleformat(optional, default->\zihao{3}\heiti)
{\@introname}%      <- chapter title
{\baselineskip}%   <- beforeskip: 2 lines
{\baselineskip}%    <- afterskip: 1 line

% ==== Conclusion
\def\@conclusionname{结\hspace{2\ccwd}论}
\special@chapter% 
{conclusion}%       <- command name
[\zihao{3}\heiti]%  <- \heiti\zihao{3}
{\@conclusionname}% <- chapter title
{\baselineskip}%   <- beforeskip: 2 lines
{\baselineskip}%    <- afterskip: 1 line

% ==== Reference
\def\@referencename{参考文献}
\special@chapter% 
{reference}%       <- command name
[\zihao{3}\heiti]%  <- \heiti\zihao{3}
{\@referencename}% <- chapter title
{\baselineskip}%   <- beforeskip: 2 lines
{\baselineskip}%    <- afterskip: 1 line

% ==== Appendix
\def\@appendixname{附\hspace{2\ccwd}录}
\special@chapter% 
{appendices}%       <- command name
[\zihao{3}\heiti]%  <- \heiti\zihao{3}
{\@appendixname}%   <- chapter title
{\baselineskip}%   <- beforeskip: 2 lines
{\baselineskip}%    <- afterskip: 1 line

% ==== Achievements
\def\@achievename{在学期间学术成果情况}
\special@chapter% 
{achievements}%     <- \achievements
[\zihao{3}\heiti]%  <- \heiti\zihao{3}
{\@achievename}%    <- title
{0pt}%    <- beforeskip 1 line
{\baselineskip}%    <- afterskip 1 line

% ==== Acknowledgement
\def\@acknowledgement{致\hspace{2\ccwd}谢}
\special@chapter% 
{acknowledgement}%     <- \acknowledgement
[\zihao{3}\heiti]%     <- \heiti\zihao{3}
{\@acknowledgement}%   <- title
{\baselineskip}%      <- beforeskip: 2 lines
{\baselineskip}%       <- afterskip: 1 line

% ==== Resolution
\def\@resolution{答辩委员会委员签名的答辩决议书（归档论文）}
\special@chapter*% 
{resolution}%          <- \resolution
[\zihao{4}\heiti]%     <- \heiti\zihao{4}
{\@resolution}%        <- title
{-\baselineskip}%                 <- beforeskip: 0pt
{0pt}%                 <- afterskip: 0pt

%% ==== Bibliography
\RequirePackage{natbib}
\setlength{\bibsep}{0pt}
\renewcommand{\bibsection}{}
%
%% ==== ToC
\renewcommand\contentsname{目\hspace{2\ccwd}录}
\renewcommand{\tableofcontents}{%
    \cleardoublepage\thispagestyle{plain}
    \phantomsection\addcontentsline{toc}{chapter}{\contentsname}
    \mbox{}\\[\baselineskip]%
    \noindent\makebox[\textwidth][c]{\zihao{-2}\heiti\contentsname}
    \par\vspace{\baselineskip}
    \@starttoc{toc}
}

\RequirePackage{titletoc}
\contentsmargin{0pt}

\titlecontents{chapter}
[0pt]
{\bfseries\zihao{-4}}
{\makebox[5.32em][s]{\thecontentslabel}\hspace*{-0.1cm}}%调整目录章节编号大概为4个字符
%{\renewcommand{\CJKglue}{\hskip 6pt}\thecontentslabel\renewcommand{\CJKglue}{\hskip 0pt}\hspace*{-0.1cm}}
{}
{\titlerule*[1.5mm]{$\cdot$}\thecontentspage}
%[\nointerlineskip]
%

\titlecontents{section}
[0pt]
{\zihao{-4}\hspace{2\ccwd}}
{\hspace*{-1em}\thecontentslabel}
{}
{\titlerule*[1.5mm]{$\cdot$}\thecontentspage}
[\nointerlineskip]
%

%% 公式编号
\usepackage{chngcntr}
\counterwithin*{equation}{section}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{section}.\arabic{equation}}
%% 
\AtBeginDocument{\pagestyle{empty}}
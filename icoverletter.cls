\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{icoverletter}[2022/11/14 Cover letter for journal submissions]

% include dependencies
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage[skip=10pt plus1pt, indent=40pt]{parskip}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% load class
\LoadClass[a4paper,onecolumn]{article}

% set margins
\addtolength{\oddsidemargin}{-.800in}
\addtolength{\evensidemargin}{-.800in}
\addtolength{\textwidth}{1.75in}
\addtolength{\topmargin}{-.800in}
\addtolength{\textheight}{1.75in}

% set a little indendation for paragraphs
\setlength{\parindent}{0.1em}

% space between paragraphs
\setlength{\parskip}{1em}

% define a command for the address of authors
\newcommand{\aboutme}[1]{
\noindent
\fancyfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\pagestyle{fancy}
  \fancyhf{}
   % show logo of author's institution on the left side
  \fancyhead[L]{\raisebox{\dimexpr-\height+\baselineskip}[0pt][0pt]{\includegraphics[width=1.75in]{imgs/um-logo.png}}}
  % show address on the rigt side
  \fancyhead[R]{\leavevmode\large
  \begin{tabular}[t]{l@{}}
    #1
  \end{tabular}}
\vspace*{6\baselineskip}
}

\newcommand{\final}[1]{We believe that the interesting new perspective created by our paper would deserve the attention of a broad scientific audience. We hope that the manuscript will find your interest, and that you will consider it for publication in #1}

\newcommand{\declaration}[1]{This manuscript is the authors' original work and has not been published nor has it been submitted simultaneously elsewhere. All authors have checked the manuscript and have agreed to the submission. \\}

\newcommand{\conflictofinterest}[1]{We have no conflicts of interest to disclose. \\}

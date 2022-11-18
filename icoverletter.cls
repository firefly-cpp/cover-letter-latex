\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{icoverletter}[2022/11/14 Cover letter for journal submissions]

% include dependencies
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{parskip}

\usepackage[utf8]{inputenc}
\usepackage[english]{babel}
\usepackage{framed}
\usepackage{lipsum}
\usepackage[iso,american]{isodate}

% no indent for whole document
\setlength\parindent{0pt}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% load class
\LoadClass[a4paper,onecolumn]{article}

\usepackage{orcidlink}

% set margins
\addtolength{\oddsidemargin}{-.800in}
\addtolength{\evensidemargin}{-.800in}
\addtolength{\textwidth}{1.75in}
\addtolength{\topmargin}{-.800in}
\setlength{\headheight}{84.0pt}
\addtolength{\textheight}{1.75in}

% set a little indendation for paragraphs
\setlength{\parindent}{0.1em}

% space between paragraphs
\setlength{\parskip}{1em}

% define a command for the address of authors
\newcommand{\aboutme}[1]{
%\noindent
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
%\vspace*{3\baselineskip}
}

% Name and Surname of the sender
\def\NameSurname#1{\def\@NameSurname{#1}}
\newcommand{\pNameSurname}{\@NameSurname}
% Orcid ID of author
\def\AuthorOrcid#1{\def\@AuthorOrcid{#1}}
\newcommand{\pAuthorOrcid}{\@AuthorOrcid}
% name of the institution
\def\InstitutionName#1{\def\@InstitutionName{#1}}
\newcommand{\pInstitutionName}{\@InstitutionName}
% Command for Faculty of Electrical Engineering ....
\newcommand{\Feri}[1]{University of Maribor \\
			   Faculty of Electrical Engineering \\ and Computer Science \\}
% Street and House No.      
\def\StreetNo#1{\def\@StreetNo{#1}}
\newcommand{\pStreetNo}{\@StreetNo}
% Postal code, City, Country
\def\CityPostal#1{\def\@CityPostal{#1}}
\newcommand{\pCityPostal}{\@CityPostal}
% journal name
\def\JournalName#1{\def\@JournalName{#1}}
\newcommand{\pJournalName}{\@JournalName}
% title of your paper
\def\Title#1{\def\@Title{#1}}
\newcommand{\pTitle}{\@Title}
% name of the EiC
\def\Editor#1{\def\@Editor{#1}}
\newcommand{\pEditor}{\@Editor}
% TODO make this optional
\def\SpecialIssue#1{\def\@SpecialIssue{#1}}
\newcommand{\pSpecialIssue}{\@SpecialIssue}

\def\abstract#1{\def\@abstract{#1}}
\newcommand{\pabstract}{\@abstract}

\def\final#1{\def\@final{#1}}
\newcommand{\pfinal}{\@final}

\def\declaration#1{\def\@declaration{#1}}
\newcommand{\pdeclaration}{\@declaration}

\def\conflictofinterest#1{\def\@conflictofinterest{#1}}
\newcommand{\pconflictofinterest}{\@conflictofinterest}

\def\valediction#1{\def\@valediction{#1}}
\newcommand{\pvalediction}{\@valediction}

\newcommand{\yourssincerely}[1]{Yours sincerely,\\}
\newcommand{\yoursfaithfully}[1]{Yours faithfully,\\}
\newcommand{\yourstruly}[1]{Yours truly,\\}

\newcommand{\makecoverletter}{
\large % Font size
\aboutme{
    \pNameSurname \orcidlink{\pAuthorOrcid}\\
    \pInstitutionName\\
    \pStreetNo\\
    \pCityPostal
    }
%---------------------------------

\noindent\makebox[\linewidth]{\rule{0.9\paperwidth}{0.4pt}}

% Date
\today
\vspace*{2\baselineskip}

To the editor: \pEditor

\vspace*{1\baselineskip}
Dear Editor,

We submit our paper titled: \pTitle , which we would like to be considered for publication in \pJournalName. Our paper belongs to the special issue \pSpecialIssue

\begin{framed}
Abstract: \pabstract
\end{framed}

\pfinal{\pJournalName} \newline

\pdeclaration \newline

\pconflictofinterest \newline

\vfill

\pvalediction \par

\pNameSurname, on behalf of all authors
}


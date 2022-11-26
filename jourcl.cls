\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jourcl}[2022/11/14 Cover letter for journal submissions]

% include dependencies
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{parskip}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{framed}
\RequirePackage{lipsum}
\RequirePackage[iso,american]{isodate}
\RequirePackage{etoolbox}

% no indent for whole document
\setlength\parindent{0pt}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% load class
\LoadClass[a4paper,onecolumn]{article}

\RequirePackage{orcidlink}

% set margins
\addtolength{\oddsidemargin}{-.800in}
\addtolength{\evensidemargin}{-.800in}
\addtolength{\textwidth}{1.75in}
\addtolength{\topmargin}{-.800in}
\setlength{\headheight}{84.0pt}
\addtolength{\textheight}{1in}

% set a little indendation for paragraphs
\setlength{\parindent}{0.1em}

% space between paragraphs
\setlength{\parskip}{1em}

% Custom Role of first recommended person
\def\ImagePath#1{\def\@ImagePath{#1}}
\newcommand{\pImagePath}{\@ImagePath}

% define a command for the address of authors
\newcommand{\aboutme}[1]{
%\noindent
\fancyfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\pagestyle{fancy}
  \fancyhf{}
   % show logo of author's institution on the left side
  \fancyhead[L]{\raisebox{\dimexpr-\height+\baselineskip}[0pt][0pt]{\includegraphics[width=.4\textwidth]{\pImagePath}}}
  % show address on the rigt side
  \fancyhead[R]{\leavevmode\large
  \begin{tabular}[t]{l@{}}
    #1
  \end{tabular}}
}

%----------------------------------------------------------------------
% Function to check empty string
\def \ifempty#1{\def\temp{#1} \ifx\temp\empty }

% Recommended persons
%----------------------------------------------------------------------
% Custom Role of first recommended person
\def\FirstRecommended#1{\def\@FirstRecommended{#1}}
\newcommand{\pFirstRecommended}{\@FirstRecommended}
% name, surname of first recommended person
\def\FirstNameSurname#1{\def\@FirstNameSurname{#1}}
\newcommand{\pFirstNameSurname}{\@FirstNameSurname}
% institution of of first recommended person
\def\FirstInstitution#1{\def\@FirstInstitution{#1}}
\newcommand{\pFirstInstitution}{\@FirstInstitution}
% email of of first recommended person
\def\FirstEmail#1{\def\@FirstEmail{#1}}
\newcommand{\pFirstEmail}{\@FirstEmail}

% Custom Role of second recommended person
\def\SecondRecommended#1{\def\@SecondRecommended{#1}}
\newcommand{\pSecondRecommended}{\@SecondRecommended}
% name, surname of second recommended person
\def\SecondNameSurname#1{\def\@SecondNameSurname{#1}}
\newcommand{\pSecondNameSurname}{\@SecondNameSurname}
% institution of second recommended person
\def\SecondInstitution#1{\def\@SecondInstitution{#1}}
\newcommand{\pSecondInstitution}{\@SecondInstitution}
% email of second recommended person
\def\SecondEmail#1{\def\@SecondEmail{#1}}
\newcommand{\pSecondEmail}{\@SecondEmail}

% Custom Role of third recommended person
\def\ThirdRecommended#1{\def\@ThirdRecommended{#1}}
\newcommand{\pThirdRecommended}{\@ThirdRecommended}
% name, surname of third recommended person
\def\ThirdNameSurname#1{\def\@ThirdNameSurname{#1}}
\newcommand{\pThirdNameSurname}{\@ThirdNameSurname}
% institution of third recommended person
\def\ThirdInstitution#1{\def\@ThirdInstitution{#1}}
\newcommand{\pThirdInstitution}{\@ThirdInstitution}
% email of third recommended person
\def\ThirdEmail#1{\def\@ThirdEmail{#1}}
\newcommand{\pThirdEmail}{\@ThirdEmail}
%----------------------------------------------------------------------

% \RecommendedPerson{Role}{Name Surname}{Institution}{Email}
%----------------------------------------------------------------------
% command to render recommended person - check if empty, check if string is only whitespace, else table
\def \RecommendedPerson#1#2#3#4{ \ifempty{#1} % empty
    \else 
    \sbox0{#1}%
      \ifdim\wd0=0pt %
        {} %
    \else%
        \ifdim0pt=\dimexpr\ht0+\dp0\relax
        {} % 
    \else
          { %
            \begin{tabular}{p{1\linewidth}}
                \centering  #1 \\
                \centering  #2 \\ 
                \centering  #3 \\
                \centering  #4 \\
            \end{tabular} 
          }% if #1 is not empty
    \fi
\fi 
}
% Your data
%----------------------------------------------------------------------
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

% Submission data
%----------------------------------------------------------------------
% journal name
\def\JournalName#1{\def\@JournalName{#1}}
\newcommand{\pJournalName}{\@JournalName}

% title of your paper
\def\Title#1{\def\@Title{#1}}
\newcommand{\pTitle}{\@Title}

% name of the Editor
\def\Editor#1{\def\@Editor{#1}}
\newcommand{\pEditor}{\@Editor}

% TODO make this optional
\def\SpecialIssue#1{\def\@SpecialIssue{#1}}
\newcommand{\pSpecialIssue}{\@SpecialIssue}

% Cover letter main part
%----------------------------------------------------------------------
% Addressing the Person
\def\PersonAddressing#1{\def\@PersonAddressing{#1}}
\newcommand{\pPersonAddressing}{\@PersonAddressing}

% Introduction - paragraph before abstract
\def\Introduction#1{\def\@Introduction{#1}}
\newcommand{\pIntroduction}{\@Introduction}

% Abstract
\def\abstract#1{\def\@abstract{#1}}
\newcommand{\pabstract}{\@abstract}

% Final - paragraph after abstract
\def\final#1{\def\@final{#1}}
\newcommand{\pfinal}{\@final}

% Declaration of original work
\def\declaration#1{\def\@declaration{#1}}
\newcommand{\pdeclaration}{\@declaration}


% Declare no conflict of interests
\def\conflictofinterest#1{\def\@conflictofinterest{#1}}
\newcommand{\pconflictofinterest}{\@conflictofinterest}

% Valediction - Ending of the letter
\def\valediction#1{\def\@valediction{#1}}
\newcommand{\pvalediction}{\@valediction}

% Different predefined valedictions
\newcommand{\yourssincerely}[1]{Yours sincerely,\\}
\newcommand{\yoursfaithfully}[1]{Yours faithfully,\\}
\newcommand{\yourstruly}[1]{Yours truly,\\}
\newcommand{\bestregards}[1]{Best regards,\\}

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

% Today's date
\today
% Recommended people
\begin{center}
\parbox{.32\linewidth}{ \RecommendedPerson{\pFirstRecommended}{\pFirstNameSurname}{\pFirstInstitution}{\pFirstEmail} }
\parbox{.32\linewidth}{ \RecommendedPerson{\pSecondRecommended}{\pSecondNameSurname}{\pSecondInstitution}{\pSecondEmail} }
\parbox{.32\linewidth}{ \RecommendedPerson{\pThirdRecommended}{\pThirdNameSurname}{\pThirdInstitution}{\pThirdEmail} }
\end{center}

To the editor: \pEditor

\vspace*{1\baselineskip}
\pPersonAddressing,

\pIntroduction

\begin{framed}
Abstract: \pabstract
\end{framed}

\pfinal{ \pJournalName.} \newline

\pdeclaration \newline

\pconflictofinterest 

\vfill

\pvalediction\par

% Signature
\pNameSurname, on behalf of all authors
}

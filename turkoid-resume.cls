% ========================================
% turkoid-resume class file
%
% Author:
% John Ross <jlross42@gmail.com>
% http://www.turkoid.com
% ========================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{turkoid-resume}[2018/01/13 turkoid resume class]

% key-value for class options
\RequirePackage{kvoptions}
\SetupKeyvalOptions{%
  family=turkoid,
  prefix=turkoid@,
}

% custom font directory
\DeclareStringOption[/]{fontdir}[/]
\DeclareVoidOption{draft}{\setlength\overfullrule{5pt}}
\DeclareVoidOption{final}{\setlength\overfullrule{0pt}}

% pass unused options to article
\DeclareDefaultOption{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessKeyvalOptions*

% parent class
\LoadClass{article}

% ========================================
% 3rd Party Packages
% ========================================

% margins, layout, etc.
\RequirePackage{geometry}
% manage colors easier
\RequirePackage{xcolor}
% material colors
\RequirePackage{xcolor-material}
% boolean logic
\RequirePackage{etoolbox}
% fonts
\RequirePackage[quiet]{fontspec}
% material icons
\RequirePackage[fontdir=\turkoid@fontdir]{material-icons}
% default font
\RequirePackage[default,opentype]{sourcesanspro}
% better tables
\RequirePackage{tabularx}
% turkoid utility
\RequirePackage{turkoid-util}

% document hyperlinks
\RequirePackage[]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}

% ========================================
% custom macros
% ========================================

% ========================================
% setup
% ========================================
% margin
\geometry{margin=0.5in}
% font setup
% google default font
\newfontfamily\roboto[
  Path=\turkoid@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}
% google default font light
\newfontfamily\robotolight[
  Path=\turkoid@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}
% default fonts for body
\newcommand*{\bodyfontlight}{\sourcesansprolight}

\colorlet{sectioncolor}{MaterialRed}

\newcolumntype{L}[1]{>{\raggedright\arraybackslash}m{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}m{#1}}
\newcolumntype{\LX}{>{\raggedright\arraybackslash}X}
\newcolumntype{\CX}{>{\centering\arraybackslash}X}
\newcolumntype{\RX}{>{\raggedleft\arraybackslash}X}
% ========================================
% styling macros
% ========================================

\ExplSyntaxOn

% key setup for job command
\setupkeys {job}
\addkey {organization} [<Organization>]
\addkey {title} [<Title>]
\addkey {location} [<Location>]
\addkey {startdate}
\addkey {enddate} [Present]
\addkey {summary}
\addkey {detail}

% adds a job entry
%
% \job {key-values}
\NewDocumentCommand {\job} {m} {
  \group_begin:
    \setupkeys [#1] {job}
    \debugmodulekeys [job]
  \group_end:
}

% key setup for education command
\setupkeys {education}
\addkey {name}
\addkey {degree}
\addkey {location}
\addkey {startdate}
\addkey {enddate} [Present]
\addkey {summary}
\addkey {detail}

% adds a education entry
%
% \job {key-values}
\NewDocumentCommand {\education} {m} {
  \group_begin:
    \setupkeys [#1] {education}
    \debugmodulekeys
  \group_end:
}

% key setup for skill command
\setupkeys {skill/tech}
\addkey {category}
\addkey {detail}

% adds a skill entry
%
% \job {key-values}
\NewDocumentCommand {\techskill} {m} {
  \group_begin:
    \setupkeys [#1] {skill/tech}
    \debugmodulekeys
  \group_end:
}

\ExplSyntaxOff

\endinput
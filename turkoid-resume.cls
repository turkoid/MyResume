% ========================================
% turkoid-resume class file
%
% Author:
% John Ross <jlross42@gmail.com>
% http://www.turkoid.com
% ========================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{turkoid-resume}[2018/01/13 turkoid resume class]

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
% key-value
\RequirePackage{pgfkeys}
% key-value for class options
\RequirePackage{kvoptions}
\SetupKeyvalOptions{%
  family=turkoid,
  prefix=turkoid@,
}
% custom font directory
\DeclareStringOption[/]{fontdir}[/]
\ProcessKeyvalOptions*
% boolean logic
\RequirePackage{etoolbox}
% fonts
\RequirePackage[quiet]{fontspec}
% material icons
\RequirePackage[fontdir=\turkoid@fontdir]{material-icons}
% default font
\RequirePackage[default,opentype]{sourcesanspro}
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

% ========================================
% styling macros
% ========================================
\newcommand{\resumesection}[1]{\fontsize{24pt}{1em}\bodyfont\color{sectioncolor}{#1}}

\pgfkeys{/jobs/.cd,
  organization/.store in=\job@organization, organization/.default=, 
  title/.store in=\job@title, title/.default=,
  location/.store in=\job@location, location/.default=,
  startdate/.store in=\job@startdate, startdate/.default=,
  enddate/.store in=\job@enddate, enddate/.default=Present,
  summary/.store in=\job@summary, summary/.default=,
  detail/.store in=\job@detail, detail/.default=,
}
\newcommand{\job}[1]{
  \pgfkeys{/work experience/.cd,
    organization,
    title,
    location,
    startdate,
    enddate,
    summary,
    detail,
    #1
  }
}

\pgfkeys{/education/.cd,
  name/.store in=\edu@name, name/.default=,
  degree/.store in\edu@degree, degree/.default=,
  location/.store in=\edu@location, location/.default=,  
  startdate/.store in=\edu@startdate, startdate/.default=,
  enddate/.store in=\edu@enddate, enddate/.default=Present,
  summary/.store in=\edu@summary, summary/.default=,
  detail/.store in=\edu@detail, detail/.default=,
}
\newcommand{\education}[1]{
  \pgfkeys{/education/.cd,
    name,
    degree,
    location,
    startdate,
    enddate,
    summary,
    detail,
    #1
  }
}

\pgfkeys{/skills/.cd,
  category/.store in=\skill@category, category/.default=,
  skills/.store in=\skill@list, skills/.default=,
}
\newcommand{\skill}[1]{
  \pgfkeys{/skills/.cd,
    category,
    skills,
    #1
  }
}
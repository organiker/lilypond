%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.14.0"

\header {
  lsrtags = "text, vocal-music, contexts-and-engravers, template"

%% Translation of GIT committish: 615cbf212fdaf0b220b3330da417d0c3602494f2
  texidoces = "
Esta plantilla es, básicamente, la misma que la sencilla plantilla
@qq{Conjunto vocal}, excepto que aquí todas las líneas de letra se
colocan utilizando @code{alignAboveContext} y
@code{alignBelowContext}.

"
  doctitlees = "Plantilla para conjunto vocal con letras alineadas encima y debajo de los pentagramas"


%% Translation of GIT committish: fa1aa6efe68346f465cfdb9565ffe35083797b86
  texidocja = "
このテンプレートは基本的に単純な \"合唱\" テンプレートと同じですが、歌詞が
@code{alignAboveContext} と @code{alignBelowContext} を用いて配置されています。
"

%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
  texidocde = "
In diesem Beispiel werden die Texte mit den Befehlen
@code{alignAboveContext} und @code{alignBelowContext}
über und unter dem System angeordnet.
"

  doctitlede = "Vorlage für Vokalensemble mit dem Gesangstext über und unter dem System"


%% Translation of GIT committish: bdfe3dc8175a2d7e9ea0800b5b04cfb68fe58a7a
  texidocfr = "
Ce canevas ressemble beaucoup à celui pour chœur à quatre voix mixtes.
La différence réside dans le fait que les paroles sont positionnées en
ayant recours à @code{alignAboveContext} et @code{alignBelowContext}.

"
  doctitlefr = "Ensemble vocal avec alignement des paroles selon le contexte"

  texidoc = "
This template is basically the same as the simple @qq{Vocal ensemble}
template, with the exception that here all the lyrics lines are placed
using @code{alignAboveContext} and @code{alignBelowContext}.

"
  doctitle = "Vocal ensemble template with lyrics aligned below and above the staves"
} % begin verbatim

global = {
  \key c \major
  \time 4/4
}

sopMusic = \relative c'' {
  c4 c c8[( b)] c4
}
sopWords = \lyricmode {
  hi hi hi hi
}

altoMusic = \relative c' {
  e4 f d e
}
altoWords = \lyricmode {
  ha ha ha ha
}

tenorMusic = \relative c' {
  g4 a f g
}
tenorWords = \lyricmode {
  hu hu hu hu
}

bassMusic = \relative c {
  c4 c g c
}
bassWords = \lyricmode {
  ho ho ho ho
}

\score {
  \new ChoirStaff <<
    \new Staff = "women" <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"women" } \lyricsto "sopranos" \sopWords
    \new Lyrics \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWords
    % we could remove the line about this with the line below, since we want
    % the alto lyrics to be below the alto Voice anyway.
    % \new Lyrics \lyricsto "altos" \altoWords

    \new Staff = "men" <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"men" } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men" } \lyricsto "basses" \bassWords
    % again, we could replace the line above this with the line below.
    % \new Lyrics \lyricsto "basses" \bassWords
  >>
}


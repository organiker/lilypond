%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.14.0"

\header {
  lsrtags = "expressive-marks, text"

%% Translation of GIT committish: 2d548a99cb9dba80f2ff035582009477cd37eceb
  texidoces = "
Ciertas indicaciones dinámicas pueden llevar textos (como @qq{più
forte} o @qq{piano subito}). Se pueden producir usando un bloque
@code{\\markup}.

"
  doctitlees = "Combinar indicaciones dinámicas con marcados textuales"

  texidoc = "
Some dynamics may involve text indications (such as @qq{più forte} or
@qq{piano subito}). These can be produced using a @code{\\markup}
block.

"
  doctitle = "Combining dynamics with markup texts"
} % begin verbatim

piuF = \markup { \italic più \dynamic f }
\layout { ragged-right = ##f }
\relative c'' {
  c2\f c-\piuF
}



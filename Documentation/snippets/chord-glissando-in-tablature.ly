% DO NOT EDIT this file manually; it is automatically
% generated from Documentation/snippets/new
% Make any changes in Documentation/snippets/new/
% and then run scripts/auxiliar/makelsr.py
%
% This file is in the public domain.
%% Note: this file works from version 2.14.0
\version "2.14.0"

\header {
%% Translation of GIT committish: 615cbf212fdaf0b220b3330da417d0c3602494f2

  texidoces = "
Los deslizamientos para acordes se pueden indicar tanto en el contexto
Staff como en TabStaff.  Los números de cuerda son necesarios para
TabStaff porque los cálculos de cuerda automáticos son diferentes para
los acordes y para notas sueltas.

"

  doctitlees = "Glissando de acordes en tablatura"
%% Translation of GIT committish: f86f00c1a8de0f034ba48506de2801c074bd5422
  texidocde = "
Gleiten von Akkorden kann sowohl im normalen Notensystem als auch in einer
Tabulatur notiert werden.  Saitennummern werden für Tabulaturen
benötigt, weil die automatische Saitenberechnung unterschiedlich für
Akkorde und einzelne Noten funktioniert.
"
  doctitlede = "Akkordglissando in Tabulaturen"


  lsrtags = "fretted-strings"
  texidoc = "
Slides for chords can be indicated in both Staff and TabStaff.
String numbers are necessary for TabStaff because automatic
string calculations are different for chords and for single notes.
"
  doctitle = "Chord glissando in tablature"
} % begin verbatim


myMusic = \relative c' {
  <c\3 e\2 g\1>1 \glissando <f\3 a\2 c\1>
}

\score {
  <<
    \new Staff {
      \clef "treble_8"
      \myMusic
    }
    \new TabStaff {
      \myMusic
    }
  >>
}

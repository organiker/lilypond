%% Do not edit this file; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.13.10"

\header {
  lsrtags = "text, keyboards, template"

%% Translation of GIT committish: 45fc8488655f9ea122d1ec6e3328892618bd6971
  texidoces = "
En lugar de tener un pentagrama dedicado a la melodía y la letra, ésta
se puede centrar entre los pentagramas de un sistema de piano.

"
  doctitlees = "Plantilla de piano con letra centrada"

%% Translation of GIT committish: 06d99c3c9ad1c3472277b4eafd7761c4aadb84ae
  texidocja = "
旋律と歌詞のための譜表を持つ代わりに、歌詞をピアノ譜の 2 つの譜の間に置くことができます。
"
%% Translation of GIT committish: d96023d8792c8af202c7cb8508010c0d3648899d
  texidocde = "
Anstatt ein eigenes System für Melodie und Text zu schreiben, können
Sie den Text auch zwischen die beiden Klaviersysteme schreiben
(und damit das zusätzliche System für die Gesangstimme auslassen).
"

%% Translation of GIT committish: 892286cbfdbe89420b8181975032ea975e79d2f5
  texidocfr = "
Lorsque la mélodie est doublée au piano, cela ne nécessite pas forcément
une portée spécifique.  Les paroles peuvent s'insérer entre les deux
portées de la partition pour piano.

"
  doctitlefr = "Piano et paroles entre les portées"

  texidoc = "
Instead of having a full staff for the melody and lyrics, lyrics can be
centered between the staves of a piano staff.

"
  doctitle = "Piano template with centered lyrics"
} % begin verbatim

upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4

  a4 b c d
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4

  a2 c
}

text = \lyricmode {
  Aaa Bee Cee Dee
}

\score {
  \new GrandStaff <<
    \new Staff = upper { \new Voice = "singer" \upper }
    \new Lyrics \lyricsto "singer" \text
    \new Staff = lower { \lower }
  >>
  \layout {
    \context {
      \GrandStaff
      \accepts "Lyrics"
    }
    \context {
      \Lyrics
      \consists "Bar_engraver"
    }
  }
  \midi { }
}


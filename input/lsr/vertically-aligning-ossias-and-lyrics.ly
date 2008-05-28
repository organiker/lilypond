%% Do not edit this file; it is auto-generated from LSR http://lsr.dsi.unimi.it
%% This file is in the public domain.
\version "2.11.46"

\header {
  lsrtags = "vocal-music, tweaks-and-overrides, spacing"

  texidoc = "
This snippet demonstrates the use of the @code{alignBelowContext} and
@code{alignAboveContext} properties to control the positioning of
lyrics and ossias.

"
  doctitle = "Vertically aligning ossias and lyrics"
} % begin verbatim
\paper {
  ragged-right = ##t
}

\relative <<
  \new Staff = "1" { c4 c s2 }
  \new Staff = "2" { c4 c s2 }
  \new Staff = "3" { c4 c s2 }
  { \skip 2
    <<
      \lyrics {
	\set alignBelowContext = #"1"
	below8 first staff
      }
      \new Staff {
	\set Staff.alignAboveContext = #"3"
	\times 4/6 {
	  \override TextScript #'padding = #3
	  c8^"this" d_"staff" e^"above" d_"last" e^"staff" f
	}
      }
    >> }
>>

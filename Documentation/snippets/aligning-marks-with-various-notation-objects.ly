%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.14.0"

\header {
  lsrtags = "text"

%% Translation of GIT committish: 2d548a99cb9dba80f2ff035582009477cd37eceb
  texidoces = "
Si están especificadas, las marcas de texto se pueden alinear con
objetos de notación distintos a las líneas divisorias.  Entre estos
objetos se encuentran @code{ambitus}, @code{breathing-sign},
@code{clef}, @code{custos}, @code{staff-bar}, @code{left-edge},
@code{key-cancellation}, @code{key-signature} y @code{time-signature}.

En estos casos, las marcas de texto se centran horizontalmente sobre
el objeto, aunque esto se puede cambiar, como se muestra en la segunda
línea de este ejemplo (en una partitura con varios pentagramas, se
debe hacer este ajuste para todos los pentagramas).

"
  doctitlees = "Alinear marcas con varios objetos de notación"


%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
  texidocde = "
Wenn angegeben, können Textzeichen auch an anderen Objekten als Taktstrichen
ausgerichtet werden.  Zu diesen Objekten gehören @code{ambitus},
@code{breathing-sign}, @code{clef}, @code{custos}, @code{staff-bar},
@code{left-edge}, @code{key-cancellation}, @code{key-signature} und
@code{time-signature}.

In diesem Fall werden die Zeichen horizontal über dem Objekt zentriert.
Diese Ausrichtung kann auch geändert werden, wie die zweite Zeile
des Beispiels zeigt.  In einer Partitur mit vielen Systemen sollte
diese Einstellung für alle Systeme gemacht werden.

"

  doctitlede = "Zeichen an verschiedenen Notationsobjekten ausrichten"

%% Translation of GIT committish: 548ef200973bd3d46ea75c5498461d9e5f168334
  texidocfr = "
Les indications textuelles peuvent s'aligner par rapport à d'autres
objets que des barres de mesure, tels que @code{ambitus},
@code{breathing-sign}, @code{clef}, @code{custos}, @code{staff-bar},
@code{left-edge}, @code{key-cancellation}, @code{key-signature}, ou
@code{time-signature}.



Par défaut, les indications textuelles sont alignées avec le milieu
des objets de notation. Bien entendu, vous pouvez modifier les
propriétés des objets en question pour obtenir un autre
résultat comme l'illustre la deuxième ligne de l'exemple.  Dans le cas
de portées multiples, ces réglages doivent être faits pour chacune
d'entre elles.



"
  doctitlefr = "Alignement des indications par rapport à divers objets
de notation"


  texidoc = "
If specified, text marks may be aligned with notation objects other
than bar lines.  These objects include @code{ambitus},
@code{breathing-sign}, @code{clef}, @code{custos}, @code{staff-bar},
@code{left-edge}, @code{key-cancellation}, @code{key-signature}, and
@code{time-signature}.



In such cases, text marks will be horizontally centered above the
object. However this can be changed, as demonstrated on the second line
of this example (in a score with multiple staves, this setting should
be done for all the staves).



"
  doctitle = "Aligning marks with various notation objects"
} % begin verbatim

\relative c' {
  e1

  % the RehearsalMark will be centered above the Clef
  \override Score.RehearsalMark #'break-align-symbols = #'(clef)
  \key a \major
  \clef treble
  \mark "↓"
  e1

  % the RehearsalMark will be centered above the TimeSignature
  \override Score.RehearsalMark #'break-align-symbols = #'(time-signature)
  \key a \major
  \clef treble
  \time 3/4
  \mark \markup { \char ##x2193 }
  e2.

  % the RehearsalMark will be centered above the KeySignature
  \override Score.RehearsalMark #'break-align-symbols = #'(key-signature)
  \key a \major
  \clef treble
  \time 4/4
  \mark \markup { \char ##x2193 }
  e1

  \break
  e1

  % the RehearsalMark will be aligned with the left edge of the KeySignature
  \once \override Score.KeySignature #'break-align-anchor-alignment = #LEFT
  \mark \markup { \char ##x2193 }
  \key a \major
  e1

  % the RehearsalMark will be aligned with the right edge of the KeySignature
  \once \override Score.KeySignature #'break-align-anchor-alignment = #RIGHT
  \key a \major
  \mark \markup { \char ##x2193 }
  e1

  % the RehearsalMark will be aligned with the left edge of the KeySignature
  % and then shifted right by one unit.
  \once \override Score.KeySignature #'break-align-anchor = #1
  \key a \major
  \mark \markup { \char ##x2193 }
  e1
}

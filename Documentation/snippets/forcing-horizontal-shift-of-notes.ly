%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.14.0"

\header {
  lsrtags = "simultaneous-notes, tweaks-and-overrides"

%% Translation of GIT committish: 2d548a99cb9dba80f2ff035582009477cd37eceb

 doctitlees = "Forzar el desplazamiento horizontal de las notas"

texidoces = "
 Cuando el motor de tipografiado no es capaz de todo, se puede usar la
 sintaxis siguiente para sobreescribir las decisiones de tipografía.
 Las unidades de medida que se usan aquí son espacios de pentagrama.

"


%% Translation of GIT committish: 0a868be38a775ecb1ef935b079000cebbc64de40
  texidocde = "
Wenn es zu Zusammenstößen kommt, kann mit folgender Lösung eine andere
Position manuell eingestellt werden.  Die Einheiten hier sind
Notenlinienzwischenräume.

"
  doctitlede = "Horizontale Verschiebung von Noten erzwingen"

%% Translation of GIT committish: 1baa2adf57c84e8d50e6907416eadb93e2e2eb5c
  texidocfr = "
Quand LilyPond est dépassé, la propriété @code{force-hshift} de l'objet
@code{NoteColumn}, et des silences à hauteur déterminée, peuvent
s'avérer utiles pour dicter au programme les choix de placement.  On
travaille ici en espace de portée.

"
  doctitlefr = "Décalage horizontal forcé"


  texidoc = "
When the typesetting engine cannot cope, the following syntax can be
used to override typesetting decisions. The units of measure used here
are staff spaces.

"
  doctitle = "Forcing horizontal shift of notes"
} % begin verbatim

\relative c' <<
  {
    <d g>2 <d g>
  }
  \\
  {
    <b f'>2
    \once \override NoteColumn #'force-hshift = #1.7
    <b f'>2
  }
>>


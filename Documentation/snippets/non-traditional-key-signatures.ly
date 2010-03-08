% Do not edit this file; it is automatically
% generated from Documentation/snippets/new
% This file is in the public domain.
%% Note: this file works from version 2.13.0
\version "2.13.10"

\header {
%% Translation of GIT committish: 45fc8488655f9ea122d1ec6e3328892618bd6971
  doctitlees = "Armaduras de tonalidad no tradicionales"
  texidoces = "

La muy utilizada instrucción @code{\\key} establece la propiedad
@code{keySignature} property, dentro del contexto @code{Staff}.

Para crear armaduras de tonalidad no estándar, ajuste esta
propiedad directamente.  El formato de esta instrucción es una
lista:

@code{\\set Staff.keySignature = #`(((octava . paso) . alteración)
((octava . paso) . alteración) ...)} donde, para cada elemento
dentro de la lista, @code{octava} especifica la octava
(siendo@tie{}cero la octava desde el Do@tie{}central hasta el Si
por encima), @code{paso} especifica la nota dentro de la octava
(cero@tie{}significa@tie{}Do y 6@tie{}significa@tie{}Si), y
@code{alteración} es @code{,SHARP ,FLAT ,DOUBLE-SHARP}
etc. (observe la coma precedente.)

De forma alternativa, para cada elemento de la lista el uso del
formato más conciso @code{(paso . alteración)} especifica que la
misma alteración debe estar en todas las octavas.

He aquí un ejemplo de una posible armadura para generar una escala
exátona:
"


%% Translation of GIT committish: d96023d8792c8af202c7cb8508010c0d3648899d
  doctitlede = "Untypische Tonarten"
  texidocde = "
Der üblicherweise benutzte @code{\\key}-Befehl setzt die
@code{keySignature}-Eigenschaft im @code{Staff}-Kontext.

Um untypische Tonartenvorzeichen zu erstellen, muss man diese Eigenschaft
direkt setzen.  Das Format für den Befehl ist eine Liste: @code{ \\set
Staff.keySignature = #`(((Oktave . Schritt) . Alteration) ((Oktave
. Schritt) . Alteration) ...)} wobei für jedes Element in der Liste
@code{Oktave} die Oktave angibt (0@tie{}ist die Oktave vom
eingestrichenen@tie{}C bis zum eingestrichenen@tie{}H), @code{Schritt} gibt
die Note innerhalb der Oktave an (0@tie{}heißt@tie{}C und
6@tie{}heißt@tie{}H), und @code{Alteration} ist @code{,SHARP ,FLAT
,DOUBLE-SHARP} usw.  (Beachte das beginnende Komma.)

Alternativ kann auch jedes Element der Liste mit dem allgemeineren Format
@code{(Schritt . Alteration)} gesetzt werden, wobei dann die Einstellungen
für alle Oktaven gelten.

Hier ein Beispiel einer möglichen Tonart für eine Ganztonleiter:
"

%% Translation of GIT committish: 59968a089729d7400f8ece38d5bc98dbb3656a2b
  texidocfr = "
La commande @code{\\key} détermine la propriété @code{keySignature} d'un 
contexte @code{Staff}.

Des armures inhabituelles peuvent être spécifiées en modifiant
directement cette propriété. Il s'agit en l'occurence de définir une
liste :

@code{\\set Staff.keySignature = #`(((octave . pas) . altération) ((octave
. pas) . altération) @dots{})} 

dans laquelle, et pour chaque élément, 
@code{octave} spécifie l'octave (0@tie{}pour celle allant du
do@tie{}médium au si supérieur), @code{pas} la note dans cette octave
(0@tie{}pour@tie{}do et 6@tie{}pour@tie{}si), et @code{altération} sera
@code{,SHARP ,FLAT ,DOUBLE-SHARP} etc.  (attention à la virgule en
préfixe). 

Une formulation abrégée -- @code{(pas . altération)} -- signifie que
l'altération de l'élément en question sera valide quel que soit l'octave.


Voici, par exemple, comment générer une gamme par ton :

"
  doctitlefr = "Armures inhabituelles"


  lsrtags = "pitches, staff-notation"
  texidoc = "
The commonly used @code{\\key} command sets the @code{keySignature}
property, in the @code{Staff} context.

To create non-standard key signatures, set this property directly.  The
format of this command is a list:

@code{\\set Staff.keySignature = #`(((octave . step) . alter) ((octave
. step) . alter) ...)} where, for each element in the list,
@code{octave} specifies the octave (0@tie{}being the octave from
middle@tie{}C to the B above), @code{step} specifies the note within the
octave (0@tie{}means@tie{}C and 6@tie{}means@tie{}B), and @code{alter} is
@code{,SHARP ,FLAT ,DOUBLE-SHARP} etc.  (Note the leading comma.)

Alternatively, for each item in the list, using the more concise format
@code{(step . alter)} specifies that the same alteration should hold in all
octaves.

Here is an example of a possible key signature for generating a whole-tone
scale:
"
  doctitle = "Non-traditional key signatures"
} % begin verbatim


\relative c' {
  \set Staff.keySignature = #`(((0 . 6) . ,FLAT)
                               ((0 . 5) . ,FLAT)
                               ((0 . 3) . ,SHARP))
  c4 d e fis
  aes4 bes c2
}


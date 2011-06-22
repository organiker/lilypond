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
Este código muestra cómo cambiar la cantidad de puntillos de una nota.

"

  doctitlees = "Modificar el número de puntillos de una nota"


%% Translation of GIT committish: 190a067275167c6dc9dd0afef683d14d392b7033

  texidocfr = "Voici comment modifier le nombre de points d'augmentation
affectés à une note en particulier.

"
  doctitlefr = "Spécification du nombre de points d'augmentation d'une note"


  lsrtags = "rhythms,expressive-marks"
  texidoc = "This code demonstrates how to change the number of
augmentation dots on a single note."
  doctitle = "Changing the number of augmentation dots per note"
} % begin verbatim


\relative c' {
  c4.. a16 r2 |
  \override Dots #'dot-count = #4
  c4.. a16 r2 |
  \override Dots #'dot-count = #0
  c4.. a16 r2 |
  \revert Dots #'dot-count
  c4.. a16 r2 |
}

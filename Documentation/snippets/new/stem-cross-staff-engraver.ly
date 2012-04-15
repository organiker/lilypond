\version "2.15.35"

\header {
  lsrtags = "staff-notation, tweaks-and-overrides, contexts-and-engravers"
  texidoc = "This file defines and demonstrates a scheme engraver that
connects stems across staves.  The stem length need not be specified, as
the code takes care of the variable distance between noteheads and staves."
  doctitle = "Stem cross staff engraver"
}

%{
  A new stem (referred to as span in the code) is created to connect the
  original stems.  The original stems are made transparent.

  The span is created as a child of the "root" stem, that is the stem
  connected to a notehead with the end that is not to be extended.

  Both stem directions are supported.  Connecting more than two stems is
  possible.
%}

% Values are close enough to ignore the difference
#(define (close-enough? x y)
   (< (abs (- x y)) 0.0001))

% Combine a list of extents
#(define (extent-combine extents)
   (if (pair? (cdr extents))
       (interval-union (car extents) (extent-combine (cdr extents)))
       (car extents)))

% Check if the stem is connectable to the root
#(define ((stem-connectable? ref root) stem)
   ; The root is always connectable to itself
   (or (eq? root stem)
       (and
        ; Horizontal positions of the stems must be almost the same
        (close-enough? (car (ly:grob-extent root ref X))
          (car (ly:grob-extent stem ref X)))
        ; The stem must be in the direction away from the root's notehead
        (positive? (* (ly:grob-property root 'direction)
                     (- (car (ly:grob-extent stem ref Y))
                       (car (ly:grob-extent root ref Y))))))))

% Connect stems if we have at least one stems connectable to the root
#(define (stem-span-stencil span)
   (let* ((system (ly:grob-system span))
          (root (ly:grob-parent span X))
          (stems (filter (stem-connectable? system root)
                         (ly:grob-object span 'stems))))
     (if (<= 2 (length stems))
         (let* ((yextents (map (lambda (st)
                                 (ly:grob-extent st system Y)) stems))
                (yextent (extent-combine yextents))
                (layout (ly:grob-layout root))
                (blot (ly:output-def-lookup layout 'blot-diameter)))
           ; Hide spanned stems
           (map (lambda (st)
                  (set! (ly:grob-property st 'transparent) #t))
             stems)
           ; Draw a nice looking stem with rounded corners
           (ly:round-filled-box (ly:grob-extent root root X) yextent blot))
         ; Nothing to connect, don't draw the span
         #f)))

% Create a stem span as a child of the cross-staff stem (the root)
#(define ((make-stem-span! stems trans) root)
   (let ((span (ly:engraver-make-grob trans 'Stem '())))
     (ly:grob-set-parent! span X root)
     (set! (ly:grob-object span 'stems) stems)
     ; Suppress positioning, the stem code is confused by this weird stem
     (set! (ly:grob-property span 'X-offset) 0)
     (set! (ly:grob-property span 'stencil) stem-span-stencil)))

% Set cross-staff property of the stem to this function to connect it to
% other stems automatically
#(define (cross-staff-connect stem)
   #t)

% Check if automatic connecting of the stem was requested.  Stems connected
% to cross-staff beams are cross-staff, but they should not be connected to
% other stems just because of that.
#(define (stem-is-root? stem)
   (eq? cross-staff-connect (ly:grob-property-data stem 'cross-staff)))

% Create stem spans for cross-staff stems
#(define (make-stem-spans! ctx stems trans)
   ; Cannot do extensive checks here, just make sure there are at least
   ; two stems at this musical moment
   (if (<= 2 (length stems))
       (let ((roots (filter stem-is-root? stems)))
         (map (make-stem-span! stems trans) roots))))

% Connect cross-staff stems to the stems above in the system
#(define (Span_stem_engraver ctx)
   (let ((stems '()))
     (make-engraver
      ; Record all stems for the given moment
      (acknowledgers
       ((stem-interface trans grob source)
        (set! stems (cons grob stems))))
      ; Process stems and reset the stem list to empty
      ((process-acknowledged trans)
       (make-stem-spans! ctx stems trans)
       (set! stems '())))))

crossStaff =
#(define-music-function (parser location notes) (ly:music?) #{
  \override Stem #'cross-staff = #cross-staff-connect
  $notes
  \revert Stem #'cross-staff
#})

\layout {
  \context {
    \StaffGroup
    \consists #Span_stem_engraver
  }
}

\parallelMusic #'(voiceA voiceB voiceC) {
  % Bar 1 - durations, beams, flags
  g'2 g'4 g'8 [ g'16 ] g'16 |
  \crossStaff { c'2 c'4 c'8 [ c'16 ] c'16 } |
  R1 |

  % Bar 2 - direction
  g'8 \stemDown g'8 \crossStaff g'8 \stemNeutral g'8 g'4 r4 |
  \crossStaff { c'8 \stemDown c'8 } c'8 \stemNeutral c'8 r4 r4 |
  c8 \stemDown c8 c8 \stemNeutral \crossStaff { c8 c4 c4 } |

  % Bar 3 - multiple voice styles
  << c''2 \\ \crossStaff d'2 \\ a'2 \\ \crossStaff f'2 >> g'2 |
  << b'2 \\ c'2 \\ g'2 \\ e'2 >> << e'2 \\ \\ \crossStaff c'2 >> |
  << \crossStaff b2 \\ c2 \\ \crossStaff g2 \\ e2 >> r2 |

  % Bar 4 - grace notes
  \grace g'8 a'2 \stemDown \crossStaff { \grace g'8 a'2 } \stemNeutral |
  \grace c'8 d'2 \stemDown \grace c'8 d'2 \stemNeutral |
  \crossStaff { \grace c8 d2 } \stemDown \grace c8 d2 \stemNeutral |

  % Bar 5 - cross-staff beams
  g'8 g'8 g'8 g'8 r2 |
  s1 |
  \crossStaff { c8 [ \change Staff=stafftwo c''8 ] }
    \change Staff=staffthree c8 [ \change Staff=stafftwo c''8 ] r2 |
}

\score {
  \new StaffGroup <<
    \new Staff = "staffone" <<
      \new Voice {
        \autoBeamOff \voiceA
      }
    >>
    \new Staff = "stafftwo" <<
      \new Voice {
        \autoBeamOff \voiceB
      }
    >>
    \new Staff = "staffthree" <<
      \new Voice {
        \autoBeamOff \clef bass \voiceC
      }
    >>
  >>
  \layout { }
}

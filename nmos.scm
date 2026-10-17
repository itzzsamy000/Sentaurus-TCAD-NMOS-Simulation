
;; Defined Parameters:

;; Contact Sets:
(sdegeo:define-contact-set "GATE" 4 (color:rgb 1 1 1 )"##" )
(sdegeo:define-contact-set "DRAIN" 4 (color:rgb 1 1 0 )"##" )
(sdegeo:define-contact-set "BULK" 4 (color:rgb 1 0 1 )"##" )
(sdegeo:define-contact-set "SOURCE" 4 (color:rgb 1 0 0 )"##" )

;; Work Planes:
(sde:workplanes-init-scm-binding)

;; Defined ACIS Refinements:
(sde:refinement-init-scm-binding)

;; Reference/Evaluation Windows:
(sdedr:define-refeval-window "DL" "Line" (position 0.14 0 0) (position 0.5 0 0))
(sdedr:define-refeval-window "SL" "Line" (position -0.14 0 0) (position -0.5 0 0))
(sdedr:define-refeval-window "Channel" "Rectangle" (position -0.14 -0.002 0) (position 0.14 0.15 0))
(sdedr:define-refeval-window "All" "Rectangle" (position -0.5433 -0.1176 0) (position 0.5451 0.5317 0))

;; Restore GUI session parameters:
(sde:set-window-position 0 23)
(sde:set-window-size 1536 889)
(sde:set-window-style "Windows")
(sde:set-background-color 0 127 178 204 204 204)
(sde:scmwin-set-prefs "Liberation Sans" "Normal" 8 124 )

#lang racket
(require malt)

; w and b are _parameters_ of line
; x is the _argument_ of line
(define line-old
  (λ (x)
    (λ (w b)
      (+ (* w x) b))))

(printf "line x=8 w=4 b=6: ~a~n" ((line-old 8) 4 6))


; line-xs and line-ys form a _data set_.
(define line-xs
  (tensor 2.0 1.0 4.0 3.0))

(define line-ys
  (tensor 1.8 1.2 4.2 3.3))

(define line
  (λ (x)
    (λ (theta)
      (+ (* (list-ref theta 0) x) (list-ref theta 1)))))

(printf "~a~n" ((line 7.3) (list 1.0 0.0)))
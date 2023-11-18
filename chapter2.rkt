#lang racket
(require malt)

(define rank
  (λ (t)
    (cond
      ((scalar? t) 0)
      (else (add1 (rank (tref t 0)))))))

(printf "~a~n" (rank 5))
(printf "~a~n" (rank (tensor 5 4)))
(printf "~a~n" (rank (tensor (tensor 1) (tensor 2))))

(define shape
  (λ (t)
    (cond
      ((scalar? t) (list))
      (else (cons (tlen t) (shape (tref t 0)))))))
    
(printf "~a~n" (shape 5))
(printf "~a~n" (shape (tensor 5)))
(printf "~a~n" (shape (tensor (tensor 5.2 6.3 8.0) (tensor 6.9 7.1 0.5))))
(printf "~a~n" (shape (tensor
  (tensor (tensor 5) (tensor 6) (tensor 8))
  (tensor (tensor 7) (tensor 9) (tensor 5)))))
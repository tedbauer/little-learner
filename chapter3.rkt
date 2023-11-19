#lang racket
(require malt)

(define l2-loss
  (λ (target)
    (λ (xs ys)
      (λ (theta)
        (let ((pred-ys ((target xs) theta)))
          (sum
            (sqr
              (- ys pred-ys))))))))

(define line-xs (tensor 2.0 1.0 4.0 3.0))
(define line-ys (tensor 1.8 1.2 4.2 3.3))

; An _expectant function_, awaiting a dataset
(l2-loss line)

; An _objective function_, awaiting a theta
((l2-loss line) line-xs line-ys)

(printf "Loss with theta_0=0.0, theta_1=0.0: ~a~n"
  (((l2-loss line) line-xs line-ys) (list 0.0 0.0)))

(printf "Loss with theta_0=0.0099, theta_1=0.0: ~a~n"
  (((l2-loss line) line-xs line-ys) (list 0.0099 0.0)))
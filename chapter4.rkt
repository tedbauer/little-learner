#lang racket
(require malt)

(define revise
  (λ (f revs theta)
    (cond
      ((zero? revs) theta)
      (else
        (revise f (sub1 revs) (f theta))))))

(define rev-f-1
  (λ (theta)
    (map (λ (p)
           (- p 3))
      theta)))

(revise rev-f-1 5 (list 1 2 3))

(define line-xs (tensor 2.0 1.0 4.0 3.0))
(define line-ys (tensor 1.8 1.2 4.2 3.3))

(define learning-rate 0.01)
(define revs 1000)
(define obj ((l2-loss line) line-xs line-ys))

; _Optimization by gradient descent_.
(let ((f (λ (theta)
            (let ((gs (gradient-of obj theta)))
            (list
                (- (list-ref theta 0) (* learning-rate (list-ref gs 0)))
                (- (list-ref theta 1) (* learning-rate (list-ref gs 1))))))))
  (revise f 1000 (list 0.0 0.0)))

(define gradient-descent
  (λ (obj theta)
    (let ((f (λ (big-theta)
              (map (λ (p g)
                     (- p (* learning-rate g)))
                big-theta
                (gradient-of obj big-theta)))))
      (revise f revs theta))))

(gradient-descent obj (list 0.0 0.0))
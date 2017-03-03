;; This is basically a proof of the money multiplier (increase in money supply, or money created out of thin air) being 1/(reserve requirement) or (reserve requirement)^-1. Banking prints money. This is why banks are important.

(defun fractional-reserve-banking (initial-deposit reserve-requirement &optional (minimum-deposit 1))
  "See how much INITIAL-DEPOSIT can become under fractional reserve banking"
  (let ((multiplier (- 1 reserve-requirement)))
    (loop for p = initial-deposit then (* p multiplier)
       until (< p minimum-deposit) summing p)))

(defun verify ()
  "Ratio of final money supply to initial--shows that it's 1/reserve-requirement"
  (let* ((rand (float (/ (random 100) 100)))
         (initial-deposit (+ 1 (* rand 1000))))
    (format t "~&reserve-requirement: ~a~&initial-deposit: ~a~%(/ 1 reserve-requirement): ~a~%"
            rand
            initial-deposit
            (/ 1 rand))
    (/ (fractional-reserve-banking initial-deposit rand)
       initial-deposit)))

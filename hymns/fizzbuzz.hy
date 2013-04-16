#! /usr/bin/env hy

(import [functools [partial]])

(def *factors* {3 "fizz" 5 "buzz" 7 "beep"})

(defn match [n factors]
  (filter (lambda [x] (not (% n x))) factors))

(defn fizzbuzz [targets n]
  (let [[factors (-> targets .keys sorted)]
        [matches (match n factors)]]
    (if (not matches)
      (str n)
      (.join "" (map (lambda [x] (get targets x)) matches)))))

(print (.join ", " (map (partial fizzbuzz *factors*) (range 1 106))))

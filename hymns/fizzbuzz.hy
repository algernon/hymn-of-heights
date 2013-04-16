#! /usr/bin/env hy

(import [functools [partial]])

(defn multiple-of? [n x]
  (not (% n x)))

(defn contains-number? [n x]
  (-> (str x) (in (str n))))

(defn fizzbuzz-constraints [constraints n x]
  (any (map (lambda [f] (f n x)) constraints)))

(defn match [n constraints factors]
  (filter (partial fizzbuzz-constraints constraints n) factors))

(defn fizzbuzz [constraints targets n]
  (let [[factors (-> targets .keys sorted)]
        [matches (match n constraints factors)]]
    (if (not matches)
      (str n)
      (.join "" (map (lambda [x] (get targets x)) matches)))))

(if (= __name__ "__main__")
  (do
    (def *factors* {3 "fizz" 5 "buzz" 7 "beep"})
    (def *constraints* [multiple-of? contains-number?])

    (print (.join ", " (map (partial fizzbuzz *constraints* *factors*) (range 1 106))))))

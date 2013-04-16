(import [hymns.fizzbuzz [*]])

(defn test-fizzbuzz-simple []
  "Tests fizzbuzz for the default case (3 and 5 as factors)."

  (let [[constraints [multiple-of?]]
        [targets {3 "fizz" 5 "buzz"}]]

    (assert (= (fizzbuzz constraints targets 1) "1"))
    (assert (= (fizzbuzz constraints targets 2) "2"))
    (assert (= (fizzbuzz constraints targets 3) "fizz"))
    (assert (= (fizzbuzz constraints targets 4) "4"))
    (assert (= (fizzbuzz constraints targets 5) "buzz"))
    (assert (= (fizzbuzz constraints targets 15) "fizzbuzz"))))

(defn test-fizzbuzz-combined []
  "Tests fizzbuzz for the case where 3 & 5 can also appear in the
   digits."

  (let [[constraints [multiple-of? contains-number?]]
        [targets {3 "fizz" 5 "buzz"}]]

    (assert (= (fizzbuzz constraints targets 13) "fizz"))
    (assert (= (fizzbuzz constraints targets 153) "fizzbuzz"))))

(defn test-fizzbuzzbeep-simple []
  "Tests fizzbuzzbeep (3, 5 and 7 as factors)"

  (let [[constraints [multiple-of?]]
        [targets {3 "fizz" 5 "buzz" 7 "beep"}]]
    (assert (= (fizzbuzz constraints targets 7) "beep"))
    (assert (= (fizzbuzz constraints targets 21) "fizzbeep"))
    (assert (= (fizzbuzz constraints targets 35) "buzzbeep"))
    (assert (= (fizzbuzz constraints targets 105) "fizzbuzzbeep"))))

(defn test-fizzbuzzbeep-combined []
  "Tests fizzbuzzbeep for the case where 3, 5 & 7 can also appear in
    the digits."

  (let [[constraints [multiple-of? contains-number?]]
        [targets {3 "fizz" 5 "buzz" 7 "beep"}]]
    (assert (= (fizzbuzz constraints targets 17) "beep"))
    (assert (= (fizzbuzz constraints targets 137) "fizzbeep"))
    (assert (= (fizzbuzz constraints targets 157) "buzzbeep"))
    (assert (= (fizzbuzz constraints targets 357) "fizzbuzzbeep"))))

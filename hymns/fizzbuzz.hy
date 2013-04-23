#! /usr/bin/env hy
;; fizzbuzz.hy -- A trivial, yet extensible fizzbuzz implementation
;; Copyright (C) 2013  Gergely Nagy <algernon@madhouse-project.org>
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(import [functools [partial]])

(defn multiple-of? [n x]
  (not (% n x)))

(defn contains-number? [n x]
  (-> (str x) (in (str n))))

(defn fizzbuzz-constraints [constraints n x]
  (any (map (lambda [f] (f n x)) constraints)))

(defn match [n constraints factors]
  (->> factors
       (filter (partial fizzbuzz-constraints constraints n))
       (list)))

(defn fizzbuzz [constraints targets n]
  (let [[factors (-> targets .keys sorted)]
        [matches (match n constraints factors)]]
    (if (not matches)
      (str n)
      (->> matches
           (map (lambda [x] (get targets x)))
           (.join "")))))

(if (= __name__ "__main__")
  (do
    (def *factors* {3 "fizz" 5 "buzz" 7 "beep"})
    (def *constraints* [multiple-of? contains-number?])

    (print (.join ", " (map (partial fizzbuzz *constraints* *factors*) (range 1 106))))))

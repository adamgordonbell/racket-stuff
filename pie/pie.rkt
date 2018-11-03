#lang pie
(claim one Nat)
(define one
  (add1 zero))

(claim adam (Vec Atom 1))
(define adam
  (vec:: 'adam vecnil))

(claim first
  (Pi ((E U)
       (l Nat))
       (-> (Vec E (add1 l))
           E)))
  
(define first
  (λ (E l es)
      (head es)))

(claim rest
  (Pi ((E U)
       (l Nat))
       (-> (Vec E (add1 l))
           (Vec E l))))
(define rest
  (λ (E l)
    (λ (es)
      (tail es))))

(claim normal-atom Atom)
(define normal-atom 'ukulele)
(claim abnormal-atom Atom)
(define abnormal-atom (quote ukulele))
(check-same Atom normal-atom abnormal-atom)

;; (define peas
;;  (λ (how-many-peas)
;;    (rec-Nat how-many-peas
;;      vecnil

(first Atom 0 adam)

(rest Atom 0 adam)

(claim gauss
  (-> Nat Nat))

(claim + (-> Nat Nat
           Nat))
(define + (λ (n m) (rec-Nat n
                     m
                     (λ (n-1 n-1+m) (add1 n-1+m)))))
(check-same Nat (+ 3 4) 7)

;;
;; Peas:
;; Scala Version
;; def peas(N : Nat) : Vec[N] = ??
;;

;; For Testing
(claim pea1 (Vec Atom 1))
(define pea1
  (vec:: 'pea vecnil))

(claim pea2 (Vec Atom 2))
(define pea2
  (vec:: 'pea pea1))


(claim pea3 (Vec Atom 3))
(define pea3
  (vec:: 'pea pea2))

;; defs
(claim peas
  (Pi ((how-many-peas Nat))
    (Vec Atom how-many-peas)))

(claim mot-peas
  (-> Nat U))

(define mot-peas
  (λ (k)
    (Vec Atom k)))

(check-same U (mot-peas 4) (Vec Atom 4))

(claim step-peas
  (Pi((l-1 Nat))
    (-> (mot-peas l-1)
        (mot-peas (add1 l-1)))))

(define step-peas
  (λ (l-1)
    (λ (peasl-1)
      (vec:: 'pea peasl-1))))

(check-same (Vec Atom 2)
  (step-peas 1 pea1)
  pea2)

(check-same (Vec Atom 3)
  (step-peas 2 pea2)
  pea3)

(define peas
  (λ (how-many-peas)
    (ind-Nat how-many-peas  ;;the list -> really a linked list
      mot-peas              ;; the thing that says what the next type is 
      vecnil                ;; the base case
      step-peas)))          ;;the non base case

(check-same (Vec Atom 0) vecnil (peas 0))

(check-same (Vec Atom 1) pea1 (peas 1))

(= Nat (+ 2 2) 4)

(claim Even
  (-> Nat U))
;;(define Even
;;  (λ (n)
;;    (Σ ((half Nat))
;;      (= Nat n (double half)))))
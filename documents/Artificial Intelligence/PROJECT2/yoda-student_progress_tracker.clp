;; Two globals to hold our two FuzzyVariables for percentage and hours/week 
(defglobal ?*ratingFvar* = (new nrc.fuzzy.FuzzyVariable "rating" 0.0 100.0 "percentage")) 
(defglobal ?*hourFvar* = (new nrc.fuzzy.FuzzyVariable "timespent per week" 0.0 40.0 "hours/week"))
(defglobal ?*count* = 0)
(defglobal ?*name* = "name")

(deffunction take-input() 
 ;; take input from admin. 
 ;Only the admin with the correct username and password can enter the system. 
(printout t "Username:" crlf) 
(printout t "hint: username is admin" crlf)
(bind ?username (read)) 
(printout t "Password:" crlf)
(printout t "hint: password is adminpass" crlf) 
(bind ?password (read))        
(if (and (eq ?username admin) (eq ?password adminpass)) then 
(bind ?login y)
(printout t "Welcome to Student Progress Tracker, Admin!" crlf)
(printout t "Enter student name:" crlf)
(bind ?*name* (read))        
(printout t "How many hours does the student study per week? (1/2/3)" crlf) 
(printout t "  1. 1-10 hours/week " crlf)
(printout t "  2. 20-40 hours/week " crlf)
(printout t "  3. 30-40 hours/week " crlf) 
(printout t "  Enter your choice: " crlf)
(bind ?time (read))

(if(and (eq ?time 1)) then 
(assert (theHour (new nrc.fuzzy.FuzzyValue ?*hourFvar* "low"))))
            
(if(and (eq ?time 2)) then 
(assert (theHour (new nrc.fuzzy.FuzzyValue ?*hourFvar* "medium"))))
                
(if(and (eq ?time 3)) then 
(assert (theHour (new nrc.fuzzy.FuzzyValue ?*hourFvar* "high"))))
                        
 else 
(bind ?login n)
(printout t "Incorrect username or password" crlf)))

(deffunction grade-increment-per-rating()
(printout t "" crlf)
(printout t "" crlf)
(printout t "****************************************" crlf)
(printout t "      GRADE INCREMENT EVERY SEMESTER" crlf)
(printout t "****************************************" crlf)
(if (= ?*count* 1) then 
   (printout t ?*name* " has no grade increment for this semester." crlf))
(if (= ?*count* 2) then 
    (printout t ?*name* " has the grade increment of 5% this semester." crlf))
(if (= ?*count* 3) then 
    (printout t ?*name* " has the grade increment of 7% this semester." crlf))
(if (= ?*count* 4) then 
    (printout t ?*name* " has the grade increment of 10% this semester." crlf))
(if (= ?*count* 5) then 
    (printout t ?*name* " has the grade increment of 20% this semester." crlf))    
    
)    
(defrule init 
  => 
   (load-package nrc.fuzzy.jess.FuzzyFunctions)
   ;; terms for the rating Fuzzy Variable 
   (?*ratingFvar* addTerm "poor" (new nrc.fuzzy.ZFuzzySet 0 20)) 
   (?*ratingFvar* addTerm "satisfactory" (new nrc.fuzzy.TriangleFuzzySet 30 10)) 
   (?*ratingFvar* addTerm "good" (new nrc.fuzzy.TriangleFuzzySet 50 20)) 
   (?*ratingFvar* addTerm "excellent" (new nrc.fuzzy.SFuzzySet 70 100)) 
   ;; terms for the hours/week Fuzzy Variable 
   (?*hourFvar* addTerm "low" (new nrc.fuzzy.PIFuzzySet 5.0 5.0)) 
   (?*hourFvar* addTerm "medium" (new nrc.fuzzy.PIFuzzySet 20.0 10.0)) 
   (?*hourFvar* addTerm "high" (new nrc.fuzzy.SFuzzySet 30.0 40.0))
   (take-input)
)

(defrule hour-low-rating-poor 
    (theHour ?t&:(fuzzy-match ?t "low")) 
 => 
   (assert (theRating (new nrc.fuzzy.FuzzyValue ?*ratingFvar* "poor"))) 
   (bind ?*count* 1)
)

(defrule hour-lowormedium-rating-satisfactory 
    (theHour ?t&:(fuzzy-match ?t "low or medium")) 
 => 
   (assert (theRating (new nrc.fuzzy.FuzzyValue ?*ratingFvar* "satisfactory"))) 
   (bind ?*count* 2)
)

(defrule hour-medium-rating-good
    (theHour ?t&:(fuzzy-match ?t "medium")) 
 => 
   (assert (theRating (new nrc.fuzzy.FuzzyValue ?*ratingFvar* "good"))) 
   (bind ?*count* 3)
)

(defrule hour-mediumorhigh-rating-good 
    (theHour ?t&:(fuzzy-match ?t "medium or high")) 
 => 
   (assert (theRating (new nrc.fuzzy.FuzzyValue ?*ratingFvar* "good"))) 
   (bind ?*count* 4)
)

(defrule hour-high-rating-excellent 
    (theHour ?t&:(fuzzy-match ?t "high")) 
 => 
   (assert (theRating (new nrc.fuzzy.FuzzyValue ?*ratingFvar* "excellent"))) 
   (bind ?*count* 5)
)

(defrule do-the-printing 
   (theRating ?t) 
   (theHour ?p) 
 => 
   (printout t "*************************************************" crlf)
   (printout t "                CONCLUSION                       " crlf)
   (printout t "*************************************************" crlf)
   (if (= ?*count* 1) then 
   (printout t ?*name* " is rated poor since the average time spent on studying is low." crlf)
   (printout t "rating is: " (?t toString) crlf "hour is: " (?p toString) crlf) 
   (bind ?theFzVals 
        (create$ (new nrc.fuzzy.FuzzyValue ?*ratingFvar* "poor") ?t) 
   ) 
   (printout t (call nrc.fuzzy.FuzzyValue plotFuzzyValues "*+" ?theFzVals) crlf) 
   (printout t (call (new nrc.fuzzy.FuzzyValue ?*hourFvar* "low") 
                      plotFuzzyValue "*") crlf) 
   (printout t (?p plotFuzzyValue "*") crlf))
    
    (if (= ?*count* 2) then 
    (printout t ?*name* " is rated satisfactory since the average time spent on studying is low to medium." crlf)
   (printout t "rating is: " (?t toString) crlf "hour is: " (?p toString) crlf) 
   (bind ?theFzVals 
        (create$ (new nrc.fuzzy.FuzzyValue ?*ratingFvar* "satisfactory") ?t) 
   ) 
   (printout t (call nrc.fuzzy.FuzzyValue plotFuzzyValues "*+" ?theFzVals) crlf) 
   (printout t (call (new nrc.fuzzy.FuzzyValue ?*hourFvar* "low or medium") 
                      plotFuzzyValue "*") crlf) 
   (printout t (?p plotFuzzyValue "*") crlf))
    
    (if (= ?*count* 3) then 
    (printout t ?*name* " is rated good since the average time spent on studying is medium." crlf)
   (printout t "rating is: " (?t toString) crlf "hour is: " (?p toString) crlf) 
   (bind ?theFzVals 
        (create$ (new nrc.fuzzy.FuzzyValue ?*ratingFvar* "good") ?t) 
   ) 
   (printout t (call nrc.fuzzy.FuzzyValue plotFuzzyValues "*+" ?theFzVals) crlf) 
   (printout t (call (new nrc.fuzzy.FuzzyValue ?*hourFvar* "medium") 
                      plotFuzzyValue "*") crlf) 
   (printout t (?p plotFuzzyValue "*") crlf))
    
    (if (= ?*count* 4) then 
        (printout t ?*name* " is rated good since the average time spent on studying is med-high." crlf)
   (printout t "rating is: " (?t toString) crlf "hour is: " (?p toString) crlf) 
   (bind ?theFzVals 
        (create$ (new nrc.fuzzy.FuzzyValue ?*ratingFvar* "good") ?t) 
   ) 
   (printout t (call nrc.fuzzy.FuzzyValue plotFuzzyValues "*+" ?theFzVals) crlf) 
   (printout t (call (new nrc.fuzzy.FuzzyValue ?*hourFvar* "medium or high") 
                      plotFuzzyValue "*") crlf) 
   (printout t (?p plotFuzzyValue "*") crlf))
    
    (if (= ?*count* 5) then 
        (printout t ?*name* " is rated excellent since the average time spent on studying is high." crlf)
   (printout t "rating is: " (?t toString) crlf "hour is: " (?p toString) crlf) 
   (bind ?theFzVals 
        (create$ (new nrc.fuzzy.FuzzyValue ?*ratingFvar* "excellent") ?t) 
   ) 
   (printout t (call nrc.fuzzy.FuzzyValue plotFuzzyValues "*+" ?theFzVals) crlf) 
   (printout t (call (new nrc.fuzzy.FuzzyValue ?*hourFvar* "high") 
                      plotFuzzyValue "*") crlf) 
   (printout t (?p plotFuzzyValue "*") crlf))
   (grade-increment-per-rating)
)


(reset)
(run)
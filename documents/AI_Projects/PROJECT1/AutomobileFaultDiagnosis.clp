;********************
;username: admin
;password: adminpass 
;********************

; ************
; DEFTEMPLATES
; ************

(deftemplate automobile(slot body-type) (slot price) (multislot problems))  
(deftemplate service(slot type))
(deftemplate cheap-suv(slot type))
(deftemplate cheap-sedan(slot type))
(deftemplate cheap-sports-car(slot type))
(deftemplate cheap-diesel(slot type))
(deftemplate cheap-hatchback(slot type))
(deftemplate expensive-suv(slot type))
(deftemplate expensive-sedan(slot type))
(deftemplate expensive-sports-car(slot type))
(deftemplate expensive-diesel(slot type))
(deftemplate expensive-hatchback(slot type))

; ***********
; DEFFUNCTION 
; ***********

(deffunction start ()

;Only the admin with the correct username and password can enter the system. 
(printout t "Username:" crlf) 
(printout t "hint: username is admin" crlf)
(bind ?username (read)) 
(printout t "Password:" crlf)
(printout t "hint: password is adminpass" crlf) 
(bind ?password (read)) 
(if (and (eq ?username admin) (eq ?password adminpass)) then 
(bind ?login y)
(printout t "Welcome to Automobile Fault Diagnosis, Admin!" crlf) 
(printout t " *************** " crlf) 
(printout t "     PART I      " crlf) 
(printout t " *************** " crlf) 
(printout t "What is the body-type of your automobile (1/2/3/4/5)" crlf) 
(printout t "  1. SUV " crlf)
(printout t "  2. Sedan " crlf) 
(printout t "  3. Sports Car " crlf)
(printout t "  4. Diesel " crlf)
(printout t "  5. Hatchback " crlf)
(printout t "  Enter your choice: " crlf)
(bind ?body-type (read))  

(printout t " *************** " crlf) 
(printout t "     PART II      " crlf) 
(printout t " *************** " crlf) 
(printout t "What is the price range of your automobile? (1/2)" crlf) 
(printout t "  1. <$30,000 " crlf)
(printout t "  2. >$30,000 " crlf)
(printout t "  Enter your choice: " crlf) 
(bind ?price (read))
        
(if(and (eq ?body-type 1) (eq ?price 1)) then 
(assert (automobile(body-type suv) (price <$30,000)))) 

(if(and (eq ?body-type 1) (eq ?price 2)) then 
(assert (automobile(body-type suv) (price >$30,000))))  

(if(and (eq ?body-type 2) (eq ?price 1)) then 
(assert (automobile(body-type sedan) (price <$30,000)))) 
       
(if(and (eq ?body-type 2) (eq ?price 2)) then 
(assert (automobile(body-type sedan) (price >$30,000)))) 

(if(and (eq ?body-type 4) (eq ?price 1)) then 
(assert (automobile(body-type diesel) (price <$30,000)))) 
       
(if(and (eq ?body-type 4) (eq ?price 2)) then 
(assert (automobile(body-type diesel) (price >$30,000)))) 

(if(and (eq ?body-type 3) (eq ?price 1)) then 
(assert (automobile(body-type sports-car) (price <$30,000)))) 

(if(and (eq ?body-type 3) (eq ?price 2)) then 
(assert (automobile(body-type sports-car) (price >$30,000)))) 
 
(if(and (eq ?body-type 5) (eq ?price 1)) then 
(assert (automobile(body-type hatchback) (price <$30,000)))) 

(if(and (eq ?body-type 5) (eq ?price 2)) then 
(assert (automobile(body-type hatchback) (price >$30,000)))) 

else 
(bind ?login n)
(printout t "Incorrect username or password" crlf)))

(deffunction servicing() 
(printout t " *************** " crlf) 
(printout t "    PART IIIb      " crlf) 
(printout t " *************** " crlf)  
(printout t "How often do you do service your automobile? (1/2/3/4)" crlf) 
(printout t "  1. Never! " crlf)
(printout t "  2. Rarely (Once a year) " crlf)
(printout t "  3. Sometimes (Once in 6 months)  " crlf) 
(printout t "  4. Very often (Once a month) " crlf)
(printout t "  Enter your choice: " crlf)
(bind ?opt (read))
(if (eq ?opt 3) then 
(assert(service(type yes))))
(if (eq ?opt 4) then 
(assert(service(type yes))))
(if (eq ?opt 1) then 
(assert(service(type no))))
(if (eq ?opt 2) then 
(assert(service(type no))))) 

(deffunction cheap-suv() 
(printout t " *************** " crlf) 
(printout t "    PART IIIa      " crlf) 
(printout t " *************** " crlf)
(printout t " Your automobile is a cheap priced SUV " crlf)  
(printout t "Which of these problems do you think your SUV is facing?" crlf) 
(printout t "  1. Engine Start Problems" crlf)
(printout t "  2. Engine Overheating" crlf)
(printout t "  3. HVAC Problems" crlf) 
(printout t "  4. Brake Problems" crlf) 
(printout t "  5. Tire Problems" crlf)
(printout t "  Enter your choice: " crlf)
(bind ?opt_one (read))
(assert(cheap-suv(type ?opt_one))))

(deffunction expensive-suv() 
(printout t " *************** " crlf) 
(printout t "    PART IIIa      " crlf) 
(printout t " *************** " crlf)
(printout t " Your automobile is an expensive SUV " crlf)  
(printout t "Which of these problems do you think your SUV is facing?" crlf) 
(printout t "  1. Blown Motor" crlf) 
(printout t "  2. Transmission Problems" crlf) 
(printout t "  3. HVAC Problems" crlf)
(printout t "  Enter your choice: " crlf)
(bind ?opt_one (read))
(assert(expensive-suv(type ?opt_one))))

(deffunction cheap-sedan() 
(printout t " *************** " crlf) 
(printout t "    PART IIIa      " crlf) 
(printout t " *************** " crlf)
(printout t " Your automobile is a cheap priced Sedan " crlf)  
(printout t "Which of these problems do you think your Sedan is facing?" crlf) 
(printout t "  1. Engine Start Problems" crlf)
(printout t "  2. Engine Overheating" crlf)
(printout t "  3. HVAC Problems" crlf) 
(printout t "  4. Brake Problems" crlf) 
(printout t "  5. Tire Problems" crlf)
(printout t "  Enter your choice: " crlf)
(bind ?opt_one (read))
(assert(cheap-sedan(type ?opt_one))))

(deffunction expensive-sedan() 
(printout t " *************** " crlf) 
(printout t "    PART IIIa      " crlf) 
(printout t " *************** " crlf)
(printout t " Your automobile is an expensive Sedan " crlf)  
(printout t "Which of these problems do you think your Sedan is facing?" crlf) 
(printout t "  1. Blown Motor" crlf) 
(printout t "  2. Transmission Problems" crlf) 
(printout t "  3. HVAC Problems" crlf)
(printout t "  Enter your choice: " crlf)
(bind ?opt_one (read))
(assert(expensive-sedan(type ?opt_one))))

(deffunction cheap-sports-car() 
(printout t " *************** " crlf) 
(printout t "    PART IIIa      " crlf) 
(printout t " *************** " crlf)
(printout t " Your automobile is a cheap priced Sports Car " crlf)  
(printout t "Which of these problems do you think your Sports Car is facing?" crlf) 
(printout t "  1. Engine Start Problems" crlf)
(printout t "  2. Engine Overheating" crlf)
(printout t "  3. HVAC Problems" crlf) 
(printout t "  4. Brake Problems" crlf) 
(printout t "  5. Tire Problems" crlf)
(printout t "  Enter your choice: " crlf)
(bind ?opt_one (read))
(assert(cheap-sports-car(type ?opt_one))))

(deffunction expensive-sports-car() 
(printout t " *************** " crlf) 
(printout t "    PART IIIa      " crlf) 
(printout t " *************** " crlf)
(printout t " Your automobile is an expensive Sports Car " crlf)  
(printout t "Which of these problems do you think your Sports Car is facing?" crlf) 
(printout t "  1. Blown Motor" crlf) 
(printout t "  2. Transmission Problems" crlf) 
(printout t "  3. HVAC Problems" crlf)
(printout t "  Enter your choice: " crlf)
(bind ?opt_one (read))
(assert(expensive-sports-car(type ?opt_one))))

(deffunction cheap-diesel() 
(printout t " *************** " crlf) 
(printout t "    PART IIIa      " crlf) 
(printout t " *************** " crlf)
(printout t " Your automobile is a cheap priced Diesel Car " crlf)  
(printout t "Which of these problems do you think your diesel car is facing?" crlf) 
(printout t "  1. Engine Start Problems" crlf)
(printout t "  2. Engine Overheating" crlf)
(printout t "  3. Oil Change" crlf) 
(printout t "  4. Brake Problems" crlf) 
(printout t "  5. Tire Problems" crlf)
(printout t "  Enter your choice: " crlf)
(bind ?opt_one (read))
(assert(cheap-diesel(type ?opt_one))))

(deffunction expensive-diesel() 
(printout t " *************** " crlf) 
(printout t "    PART IIIa      " crlf) 
(printout t " *************** " crlf)
(printout t " Your automobile is an expensive Diesel Car " crlf)  
(printout t "Which of these problems do you think your diesel car is facing?" crlf) 
(printout t "  1. Blown Motor" crlf) 
(printout t "  2. Transmission Problems" crlf) 
(printout t "  3. HVAC Problems" crlf)
(printout t "  4. Oil Change" crlf)
(printout t "  Enter your choice: " crlf)
(bind ?opt_one (read))
(assert(expensive-diesel(type ?opt_one))))

(deffunction cheap-hatchback() 
(printout t " *************** " crlf) 
(printout t "    PART IIIa      " crlf) 
(printout t " *************** " crlf)
(printout t " Your automobile is a cheap priced Hatchback " crlf)  
(printout t "Which of these problems do you think your Hatchback is facing?" crlf) 
(printout t "  1. Engine Start Problems" crlf)
(printout t "  2. Engine Overheating" crlf)
(printout t "  3. HVAC Problems" crlf) 
(printout t "  4. Brake Problems" crlf) 
(printout t "  5. Tire Problems" crlf)
(printout t "  Enter your choice: " crlf)
(bind ?opt_one (read))
(assert(cheap-hatchback(type ?opt_one))))

(deffunction expensive-hatchback() 
(printout t " *************** " crlf) 
(printout t "    PART IIIa      " crlf) 
(printout t " *************** " crlf)
(printout t " Your automobile is an expensive Hatchback " crlf)  
(printout t "Which of these problems do you think your Hatchback is facing?" crlf) 
(printout t "  1. Blown Motor" crlf) 
(printout t "  2. Transmission Problems" crlf) 
(printout t "  3. HVAC Problems" crlf)
(printout t "  Enter your choice: " crlf)
(bind ?opt_one (read))
(assert(expensive-hatchback(type ?opt_one))))
 
; ********
; DEFRULES
; ********
    
;Rule#0 
(defrule print-content
=> 
(start))

;Rule#1 
(defrule cheap-suv-data 
(automobile(body-type ?b&suv)(price ?p&<$30,000))
=> 
(cheap-suv)
(servicing) 
)

;Rule#2 
(defrule cheap-suv-data-conclusion 
(service(type ?y&yes))
(automobile(body-type ?b&suv)(price ?p&<$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is a cheap priced SUV which is serviced quite often. 
The Engine Start problem can be solved by checking for spark in the engine, check your air filters or check for fuel.
Engine Overheating can be diagnosed by visual inspection of the cooling system. Inspect for warped belts and leaking hoses. Ensure the cooling fan comes on.
HVAC problems can be solved by replacing air filters or cleaning them up.
Brake failure may be because of leakage in some component. Replace the component. 
Check the tires for air and pressure regularly. Replace with spare tire when threshold has been reached." crlf)
)

;Rule#3 
(defrule expensive-suv-data 
(automobile(body-type ?b&suv)(price ?p&>$30,000))
=> 
(expensive-suv)
(servicing) 
)  

;Rule#4 
(defrule expensive-suv-data-conclusion
(service(type ?y&yes))
(automobile(body-type ?b&suv)(price ?p&>$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is an expensive SUV which is serviced quite often. 
For a blown motor, you can either repair the engine block, the cylinder head or a complete engine replacement could be required.
Check if the transmission fluid is low. If low, add more. If fluid is completely burnt or black, it may require a complete fluid and filter change.
HVAC problems can be solved by replacing air filters or cleaning them up." crlf))

;Rule#5 
(defrule cheap-sedan-data 
(automobile(body-type ?b&sedan)(price ?p&<$30,000))
=> 
(cheap-sedan)
(servicing) 
)  

;Rule#6 
(defrule cheap-sedan-data-conclusion
(service(type ?y&yes))
(automobile(body-type ?b&sedan)(price ?p&<$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is a cheap priced Sedan which is serviced quite often.
The Engine Start problem can be solved by checking for spark in the engine, check your air filters or check for fuel.
Engine Overheating can be diagnosed by visual inspection of the cooling system. Inspect for warped belts and leaking hoses. Ensure the cooling fan comes on.
HVAC problems can be solved by replacing air filters or cleaning them up.
Brake failure may be because of leakage in some component. Replace the component. 
Check the tires for air and pressure regularly. Replace with spare tire when threshold has been reached." crlf))

;Rule#7 
(defrule expensive-sedan-data 
(automobile(body-type ?b&sedan)(price ?p&>$30,000))
=> 
(expensive-sedan)
(servicing) 
)  

;Rule#8 
(defrule expensive-sedan-data-conclusion
(service(type ?y&yes))
(automobile(body-type ?b&sedan)(price ?p&>$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is an expensive Sedan which is serviced quite often. 
For a blown motor, you can either repair the engine block, the cylinder head or a complete engine replacement could be required.
Check if the transmission fluid is low. If low, add more. If fluid is completely burnt or black, it may require a complete fluid and filter change.
HVAC problems can be solved by replacing air filters or cleaning them up." crlf))

;Rule#9 
(defrule cheap-sports-data 
(automobile(body-type ?b&sports-car)(price ?p&<$30,000))
=> 
(cheap-sports-car)
(servicing) 
)  

;Rule#10 
(defrule cheap-sports-data-conclusion
(service(type ?y&yes))
(automobile(body-type ?b&sports-car)(price ?p&<$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is a cheap priced Sports Car which is serviced quite often.
The Engine Start problem can be solved by checking for spark in the engine, check your air filters or check for fuel.
Engine Overheating can be diagnosed by visual inspection of the cooling system. Inspect for warped belts and leaking hoses. Ensure the cooling fan comes on.
HVAC problems can be solved by replacing air filters or cleaning them up.
Brake failure may be because of leakage in some component. Replace the component. 
Check the tires for air and pressure regularly. Replace with spare tire when threshold has been reached. " crlf))

;Rule#11
(defrule expensive-sports-data 
(automobile(body-type ?b&sports-car)(price ?p&>$30,000))
=> 
(expensive-sports-car)
(servicing) 
)  

;Rule#12
(defrule expensive-sports-data-conclusion
(service(type ?y&yes))
(automobile(body-type ?b&sports-car)(price ?p&>$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is an expensive Sports Car which is serviced quite often.
For a blown motor, you can either repair the engine block, the cylinder head or a complete engine replacement could be required.
Check if the transmission fluid is low. If low, add more. If fluid is completely burnt or black, it may require a complete fluid and filter change.
HVAC problems can be solved by replacing air filters or cleaning them up." crlf))

;Rule#13 
(defrule cheap-diesel-data 
(automobile(body-type ?b&diesel)(price ?p&<$30,000))
=> 
(cheap-diesel)
(servicing) 
)  

;Rule#14 
(defrule cheap-diesel-data-conclusion
(service(type ?y&yes))
(automobile(body-type ?b&diesel)(price ?p&<$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is a cheap priced Diesel vehicle which is serviced quite often.
The Engine Start problem can be solved by checking for spark in the engine, check your air filters or check for fuel.
Engine Overheating can be diagnosed by visual inspection of the cooling system. Inspect for warped belts and leaking hoses. Ensure the cooling fan comes on.
Inpect the coolant reservoir levels, engine air filtration system, serpentine belts, brake fluid level, wiper blades, exterior lights and chassis for oil change.
Brake failure may be because of leakage in some component. Replace the component. 
Check the tires for air and pressure regularly. Replace with spare tire when threshold has been reached. " crlf))

;Rule#15 
(defrule expensive-diesel-data 
(automobile(body-type ?b&diesel)(price ?p&>$30,000))
=> 
(expensive-diesel)
(servicing) 
)  

;Rule#16 
(defrule expensive-diesel-data-conclusion
(service(type ?y&yes))
(automobile(body-type ?b&diesel)(price ?p&>$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is an expensive Diesel vehicle which is serviced quite often.
For a blown motor, you can either repair the engine block, the cylinder head or a complete engine replacement could be required.
Check if the transmission fluid is low. If low, add more. If fluid is completely burnt or black, it may require a complete fluid and filter change.
HVAC problems can be solved by replacing air filters or cleaning them up." crlf))

;Rule#17 
(defrule cheap-hatchback-data 
(automobile(body-type ?b&hatchback)(price ?p&<$30,000))
=> 
(cheap-hatchback)
(servicing) 
)  

;Rule#18 
(defrule cheap-hatchback-data-conclusion
(service(type ?y&yes))
(automobile(body-type ?b&hatchback)(price ?p&<$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is a cheap priced Hatchback which is serviced quite often.
The Engine Start problem can be solved by checking for spark in the engine, check your air filters or check for fuel.
Engine Overheating can be diagnosed by visual inspection of the cooling system. Inspect for warped belts and leaking hoses. Ensure the cooling fan comes on.
HVAC problems can be solved by replacing air filters or cleaning them up.
Brake failure may be because of leakage in some component. Replace the component. 
Check the tires for air and pressure regularly. Replace with spare tire when threshold has been reached. " crlf))

;Rule#19 
(defrule expensive-hatchback-data 
(automobile(body-type ?b&hatchback)(price ?p&>$30,000))
=> 
(expensive-hatchback)
(servicing) 
)  

;Rule#20 
(defrule expensive-hatchback-data-conclusion
(service(type ?y&yes))
(automobile(body-type ?b&hatchback)(price ?p&>$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is an expensive Hatchback which is serviced quite often.
For a blown motor, you can either repair the engine block, the cylinder head or a complete engine replacement could be required.
Check if the transmission fluid is low. If low, add more. If fluid is completely burnt or black, it may require a complete fluid and filter change.
HVAC problems can be solved by replacing air filters or cleaning them up." crlf))

;Rule#21 
(defrule cheap-suv-data-no-conclusion
(service(type ?y&no))
(automobile(body-type ?b&suv)(price ?p&<$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is a cheap priced SUV which is not serviced very often.
Please consider servicing your automobile more often than you do.
The Engine Start problem can be solved by checking for spark in the engine, check your air filters or check for fuel.
Engine Overheating can be diagnosed by visual inspection of the cooling system. Inspect for warped belts and leaking hoses. Ensure the cooling fan comes on.
HVAC problems can be solved by replacing air filters or cleaning them up.
Brake failure may be because of leakage in some component. Replace the component. 
Check the tires for air and pressure regularly. Replace with spare tire when threshold has been reached. " crlf))

;Rule#22 
(defrule expensive-suv-data-no-conclusion
(service(type ?y&no))
(automobile(body-type ?b&suv)(price ?p&>$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is an expensive SUV which is not serviced very often.
For a blown motor, you can either repair the engine block, the cylinder head or a complete engine replacement could be required.
Check if the transmission fluid is low. If low, add more. If fluid is completely burnt or black, it may require a complete fluid and filter change.
HVAC problems can be solved by replacing air filters or cleaning them up." crlf))

;Rule#23 
(defrule cheap-sedan-data-no-conclusion
(service(type ?y&no))
(automobile(body-type ?b&sedan)(price ?p&<$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is a cheap priced Sedan which is not serviced very often. 
Please consider servicing your automobile more often than you do.
The Engine Start problem can be solved by checking for spark in the engine, check your air filters or check for fuel.
Engine Overheating can be diagnosed by visual inspection of the cooling system. Inspect for warped belts and leaking hoses. Ensure the cooling fan comes on.
HVAC problems can be solved by replacing air filters or cleaning them up.
Brake failure may be because of leakage in some component. Replace the component. 
Check the tires for air and pressure regularly. Replace with spare tire when threshold has been reached. " crlf))

;Rule#24 
(defrule expensive-sedan-data-no-conclusion
(service(type ?y&no))
(automobile(body-type ?b&sedan)(price ?p&>$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is an expensive Sedan which is not serviced very often.
For a blown motor, you can either repair the engine block, the cylinder head or a complete engine replacement could be required.
Check if the transmission fluid is low. If low, add more. If fluid is completely burnt or black, it may require a complete fluid and filter change.
HVAC problems can be solved by replacing air filters or cleaning them up." crlf))

;Rule#25 
(defrule cheap-sports-data-no-conclusion
(service(type ?y&no))
(automobile(body-type ?b&sports-car)(price ?p&<$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is a cheap priced Sports Car which is not serviced very often.
Please consider servicing your automobile more often than you do.
The Engine Start problem can be solved by checking for spark in the engine, check your air filters or check for fuel.
Engine Overheating can be diagnosed by visual inspection of the cooling system. Inspect for warped belts and leaking hoses. Ensure the cooling fan comes on.
HVAC problems can be solved by replacing air filters or cleaning them up.
Brake failure may be because of leakage in some component. Replace the component. 
Check the tires for air and pressure regularly. Replace with spare tire when threshold has been reached. " crlf))

;Rule#26 
(defrule expensive-sports-data-no-conclusion
(service(type ?y&no))
(automobile(body-type ?b&sports-car)(price ?p&>$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is an expensive Sports Car which is not serviced very often.
For a blown motor, you can either repair the engine block, the cylinder head or a complete engine replacement could be required.
Check if the transmission fluid is low. If low, add more. If fluid is completely burnt or black, it may require a complete fluid and filter change.
HVAC problems can be solved by replacing air filters or cleaning them up." crlf))

;Rule#27 
(defrule cheap-diesel-data-no-conclusion
(service(type ?y&no))
(automobile(body-type ?b&diesel)(price ?p&<$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is a cheap priced Diesel Vehicle which is not serviced very often.
Please consider servicing your automobile more often than you do.
The Engine Start problem can be solved by checking for spark in the engine, check your air filters or check for fuel.
Engine Overheating can be diagnosed by visual inspection of the cooling system. Inspect for warped belts and leaking hoses. Ensure the cooling fan comes on.
HVAC problems can be solved by replacing air filters or cleaning them up.
Inpect the coolant reservoir levels, engine air filtration system, serpentine belts, brake fluid level, wiper blades, exterior lights and chassis for oil change.
Brake failure may be because of leakage in some component. Replace the component. 
Check the tires for air and pressure regularly. Replace with spare tire when threshold has been reached. " crlf))

;Rule#28 
(defrule expensive-diesel-data-no-conclusion
(service(type ?y&no))
(automobile(body-type ?b&diesel)(price ?p&>$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is an expensive Diesel Vehicle which is not serviced very often.
For a blown motor, you can either repair the engine block, the cylinder head or a complete engine replacement could be required.
Inpect the coolant reservoir levels, engine air filtration system, serpentine belts, brake fluid level, wiper blades, exterior lights and chassis for oil change.
Check if the transmission fluid is low. If low, add more. If fluid is completely burnt or black, it may require a complete fluid and filter change.
HVAC problems can be solved by replacing air filters or cleaning them up." crlf))

;Rule#29 
(defrule cheap-hatchback-data-no-conclusion
(service(type ?y&no))
(automobile(body-type ?b&hatchback)(price ?p&<$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is a cheap priced Hatchback which is not serviced very often.
Please consider servicing your automobile more often than you do.
The Engine Start problem can be solved by checking for spark in the engine, check your air filters or check for fuel.
Engine Overheating can be diagnosed by visual inspection of the cooling system. Inspect for warped belts and leaking hoses. Ensure the cooling fan comes on.
HVAC problems can be solved by replacing air filters or cleaning them up.
Brake failure may be because of leakage in some component. Replace the component. 
Check the tires for air and pressure regularly. Replace with spare tire when threshold has been reached. " crlf))

;Rule#30 
(defrule expensive-hatchback-data-no-conclusion
(service(type ?y&no))
(automobile(body-type ?b&hatchback)(price ?p&>$30,000)) 
=> 
(printout t "****************************" crlf) 
(printout t "       DIAGNOSIS           " crlf) 
(printout t "****************************" crlf)
(printout t "Your automobile is an expensive Hatchback which is not serviced very often.
For a blown motor, you can either repair the engine block, the cylinder head or a complete engine replacement could be required.
Check if the transmission fluid is low. If low, add more. If fluid is completely burnt or black, it may require a complete fluid and filter change.
HVAC problems can be solved by replacing air filters or cleaning them up." crlf))

(reset)
(run)
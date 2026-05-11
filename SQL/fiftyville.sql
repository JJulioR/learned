-- Keep a log of any SQL queries you execute as you solve the mystery.
SELECT description
FROM crime_scene_reports
WHERE year = 2025 AND month = 7 AND day=28
AND street = 'Humphrey Street';

SELECT *
FROM crime_scene_reports
WHERE year = 2025 AND month = 7 AND day=28
AND street = 'Humphrey Street';


SELECT *
FROM interviews
WHERE year =2025 AND month = 7 AND day=28;

-- ruth eugene et raymon voiture dans le parking de la bakery - de 10 min après le vol (10h15)
-- Il a retirer de l'argent le matin
-- Passer un appel de moins d'une minute prendre le 1er vol du 29/7

SELECT *
FROM atm_transactions
WHERE year = 2025 AND month = 7 AND day=28
AND transaction_type ='withdraw'
AND atm_location ='Leggett Street';

-- lier les bank account à des noms
SELECT *
FROM atm_transactions
JOIN bank_accounts ON atm_transactions.account_number = bank_accounts.account_number
JOIN people ON bank_accounts.person_id = people.id
WHERE atm_transactions.year = 2025 AND atm_transactions.month = 7 AND atm_transactions.day=28
AND atm_transactions.transaction_type ='withdraw'
AND atm_transactions.atm_location ='Leggett Street';


SELECT *
FROM bakery_security_logs
WHERE year = 2025 AND month = 7
AND day= 28
AND activity = 'exit';

--lié les plaques qui sorte du parking de la bakery entre 10h15 et 10h25 avec des noms
SELECT DISTINCT name, people.license_plate, bakery_security_logs.hour, bakery_security_logs.minute
FROM bakery_security_logs
JOIN people ON bakery_security_logs.license_plate = people.license_plate
WHERE bakery_security_logs.year = 2025 AND bakery_security_logs.month = 7
AND bakery_security_logs.day= 28
AND bakery_security_logs.activity = 'exit'
AND bakery_security_logs.hour =10
AND bakery_security_logs.minute BETWEEN 15 AND 25;

-- récupérer ceux qui ont retiré de l'argent et sont sortie du parking de la bakery entre 10h15 et h25

SELECT DISTINCT p.name, p.license_plate
FROM people p
WHERE p.id IN(
    SELECT ba.person_id
    FROM bank_accounts ba
    JOIN atm_transactions a
    ON ba.account_number = a.account_number
    WHERE a.year = 2025 AND a.month =7 AND a.day=28 AND a.atm_location = 'Leggett Street' AND a.transaction_type = 'withdraw'
)
AND p.license_plate IN (
    SELECT b.license_plate
    FROM bakery_security_logs b
    WHERE b.year=2025 AND b.month = 7 AND b.day=28 AND b.activity= 'exit' AND b.hour = 10 AND b.minute BETWEEN 15 AND 25
);

-- 4 sus Iman Luca Diana Bruce

-- Appel de moins d'1min
SELECT *
FROM phone_calls
WHERE month = 7 AND day = 28 AND duration < 60;

-- croiser avec les suspects

SELECT DISTINCT p.name, p.license_plate, pc.caller, pc.receiver, pc.duration
FROM people p
JOIN phone_calls pc ON p.phone_number =pc.caller
WHERE p.name IN ('Iman', 'Luca', 'Diana','Bruce')
AND pc.month = 7
AND pc.year = 2025
AND pc.day =28
AND pc.duration <60;

-- qui est le receveur ?

SELECT DISTINCT p.name AS caller_name, p.license_plate, pc.receiver,receiver_person.name AS receiver_name, pc.duration
FROM people p
JOIN phone_calls pc ON p.phone_number =pc.caller
JOIN people receiver_person ON receiver_person.phone_number = pc.receiver
WHERE p.name IN ('Iman', 'Luca', 'Diana','Bruce')
AND pc.month = 7
AND pc.year = 2025
AND pc.day =28
AND pc.duration <60;

--2 sus Bruce (complice Robin) ou Diana (Complice Diana)


SELECT *
FROM flights
WHERE month = 7 AND day = 29 AND year = 2025
ORDER BY hour,minute;

-- le premier vol du 29/07 est à 8h20 quel est sa destination ? ID du vol est 36

SELECT flights.id, flights.hour, flights.minute, airports.city,airports.full_name
FROM flights
JOIN airports ON flights.destination_airport_id = airports.id
WHERE flights.id =36;

-- NEW YORK NEEEEWWWW YOOOORK, Laguardia airport

SELECT people.name, people.passport_number
FROM passengers
JOIN people ON passengers.passport_number = people.passport_number
WHERE passengers.flight_id = 36 AND people.name IN ('Bruce','Diana');

--BRUCE TOOK THE FLIGHT 

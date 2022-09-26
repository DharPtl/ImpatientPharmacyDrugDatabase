/*
Insert:
insert  into `patient`(`patient_ID`,`patient_firstName`,`patient_lastName`,`ohip_No`,`room_No`,`address`,`contact_No`) values
(1, 'Daniel', 'Nguyen', 12345, 11, '123 Fake Street', 1234567890);
Update specific field: SET TableField = TableField +/- 1


Counting *:
SELECT count(*) FROM *;
Example:
SELECT count(patient_ID) FROM patient;


Check stock:
SELECT qtyonhand FROM drug_item WHERE drug_ID = * (name of drug)
Check different brands:
SELECT trade_name FROM drug_item WHERE drug_name = acetaminophen
How many patients are on X drug?
SELECT count(patient_ID)
FROM prescription
INNER JOIN drug_item
ON prescription.drug_ID = drug_item.drug_ID
WHERE drug_ID = X

*/




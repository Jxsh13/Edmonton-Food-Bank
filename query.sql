SELECT d.donorid, d.name, SUM(dn.quantity) AS total_donated
FROM Donor d
JOIN Donation dn ON d.donorid = dn.donorid
GROUP BY d.donorid, d.name
ORDER BY total_donated DESC;

SELECT r.recipientid, r.name, MAX(d.distributiondate) AS last_distribution_date
FROM Recipient r
JOIN Distribution d ON r.distributionid = d.distributionid
GROUP BY r.recipientid, r.name
ORDER BY last_distribution_date DESC;

SELECT itemtype, SUM(quantity) AS total_quantity
FROM Donation
GROUP BY itemtype
ORDER BY total_quantity DESC;

SELECT e.eventid, e.name AS event_name, e.date, e.location, 
       dc.name AS campaign_name, v.name AS volunteer_name
FROM Event e
JOIN Donation_Campaign dc ON e.campaignid = dc.campaignid
JOIN Volunteer v ON e.volunteerid = v.volunteerid
ORDER BY e.date DESC;

SELECT 
    AVG(r.householdsize) AS avg_household_size, 
    SUM(d.quantity) AS total_distributed
FROM Recipient r
JOIN Distribution d ON r.distributionid = d.distributionid;


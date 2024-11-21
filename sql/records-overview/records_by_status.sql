
SELECT count(*) AS StatusCount
,CASE
WHEN Deleted = 0
THEN 'Active'
ELSE 'Deleted'
END AS Status
FROM DTreeCore
LEFT JOIN DTreeAncestors ON DTreeAncestors.DataID = DTreeCore.DataID
WHERE DTreeAncestors.AncestorID = 2000
AND DTreeCore.Deleted IN (
0
,1
)
AND DTreeCore.SubType IN (
144
,749
)
GROUP BY DTreeCore.Deleted
ORDER BY Status ASC
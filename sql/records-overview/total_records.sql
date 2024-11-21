	
SELECT count(*) AS TotalRecords
FROM DTreeCore
LEFT JOIN DTreeAncestors ON DTreeAncestors.DataID = DTreeCore.DataID
WHERE DTreeAncestors.AncestorID = 2000
AND DTreeCore.Deleted = 0
AND DTreeCore.SubType IN (
144
,749
);
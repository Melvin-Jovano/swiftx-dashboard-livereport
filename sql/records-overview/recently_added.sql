SELECT TOP (20) Audit.AuditDate, KUAF.Name "UserName", KUAF.FirstName, Audit.Value2 "FileName",
KUAF.LastName, DTreeCore.ParentID "FolderID", DtreeCore.DataID "FileID", 
DTreeCoreFolder.Name "FolderName"
FROM DAuditNewCore "Audit"
LEFT JOIN KUAF "KUAF" ON KUAF.ID = Audit.PerformerID
LEFT JOIN DTreeCore "DTreeCore" ON Audit.DataID = DtreeCore.DataID
LEFT JOIN DTreeCore "DTreeCoreFolder" ON DtreeCore.ParentID = "DTreeCoreFolder".DataID
WHERE Audit.AuditID = 1 
AND Audit.SubType = 144
ORDER BY Audit.AuditDate DESC
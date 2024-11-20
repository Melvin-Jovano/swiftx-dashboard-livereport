SELECT 
    Audit.AuditDate, 
    KUAF.Name AS UserName, 
    KUAF.FirstName, 
    Audit.Value2 AS FileName,
    KUAF.LastName, 
    DTreeCore.ParentID AS FolderID, 
    DTreeCore.DataID AS FileID, 
    DTreeCoreFolder.Name AS FolderName
FROM 
    DAuditNewCore AS Audit
LEFT JOIN 
    KUAF ON KUAF.ID = Audit.PerformerID
LEFT JOIN 
    DTreeCore ON Audit.DataID = DTreeCore.DataID
LEFT JOIN 
    DTreeCore AS DTreeCoreFolder ON DTreeCore.ParentID = DTreeCoreFolder.DataID
WHERE 
    Audit.AuditID = 1 
    AND Audit.SubType = 144
ORDER BY 
    Audit.AuditDate DESC;

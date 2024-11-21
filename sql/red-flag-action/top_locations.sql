SELECT TOP 3 dbo.audit_fn_llpath(core.ParentID) AS Location, COUNT(*) AS ActionCount, core.ParentID AS ParentID
FROM Auditflag flag 
INNER JOIN DAuditNew aud ON aud.EventID = flag.EventID 
LEFT JOIN DTreeCore core on core.DataID = aud.DataID
WHERE aud.AuditDate >= DATEADD(DAY, -%1, GETDATE())
  AND aud.AuditDate < GETDATE()
GROUP BY core.ParentID
ORDER BY ActionCount DESC
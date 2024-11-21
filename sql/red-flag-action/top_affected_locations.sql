SELECT COUNT(*) TotalCount, dbo.audit_fn_llpath(core.ParentID) AS Location, core.ParentID AS ParentID
FROM Auditflag flag 
INNER JOIN DAuditNew aud on aud.EventID = flag.EventID
LEFT JOIN DTreeCore core on core.DataID = aud.DataID
WHERE AuditStr = %1 AND aud.AuditDate >= DATEADD(DAY, -%2, GETDATE())
AND aud.AuditDate < GETDATE()
GROUP BY core.ParentID, core.ParentID
ORDER BY TotalCount DESC
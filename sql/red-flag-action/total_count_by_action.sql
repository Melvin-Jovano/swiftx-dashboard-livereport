	
select count(*) TotalCount from Auditflag flag inner join DAuditNew aud on aud.EventID = flag.EventID
where AuditStr = %1 and aud.AuditDate >= DATEADD(DAY, -%2, GETDATE())
AND aud.AuditDate < GETDATE()
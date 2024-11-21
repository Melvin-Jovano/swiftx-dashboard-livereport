-- CTE to get the latest version for each DocID
WITH LatestVersions AS (
SELECT
DocID,
MAX(Version) as LatestVersion
FROM DVersData
GROUP BY DocID
)
-- Main query to join DTree with the latest versions from DVersData
SELECT
COUNT(*) AS RecordsCount,
CASE
WHEN v.FileType IN ('doc', 'docx', 'pdf', 'txt', 'rtf', 'odt') THEN 'Document'
WHEN v.FileType IN ('jpg', 'jpeg', 'png', 'gif', 'bmp', 'tiff') THEN 'Image'
WHEN v.FileType IN ('mp4', 'avi', 'mov', 'wmv', 'flv') THEN 'Video'
WHEN v.FileType IN ('msg', 'eml') THEN 'Email'
WHEN v.FileType IN ('xls', 'xlsx', 'csv') THEN 'Spreadsheet'
WHEN v.FileType IN ('ppt', 'pptx') THEN 'Presentation'
WHEN v.FileType IN ('zip', 'rar', '7z') THEN 'Archive'
WHEN v.FileType = 'tmp' THEN 'Temporary'
WHEN v.FileType IN ('html', 'htm') THEN 'Web Document'
ELSE 'Other'
END AS FileCategory
FROM
DTreeCore t
LEFT JOIN (
SELECT d.*
FROM DVersData d
INNER JOIN LatestVersions lv
ON d.DocID = lv.DocID
AND d.Version = lv.LatestVersion
) v ON t.DataID = v.DocID
LEFT JOIN DTreeAncestors c ON c.DataID = t.DataID
WHERE
t.Deleted = 0
AND t.SubType IN (144,749)
AND c.AncestorID = 2000
AND v.VerType IS NULL
GROUP BY
CASE
WHEN v.FileType IN ('doc', 'docx', 'pdf', 'txt', 'rtf', 'odt') THEN 'Document'
WHEN v.FileType IN ('jpg', 'jpeg', 'png', 'gif', 'bmp', 'tiff') THEN 'Image'
WHEN v.FileType IN ('mp4', 'avi', 'mov', 'wmv', 'flv') THEN 'Video'
WHEN v.FileType IN ('msg', 'eml') THEN 'Email'
WHEN v.FileType IN ('xls', 'xlsx', 'csv') THEN 'Spreadsheet'
WHEN v.FileType IN ('ppt', 'pptx') THEN 'Presentation'
WHEN v.FileType IN ('zip', 'rar', '7z') THEN 'Archive'
WHEN v.FileType = 'tmp' THEN 'Temporary'
WHEN v.FileType IN ('html', 'htm') THEN 'Web Document'
ELSE 'Other'
END
ORDER BY
RecordsCount DESC
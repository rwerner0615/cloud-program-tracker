-- High-severity risks
SELECT i.initiative_id, i.name, i.status, r.severity, r.description, r.mitigation_plan
FROM initiatives i
JOIN risks r ON i.initiative_id = r.initiative_id
WHERE r.severity = 'High'
ORDER BY i.status;

-- Blocked initiatives and associated risks
SELECT i.initiative_id, i.name, i.target_date, r.severity, r.description
FROM initiatives i
LEFT JOIN risks r ON i.initiative_id = r.initiative_id
WHERE i.status = 'Blocked';

-- At Risk initiatives and their dependencies
SELECT i.initiative_id, i.name, i.status, d.to_initiative AS depends_on, d.dependency_type, d.notes
FROM initiatives i
LEFT JOIN dependencies d ON i.initiative_id = d.from_initiative
WHERE i.status = 'At Risk';

-- Dependency map (edge list)
SELECT from_initiative, to_initiative, dependency_type, notes
FROM dependencies
ORDER BY from_initiative, to_initiative;

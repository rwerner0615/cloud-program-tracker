DROP TABLE IF EXISTS initiatives;
DROP TABLE IF EXISTS risks;
DROP TABLE IF EXISTS dependencies;

CREATE TABLE initiatives (
  initiative_id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  owner TEXT NOT NULL,
  status TEXT CHECK(status IN ('On Track','At Risk','Blocked')) NOT NULL,
  target_date TEXT NOT NULL,
  workstream TEXT NOT NULL
);

CREATE TABLE risks (
  risk_id TEXT PRIMARY KEY,
  initiative_id TEXT NOT NULL,
  severity TEXT CHECK(severity IN ('Low','Medium','High')) NOT NULL,
  description TEXT NOT NULL,
  mitigation_plan TEXT NOT NULL,
  owner TEXT NOT NULL,
  FOREIGN KEY (initiative_id) REFERENCES initiatives(initiative_id)
);

CREATE TABLE dependencies (
  from_initiative TEXT NOT NULL,
  to_initiative TEXT NOT NULL,
  dependency_type TEXT NOT NULL,
  notes TEXT
);

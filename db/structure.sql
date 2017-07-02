CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "system_tester_features" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "system_tester_scenarios" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "system_tester_feature_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, CONSTRAINT "fk_rails_f876b759a3"
FOREIGN KEY ("system_tester_feature_id")
  REFERENCES "system_tester_features" ("id")
);
CREATE INDEX "index_system_tester_scenarios_on_system_tester_feature_id" ON "system_tester_scenarios" ("system_tester_feature_id");
CREATE TABLE IF NOT EXISTS "system_tester_steps" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "type" varchar, "arg_one" varchar, "arg_two" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "system_tester_scenario_steps" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "position" integer, "system_tester_step_id" integer, "system_tester_scenario_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, CONSTRAINT "fk_rails_94f9efb2fd"
FOREIGN KEY ("system_tester_step_id")
  REFERENCES "system_tester_steps" ("id")
, CONSTRAINT "fk_rails_6dd05e81f1"
FOREIGN KEY ("system_tester_scenario_id")
  REFERENCES "system_tester_scenarios" ("id")
);
CREATE INDEX "index_system_tester_scenario_steps_on_system_tester_step_id" ON "system_tester_scenario_steps" ("system_tester_step_id");
CREATE INDEX "index_st_st_scenario_id" ON "system_tester_scenario_steps" ("system_tester_scenario_id");
CREATE TABLE IF NOT EXISTS "examples" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "comment" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "system_tester_stair_steps" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "position" integer, "system_tester_step_id" integer, "system_tester_stair_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, CONSTRAINT "fk_rails_fd50573727"
FOREIGN KEY ("system_tester_step_id")
  REFERENCES "system_tester_steps" ("id")
, CONSTRAINT "fk_rails_1a354924f7"
FOREIGN KEY ("system_tester_stair_id")
  REFERENCES "system_tester_steps" ("id")
);
CREATE INDEX "index_system_tester_stair_steps_on_system_tester_step_id" ON "system_tester_stair_steps" ("system_tester_step_id");
CREATE INDEX "index_system_tester_stair_steps_on_system_tester_stair_id" ON "system_tester_stair_steps" ("system_tester_stair_id");
INSERT INTO "schema_migrations" (version) VALUES
('20170513131150'),
('20170513213953'),
('20170513214255'),
('20170513214722'),
('20170624013811'),
('20170629120850');



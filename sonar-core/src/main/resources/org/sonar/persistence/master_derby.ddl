-- Structure of version 2.11

-- This file has been generated manually :
--   1. start sonar with property sonar.useStructureDump=false
--   2. execute $DERBY_HOME/bin/dblook -d 'jdbc:derby://localhost:1527/sonar;user=sonar;password=sonar' -o /derby.ddl
--   3. copy the generated derby.ddl into this file

CREATE TABLE "QUALITY_MODELS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "NAME" VARCHAR(100))

CREATE TABLE "GROUPS_USERS" ("USER_ID" INTEGER, "GROUP_ID" INTEGER)

CREATE TABLE "CHARACTERISTIC_EDGES" ("CHILD_ID" INTEGER, "PARENT_ID" INTEGER)

CREATE TABLE "CRITERIA" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "FILTER_ID" INTEGER, "FAMILY" VARCHAR(100), "KEE" VARCHAR(100), "OPERATOR" VARCHAR(20), "VALUE" DECIMAL(30,20), "TEXT_VALUE" VARCHAR(256), "VARIATION" SMALLINT)

CREATE TABLE "DEPENDENCIES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "FROM_SNAPSHOT_ID" INTEGER, "FROM_RESOURCE_ID" INTEGER, "TO_SNAPSHOT_ID" INTEGER, "TO_RESOURCE_ID" INTEGER, "DEP_USAGE" VARCHAR(30), "DEP_WEIGHT" INTEGER, "PROJECT_SNAPSHOT_ID" INTEGER, "PARENT_DEPENDENCY_ID" BIGINT, "FROM_SCOPE" VARCHAR(3), "TO_SCOPE" VARCHAR(3))

CREATE TABLE "CHARACTERISTICS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "QUALITY_MODEL_ID" INTEGER, "KEE" VARCHAR(100), "NAME" VARCHAR(100), "RULE_ID" INTEGER, "DEPTH" INTEGER, "CHARACTERISTIC_ORDER" INTEGER, "DESCRIPTION" VARCHAR(4000), "ENABLED" SMALLINT)

CREATE TABLE "RULES_PARAMETERS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "RULE_ID" INTEGER NOT NULL, "NAME" VARCHAR(128) NOT NULL, "PARAM_TYPE" VARCHAR(512) NOT NULL, "DEFAULT_VALUE" VARCHAR(4000), "DESCRIPTION" VARCHAR(4000))

CREATE TABLE "RULES_PROFILES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "NAME" VARCHAR(100) NOT NULL, "DEFAULT_PROFILE" SMALLINT DEFAULT 0, "PROVIDED" SMALLINT NOT NULL DEFAULT 0, "LANGUAGE" VARCHAR(16), "PARENT_NAME" VARCHAR(100), "ENABLED" SMALLINT NOT NULL DEFAULT 1, "VERSION" INTEGER DEFAULT 1, "USED_PROFILE" SMALLINT DEFAULT 0)

CREATE TABLE "WIDGETS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "DASHBOARD_ID" INTEGER NOT NULL, "WIDGET_KEY" VARCHAR(256) NOT NULL, "NAME" VARCHAR(256), "DESCRIPTION" VARCHAR(1000), "COLUMN_INDEX" INTEGER, "ROW_INDEX" INTEGER, "CONFIGURED" SMALLINT, "CREATED_AT" TIMESTAMP, "UPDATED_AT" TIMESTAMP)

CREATE TABLE "FILTER_COLUMNS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "FILTER_ID" INTEGER, "FAMILY" VARCHAR(100), "KEE" VARCHAR(100), "SORT_DIRECTION" VARCHAR(5), "ORDER_INDEX" INTEGER, "VARIATION" SMALLINT)

CREATE TABLE "MEASURE_DATA" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "MEASURE_ID" INTEGER, "SNAPSHOT_ID" INTEGER, "DATA" BLOB(2147483647))

CREATE TABLE "GROUPS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "NAME" VARCHAR(40), "DESCRIPTION" VARCHAR(200), "CREATED_AT" TIMESTAMP, "UPDATED_AT" TIMESTAMP)

CREATE TABLE "ACTIVE_RULE_PARAM_CHANGES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "ACTIVE_RULE_CHANGE_ID" INTEGER NOT NULL, "RULES_PARAMETER_ID" INTEGER NOT NULL, "OLD_VALUE" VARCHAR(4000), "NEW_VALUE" VARCHAR(4000))

CREATE TABLE "SNAPSHOTS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "CREATED_AT" TIMESTAMP, "PROJECT_ID" INTEGER NOT NULL, "PARENT_SNAPSHOT_ID" INTEGER, "STATUS" VARCHAR(4) NOT NULL DEFAULT 'U', "ISLAST" SMALLINT NOT NULL DEFAULT 0, "SCOPE" VARCHAR(3), "QUALIFIER" VARCHAR(3), "ROOT_SNAPSHOT_ID" INTEGER, "VERSION" VARCHAR(60), "PATH" VARCHAR(96), "DEPTH" INTEGER, "ROOT_PROJECT_ID" INTEGER, "PERIOD1_MODE" VARCHAR(100), "PERIOD1_PARAM" VARCHAR(100), "PERIOD1_DATE" TIMESTAMP, "PERIOD2_MODE" VARCHAR(100), "PERIOD2_PARAM" VARCHAR(100), "PERIOD2_DATE" TIMESTAMP, "PERIOD3_MODE" VARCHAR(100), "PERIOD3_PARAM" VARCHAR(100), "PERIOD3_DATE" TIMESTAMP, "PERIOD4_MODE" VARCHAR(100), "PERIOD4_PARAM" VARCHAR(100), "PERIOD4_DATE" TIMESTAMP, "PERIOD5_MODE" VARCHAR(100), "PERIOD5_PARAM" VARCHAR(100), "PERIOD5_DATE" TIMESTAMP)

CREATE TABLE "SCHEMA_MIGRATIONS" ("VERSION" VARCHAR(256) NOT NULL)

CREATE TABLE "GROUP_ROLES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "GROUP_ID" INTEGER, "RESOURCE_ID" INTEGER, "ROLE" VARCHAR(64) NOT NULL)

CREATE TABLE "RULES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "PLUGIN_RULE_KEY" VARCHAR(200) NOT NULL, "PLUGIN_NAME" VARCHAR(255) NOT NULL, "DESCRIPTION" CLOB(2147483647), "PRIORITY" INTEGER, "ENABLED" SMALLINT, "CARDINALITY" VARCHAR(10), "PARENT_ID" INTEGER, "PLUGIN_CONFIG_KEY" VARCHAR(500), "NAME" VARCHAR(200))

CREATE TABLE "WIDGET_PROPERTIES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "WIDGET_ID" INTEGER NOT NULL, "KEE" VARCHAR(100), "TEXT_VALUE" VARCHAR(4000), "VALUE_TYPE" VARCHAR(20))

CREATE TABLE "EVENTS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "NAME" VARCHAR(50), "RESOURCE_ID" INTEGER, "SNAPSHOT_ID" INTEGER, "CATEGORY" VARCHAR(50), "EVENT_DATE" TIMESTAMP, "CREATED_AT" TIMESTAMP, "DESCRIPTION" VARCHAR(3072), "DATA" VARCHAR(4000))

CREATE TABLE "ALERTS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "PROFILE_ID" INTEGER, "METRIC_ID" INTEGER, "OPERATOR" VARCHAR(3), "VALUE_ERROR" VARCHAR(64), "VALUE_WARNING" VARCHAR(64))

CREATE TABLE "PROPERTIES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "PROP_KEY" VARCHAR(512), "RESOURCE_ID" INTEGER, "TEXT_VALUE" CLOB(2147483647), "USER_ID" INTEGER)

CREATE TABLE "PROJECT_LINKS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "PROJECT_ID" INTEGER NOT NULL, "LINK_TYPE" VARCHAR(20), "NAME" VARCHAR(128), "HREF" VARCHAR(2048) NOT NULL)

CREATE TABLE "DUPLICATIONS_INDEX" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "PROJECT_SNAPSHOT_ID" INTEGER NOT NULL, "SNAPSHOT_ID" INTEGER NOT NULL, "HASH" VARCHAR(50) NOT NULL, "INDEX_IN_FILE" INTEGER NOT NULL, "START_LINE" INTEGER NOT NULL, "END_LINE" INTEGER NOT NULL)

CREATE TABLE "REVIEW_COMMENTS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "CREATED_AT" TIMESTAMP, "UPDATED_AT" TIMESTAMP, "REVIEW_ID" INTEGER, "USER_ID" INTEGER, "REVIEW_TEXT" CLOB(2147483647))

CREATE TABLE "ACTIVE_RULE_CHANGES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "USER_NAME" VARCHAR(200) NOT NULL, "PROFILE_ID" INTEGER NOT NULL, "PROFILE_VERSION" INTEGER NOT NULL, "RULE_ID" INTEGER NOT NULL, "CHANGE_DATE" TIMESTAMP NOT NULL, "ENABLED" SMALLINT, "OLD_SEVERITY" INTEGER, "NEW_SEVERITY" INTEGER)

CREATE TABLE "PROJECT_MEASURES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "VALUE" DECIMAL(30,20), "METRIC_ID" INTEGER NOT NULL, "SNAPSHOT_ID" INTEGER, "RULE_ID" INTEGER, "RULES_CATEGORY_ID" INTEGER, "TEXT_VALUE" VARCHAR(96), "TENDENCY" INTEGER, "MEASURE_DATE" TIMESTAMP, "PROJECT_ID" INTEGER, "ALERT_STATUS" VARCHAR(5), "ALERT_TEXT" VARCHAR(4000), "URL" VARCHAR(2000), "DESCRIPTION" VARCHAR(4000), "RULE_PRIORITY" INTEGER, "CHARACTERISTIC_ID" INTEGER, "VARIATION_VALUE_1" DECIMAL(30,20), "VARIATION_VALUE_2" DECIMAL(30,20), "VARIATION_VALUE_3" DECIMAL(30,20), "VARIATION_VALUE_4" DECIMAL(30,20), "VARIATION_VALUE_5" DECIMAL(30,20))

CREATE TABLE "SNAPSHOT_SOURCES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "SNAPSHOT_ID" INTEGER NOT NULL, "DATA" CLOB(2147483647))

CREATE TABLE "PROJECTS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "NAME" VARCHAR(256), "DESCRIPTION" VARCHAR(2000), "ENABLED" SMALLINT NOT NULL DEFAULT 1, "SCOPE" VARCHAR(3), "QUALIFIER" VARCHAR(3), "KEE" VARCHAR(400), "ROOT_ID" INTEGER, "PROFILE_ID" INTEGER, "LANGUAGE" VARCHAR(5), "COPY_RESOURCE_ID" INTEGER, "LONG_NAME" VARCHAR(256))

CREATE TABLE "REVIEWS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "CREATED_AT" TIMESTAMP, "UPDATED_AT" TIMESTAMP, "USER_ID" INTEGER, "ASSIGNEE_ID" INTEGER, "TITLE" VARCHAR(500), "STATUS" VARCHAR(10), "SEVERITY" VARCHAR(10), "RULE_FAILURE_PERMANENT_ID" INTEGER, "PROJECT_ID" INTEGER, "RESOURCE_ID" INTEGER, "RESOURCE_LINE" INTEGER, "RESOLUTION" VARCHAR(200))

CREATE TABLE "RULES_CATEGORIES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "NAME" VARCHAR(255) NOT NULL, "DESCRIPTION" VARCHAR(1000) NOT NULL)

CREATE TABLE "ACTIVE_FILTERS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "FILTER_ID" INTEGER, "USER_ID" INTEGER, "ORDER_INDEX" INTEGER)

CREATE TABLE "MANUAL_MEASURES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "METRIC_ID" INTEGER NOT NULL, "RESOURCE_ID" INTEGER, "VALUE" DECIMAL(30,20), "TEXT_VALUE" VARCHAR(4000), "USER_LOGIN" VARCHAR(40), "DESCRIPTION" VARCHAR(4000), "CREATED_AT" TIMESTAMP, "UPDATED_AT" TIMESTAMP)

CREATE TABLE "ACTIVE_RULES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "PROFILE_ID" INTEGER NOT NULL, "RULE_ID" INTEGER NOT NULL, "FAILURE_LEVEL" INTEGER NOT NULL, "INHERITANCE" VARCHAR(10))

CREATE TABLE "NOTIFICATIONS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "CREATED_AT" TIMESTAMP, "DATA" BLOB(2147483647))

CREATE TABLE "USER_ROLES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "USER_ID" INTEGER, "RESOURCE_ID" INTEGER, "ROLE" VARCHAR(64) NOT NULL)

CREATE TABLE "ACTIVE_DASHBOARDS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "DASHBOARD_ID" INTEGER NOT NULL, "USER_ID" INTEGER, "ORDER_INDEX" INTEGER)

CREATE TABLE "ACTIVE_RULE_PARAMETERS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "ACTIVE_RULE_ID" INTEGER NOT NULL, "RULES_PARAMETER_ID" INTEGER NOT NULL, "VALUE" VARCHAR(4000))

CREATE TABLE "CHARACTERISTIC_PROPERTIES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "CHARACTERISTIC_ID" INTEGER, "KEE" VARCHAR(100), "VALUE" DECIMAL(30,20), "TEXT_VALUE" VARCHAR(4000))

CREATE TABLE "USERS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "LOGIN" VARCHAR(40), "NAME" VARCHAR(200), "EMAIL" VARCHAR(100), "CRYPTED_PASSWORD" VARCHAR(40), "SALT" VARCHAR(40), "CREATED_AT" TIMESTAMP, "UPDATED_AT" TIMESTAMP, "REMEMBER_TOKEN" VARCHAR(500), "REMEMBER_TOKEN_EXPIRES_AT" TIMESTAMP)

CREATE TABLE "FILTERS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "NAME" VARCHAR(100), "USER_ID" INTEGER, "SHARED" SMALLINT, "FAVOURITES" SMALLINT, "RESOURCE_ID" INTEGER, "DEFAULT_VIEW" VARCHAR(20), "PAGE_SIZE" INTEGER, "PERIOD_INDEX" INTEGER)

CREATE TABLE "DASHBOARDS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "USER_ID" INTEGER, "NAME" VARCHAR(256), "DESCRIPTION" VARCHAR(1000), "COLUMN_LAYOUT" VARCHAR(20), "SHARED" SMALLINT, "CREATED_AT" TIMESTAMP, "UPDATED_AT" TIMESTAMP)

CREATE TABLE "RULE_FAILURES" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "SNAPSHOT_ID" INTEGER NOT NULL, "RULE_ID" INTEGER NOT NULL, "FAILURE_LEVEL" INTEGER NOT NULL, "MESSAGE" VARCHAR(4000), "LINE" INTEGER, "COST" DECIMAL(30,20), "CREATED_AT" TIMESTAMP, "CHECKSUM" VARCHAR(1000), "PERMANENT_ID" INTEGER, "SWITCHED_OFF" SMALLINT)

CREATE TABLE "METRICS" ("ID" INTEGER NOT NULL GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1), "NAME" VARCHAR(64) NOT NULL, "DESCRIPTION" VARCHAR(255), "DIRECTION" INTEGER NOT NULL DEFAULT 0, "DOMAIN" VARCHAR(64), "SHORT_NAME" VARCHAR(64), "QUALITATIVE" SMALLINT NOT NULL DEFAULT 0, "VAL_TYPE" VARCHAR(8), "USER_MANAGED" SMALLINT DEFAULT 0, "ENABLED" SMALLINT DEFAULT 1, "ORIGIN" VARCHAR(3), "WORST_VALUE" DECIMAL(30,20), "BEST_VALUE" DECIMAL(30,20), "OPTIMIZED_BEST_VALUE" SMALLINT, "HIDDEN" SMALLINT)

-- ----------------------------------------------
-- DDL Statements for indexes
-- ----------------------------------------------

CREATE INDEX "GROUP_ROLES_RESOURCE" ON "GROUP_ROLES" ("RESOURCE_ID")

CREATE INDEX "GROUP_ROLES_GROUP" ON "GROUP_ROLES" ("GROUP_ID")

CREATE INDEX "USER_ROLES_RESOURCE" ON "USER_ROLES" ("RESOURCE_ID")

CREATE INDEX "USER_ROLES_USER" ON "USER_ROLES" ("USER_ID")

CREATE INDEX "DUPLICATIONS_INDEX_HASH" ON "DUPLICATIONS_INDEX" ("HASH")

CREATE INDEX "DUPLICATIONS_INDEX_SID" ON "DUPLICATIONS_INDEX" ("SNAPSHOT_ID")

CREATE INDEX "DUPLICATIONS_INDEX_PSID" ON "DUPLICATIONS_INDEX" ("PROJECT_SNAPSHOT_ID")

CREATE INDEX "SNAP_SOURCES_SNAPSHOT_ID" ON "SNAPSHOT_SOURCES" ("SNAPSHOT_ID")

CREATE INDEX "INDEX_GROUPS_USERS_ON_GROUP_ID" ON "GROUPS_USERS" ("GROUP_ID")

CREATE INDEX "INDEX_GROUPS_USERS_ON_USER_ID" ON "GROUPS_USERS" ("USER_ID")

CREATE INDEX "DEPS_TO_SID" ON "DEPENDENCIES" ("TO_SNAPSHOT_ID")

CREATE INDEX "DEPS_FROM_SID" ON "DEPENDENCIES" ("FROM_SNAPSHOT_ID")

CREATE INDEX "MEASURES_SID_METRIC" ON "PROJECT_MEASURES" ("SNAPSHOT_ID", "METRIC_ID")

CREATE INDEX "ACTIVE_RULE_CHANGES_PID" ON "ACTIVE_RULE_CHANGES" ("PROFILE_ID")

CREATE INDEX "CHARACTERISTIC_PROPERTIES_CID" ON "CHARACTERISTIC_PROPERTIES" ("CHARACTERISTIC_ID")

CREATE UNIQUE INDEX "METRICS_UNIQUE_NAME" ON "METRICS" ("NAME")

CREATE INDEX "ACTIVE_RULE_PARAM_CHANGES_CID" ON "ACTIVE_RULE_PARAM_CHANGES" ("ACTIVE_RULE_CHANGE_ID")

CREATE INDEX "M_DATA_SID" ON "MEASURE_DATA" ("SNAPSHOT_ID")

CREATE INDEX "MEASURE_DATA_MEASURE_ID" ON "MEASURE_DATA" ("MEASURE_ID")

CREATE INDEX "RF_PERMANENT_ID" ON "RULE_FAILURES" ("PERMANENT_ID")

CREATE INDEX "RULE_FAILURE_RULE_ID" ON "RULE_FAILURES" ("RULE_ID")

CREATE INDEX "RULE_FAILURE_SNAPSHOT_ID" ON "RULE_FAILURES" ("SNAPSHOT_ID")

CREATE INDEX "EVENTS_SNAPSHOT_ID" ON "EVENTS" ("SNAPSHOT_ID")

CREATE INDEX "EVENTS_RESOURCE_ID" ON "EVENTS" ("RESOURCE_ID")

CREATE INDEX "WIDGETS_WIDGETKEY" ON "WIDGETS" ("WIDGET_KEY")

CREATE INDEX "WIDGETS_DASHBOARDS" ON "WIDGETS" ("DASHBOARD_ID")

CREATE INDEX "SNAPSHOTS_QUALIFIER" ON "SNAPSHOTS" ("QUALIFIER")

CREATE INDEX "SNAPSHOTS_ROOT" ON "SNAPSHOTS" ("ROOT_SNAPSHOT_ID")

CREATE INDEX "SNAPSHOTS_PARENT" ON "SNAPSHOTS" ("PARENT_SNAPSHOT_ID")

CREATE INDEX "SNAPSHOT_PROJECT_ID" ON "SNAPSHOTS" ("PROJECT_ID")

CREATE INDEX "RULES_PARAMETERS_RULE_ID" ON "RULES_PARAMETERS" ("RULE_ID")

CREATE INDEX "ACTIVE_DASHBOARDS_DASHBOARDID" ON "ACTIVE_DASHBOARDS" ("DASHBOARD_ID")

CREATE INDEX "ACTIVE_DASHBOARDS_USERID" ON "ACTIVE_DASHBOARDS" ("USER_ID")

CREATE UNIQUE INDEX "UNIQUE_SCHEMA_MIGRATIONS" ON "SCHEMA_MIGRATIONS" ("VERSION")

CREATE INDEX "WIDGET_PROPERTIES_WIDGETS" ON "WIDGET_PROPERTIES" ("WIDGET_ID")

CREATE INDEX "PROPERTIES_KEY" ON "PROPERTIES" ("PROP_KEY")

CREATE INDEX "MANUAL_MEASURES_RESOURCE_ID" ON "MANUAL_MEASURES" ("RESOURCE_ID")

CREATE INDEX "PROJECTS_KEE" ON "PROJECTS" ("KEE")

-- ----------------------------------------------
-- DDL Statements for keys
-- ----------------------------------------------

-- primary/unique
ALTER TABLE "GROUP_ROLES" ADD CONSTRAINT "SQL110927104437910" PRIMARY KEY ("ID")

ALTER TABLE "REVIEWS" ADD CONSTRAINT "SQL110927104440700" PRIMARY KEY ("ID")

ALTER TABLE "RULES" ADD CONSTRAINT "SQL110927104437080" PRIMARY KEY ("ID")

ALTER TABLE "USER_ROLES" ADD CONSTRAINT "SQL110927104437940" PRIMARY KEY ("ID")

ALTER TABLE "DUPLICATIONS_INDEX" ADD CONSTRAINT "SQL110927104441080" PRIMARY KEY ("ID")

ALTER TABLE "SNAPSHOT_SOURCES" ADD CONSTRAINT "SQL110927104437590" PRIMARY KEY ("ID")

ALTER TABLE "NOTIFICATIONS" ADD CONSTRAINT "SQL110927104441030" PRIMARY KEY ("ID")

ALTER TABLE "RULES_CATEGORIES" ADD CONSTRAINT "SQL110927104437060" PRIMARY KEY ("ID")

ALTER TABLE "DEPENDENCIES" ADD CONSTRAINT "SQL110927104438330" PRIMARY KEY ("ID")

ALTER TABLE "PROJECT_MEASURES" ADD CONSTRAINT "SQL110927104437040" PRIMARY KEY ("ID")

ALTER TABLE "ACTIVE_RULE_CHANGES" ADD CONSTRAINT "SQL110927104440770" PRIMARY KEY ("ID")

ALTER TABLE "CHARACTERISTIC_PROPERTIES" ADD CONSTRAINT "SQL110927104439660" PRIMARY KEY ("ID")

ALTER TABLE "QUALITY_MODELS" ADD CONSTRAINT "SQL110927104439440" PRIMARY KEY ("ID")

ALTER TABLE "USERS" ADD CONSTRAINT "SQL110927104437310" PRIMARY KEY ("ID")

ALTER TABLE "CRITERIA" ADD CONSTRAINT "SQL110927104438720" PRIMARY KEY ("ID")

ALTER TABLE "METRICS" ADD CONSTRAINT "SQL110927104436990" PRIMARY KEY ("ID")

ALTER TABLE "ACTIVE_RULE_PARAM_CHANGES" ADD CONSTRAINT "SQL110927104440790" PRIMARY KEY ("ID")

ALTER TABLE "MEASURE_DATA" ADD CONSTRAINT "SQL110927104437810" PRIMARY KEY ("ID")

ALTER TABLE "RULE_FAILURES" ADD CONSTRAINT "SQL110927104437100" PRIMARY KEY ("ID")

ALTER TABLE "EVENTS" ADD CONSTRAINT "SQL110927104437690" PRIMARY KEY ("ID")

ALTER TABLE "WIDGETS" ADD CONSTRAINT "SQL110927104439750" PRIMARY KEY ("ID")

ALTER TABLE "SNAPSHOTS" ADD CONSTRAINT "SQL110927104436960" PRIMARY KEY ("ID")

ALTER TABLE "ACTIVE_RULES" ADD CONSTRAINT "SQL110927104437550" PRIMARY KEY ("ID")

ALTER TABLE "CHARACTERISTICS" ADD CONSTRAINT "SQL110927104439450" PRIMARY KEY ("ID")

ALTER TABLE "RULES_PARAMETERS" ADD CONSTRAINT "SQL110927104437130" PRIMARY KEY ("ID")

ALTER TABLE "ACTIVE_FILTERS" ADD CONSTRAINT "SQL110927104438740" PRIMARY KEY ("ID")

ALTER TABLE "ACTIVE_DASHBOARDS" ADD CONSTRAINT "SQL110927104439710" PRIMARY KEY ("ID")

ALTER TABLE "FILTER_COLUMNS" ADD CONSTRAINT "SQL110927104438710" PRIMARY KEY ("ID")

ALTER TABLE "REVIEW_COMMENTS" ADD CONSTRAINT "SQL110927104440710" PRIMARY KEY ("ID")

ALTER TABLE "WIDGET_PROPERTIES" ADD CONSTRAINT "SQL110927104439770" PRIMARY KEY ("ID")

ALTER TABLE "PROPERTIES" ADD CONSTRAINT "SQL110927104437750" PRIMARY KEY ("ID")

ALTER TABLE "DASHBOARDS" ADD CONSTRAINT "SQL110927104439740" PRIMARY KEY ("ID")

ALTER TABLE "GROUPS" ADD CONSTRAINT "SQL110927104437850" PRIMARY KEY ("ID")

ALTER TABLE "PROJECT_LINKS" ADD CONSTRAINT "SQL110927104437150" PRIMARY KEY ("ID")

ALTER TABLE "FILTERS" ADD CONSTRAINT "SQL110927104438690" PRIMARY KEY ("ID")

ALTER TABLE "MANUAL_MEASURES" ADD CONSTRAINT "SQL110927104440930" PRIMARY KEY ("ID")

ALTER TABLE "ALERTS" ADD CONSTRAINT "SQL110927104437730" PRIMARY KEY ("ID")

ALTER TABLE "PROJECTS" ADD CONSTRAINT "SQL110927104436930" PRIMARY KEY ("ID")

ALTER TABLE "RULES_PROFILES" ADD CONSTRAINT "SQL110927104437540" PRIMARY KEY ("ID")

ALTER TABLE "ACTIVE_RULE_PARAMETERS" ADD CONSTRAINT "SQL110927104437560" PRIMARY KEY ("ID")
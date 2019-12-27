--
-- Be carefull to requests order.
-- This file must be loaded by calling /install/index.php page
-- when current version is 12.0.0 or higher.
--
-- To restrict request to Mysql version x.y minimum use -- VMYSQLx.y
-- To restrict request to Pgsql version x.y minimum use -- VPGSQLx.y
-- To rename a table:       ALTER TABLE llx_table RENAME TO llx_table_new;
-- To add a column:         ALTER TABLE llx_table ADD COLUMN newcol varchar(60) NOT NULL DEFAULT '0' AFTER existingcol;
-- To rename a column:      ALTER TABLE llx_table CHANGE COLUMN oldname newname varchar(60);
-- To drop a column:        ALTER TABLE llx_table DROP COLUMN oldname;
-- To change type of field: ALTER TABLE llx_table MODIFY COLUMN name varchar(60);
-- To drop a foreign key:   ALTER TABLE llx_table DROP FOREIGN KEY fk_name;
-- To create a unique index ALTER TABLE llx_table ADD UNIQUE INDEX uk_table_field (field);
-- To drop an index:        -- VMYSQL4.1 DROP INDEX nomindex on llx_table
-- To drop an index:        -- VPGSQL8.2 DROP INDEX nomindex
-- To make pk to be auto increment (mysql):    -- VMYSQL4.3 ALTER TABLE llx_table CHANGE COLUMN rowid rowid INTEGER NOT NULL AUTO_INCREMENT;
-- To make pk to be auto increment (postgres):
-- -- VPGSQL8.2 CREATE SEQUENCE llx_table_rowid_seq OWNED BY llx_table.rowid;
-- -- VPGSQL8.2 ALTER TABLE llx_table ADD PRIMARY KEY (rowid);
-- -- VPGSQL8.2 ALTER TABLE llx_table ALTER COLUMN rowid SET DEFAULT nextval('llx_table_rowid_seq');
-- -- VPGSQL8.2 SELECT setval('llx_table_rowid_seq', MAX(rowid)) FROM llx_table;
-- To set a field as NULL:                     -- VMYSQL4.3 ALTER TABLE llx_table MODIFY COLUMN name varchar(60) NULL;
-- To set a field as NULL:                     -- VPGSQL8.2 ALTER TABLE llx_table ALTER COLUMN name DROP NOT NULL;
-- To set a field as NOT NULL:                 -- VMYSQL4.3 ALTER TABLE llx_table MODIFY COLUMN name varchar(60) NOT NULL;
-- To set a field as NOT NULL:                 -- VPGSQL8.2 ALTER TABLE llx_table ALTER COLUMN name SET NOT NULL;
-- To set a field as default NULL:             -- VPGSQL8.2 ALTER TABLE llx_table ALTER COLUMN name SET DEFAULT NULL;
-- Note: fields with type BLOB/TEXT can't have default value.


-- Missing in v11



-- For v12

ALTER TABLE llx_societe_rib ADD COLUMN stripe_account varchar(128);


create table llx_object_lang
(
  rowid          integer AUTO_INCREMENT PRIMARY KEY,
  fk_object      integer      DEFAULT 0 NOT NULL,
  type_object    varchar(32)  NOT NULL,					-- 'thirdparty', 'contact', '...'
  property       varchar(32)  NOT NULL,
  lang           varchar(5)   DEFAULT 0 NOT NULL,
  value          text,
  import_key varchar(14) DEFAULT NULL
)ENGINE=innodb;



ALTER TABLE llx_object_lang ADD UNIQUE INDEX uk_object_lang (fk_object, type_object, property, lang);

-- MySql deprecated types: FLOAT(M,D), DOUBLE(M,D)
ALTER TABLE llx_propal MODIFY total_ht numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propal MODIFY tva numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propal MODIFY localtax1 numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propal MODIFY localtax2 numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propal MODIFY total numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propal MODIFY multicurrency_tx numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propal MODIFY multicurrency_total_ht numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propal MODIFY multicurrency_total_tva numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propal MODIFY multicurrency_total_ttc numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propaldet MODIFY tva_tx numeric(6,3) DEFAULT 0;
ALTER TABLE llx_propaldet MODIFY localtax1_tx numeric(6,3) DEFAULT 0;
ALTER TABLE llx_propaldet MODIFY localtax2_tx numeric(6,3) DEFAULT 0;
ALTER TABLE llx_propaldet MODIFY subprice numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propaldet MODIFY total_ht numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propaldet MODIFY total_tva numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propaldet MODIFY total_localtax1 numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propaldet MODIFY total_localtax2 numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propaldet MODIFY total_ttc numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propaldet MODIFY buy_price_ht numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propaldet MODIFY multicurrency_subprice numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propaldet MODIFY multicurrency_total_ht numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propaldet MODIFY multicurrency_total_tva numeric(24,8) DEFAULT 0;
ALTER TABLE llx_propaldet MODIFY multicurrency_total_ttc numeric(24,8) DEFAULT 0;






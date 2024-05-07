-- Revert m_search:m_search_init from pg

BEGIN;

DROP INDEX IF EXISTS idx_file_path;
DROP INDEX IF EXISTS idx_tags;

DROP TABLE IF EXISTS multimedia_files;
DROP TABLE IF EXISTS search_metadata;


COMMIT;

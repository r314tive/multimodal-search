-- Deploy m_search:m_search_init to pg

BEGIN;

-- Основная таблица для хранения информации о мультимедийных файлах
CREATE TABLE IF NOT EXISTS multimedia_files (
    file_id SERIAL PRIMARY KEY,                    -- Уникальный идентификатор файла
    file_path TEXT NOT NULL UNIQUE,                -- Путь к файлу на диске
    file_type TEXT NOT NULL,                       -- Тип файла (изображение, видео, аудио)
    features BYTEA,                                -- Бинарные данные для признаков
    tags TEXT[],                                   -- Массив тегов
    description TEXT,                              -- Описание файла
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Дата добавления в базу
);

-- Индексы для ускорения поиска по полю file_path и массиву tags
CREATE INDEX IF NOT EXISTS idx_file_path ON multimedia_files (file_path);
CREATE INDEX IF NOT EXISTS idx_tags ON multimedia_files USING GIN (tags);


COMMIT;

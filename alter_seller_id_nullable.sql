-- Изменяем колонку seller_id в таблице orders, чтобы она могла быть NULL
ALTER TABLE orders ALTER COLUMN seller_id DROP NOT NULL;
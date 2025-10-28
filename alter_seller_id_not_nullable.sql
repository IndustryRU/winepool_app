-- Изменяем колонку seller_id в таблице orders, чтобы она была NOT NULL
ALTER TABLE orders ALTER COLUMN seller_id SET NOT NULL;
-- Добавляем колонку seller_id в таблицу orders
ALTER TABLE orders ADD COLUMN seller_id UUID REFERENCES profiles(id);

-- Добавляем индекс для улучшения производительности
CREATE INDEX idx_orders_seller_id ON orders (seller_id);

-- Добавляем комментарий к колонке
COMMENT ON COLUMN orders.seller_id IS 'ID продавца, связанного с заказом';
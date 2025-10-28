-- Удаляем старую функцию
DROP FUNCTION IF EXISTS create_order_from_cart(uuid, text, cart_item_with_seller[]);

-- Создаём новую функцию
CREATE OR REPLACE FUNCTION create_order_from_cart(
    p_user_id UUID,
    p_address TEXT,
    p_items cart_item_with_seller[],
    p_total NUMERIC
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
DECLARE
    seller_id_var UUID;
    order_id_var UUID;
    item RECORD; -- Используем RECORD, так как unnest возвращает набор записей
    order_total NUMERIC;
BEGIN
    -- Группируем товары по продавцам, исключая те, у которых seller_id NULL или пуст
    FOR seller_id_var IN
        SELECT DISTINCT i.seller_id
        FROM unnest(p_items) AS i
        WHERE i.seller_id IS NOT NULL -- Проверяем, что seller_id не NULL (предполагаем, что это UUID)
    LOOP
        -- Для каждого продавца считаем свою сумму
        order_total := (
            SELECT SUM(i.price * i.quantity)::NUMERIC
            FROM unnest(p_items) AS i
            WHERE i.seller_id = seller_id_var
        );

        -- Создаем отдельный заказ для каждого продавца
        INSERT INTO public.orders (user_id, total_price, total, delivery_address, seller_id, status)
        VALUES (p_user_id, order_total, order_total, p_address, seller_id_var, 'pending')
        RETURNING id INTO order_id_var;

        -- Добавляем товары в этот конкретный заказ
        FOR item IN
            SELECT * FROM unnest(p_items) AS i WHERE i.seller_id = seller_id_var
        LOOP
            INSERT INTO public.order_items (order_id, offer_id, quantity, price_at_purchase, price)
            VALUES (order_id_var, item.offer_id, item.quantity, item.price, item.price);
        END LOOP;
    END LOOP;
END;
$$;
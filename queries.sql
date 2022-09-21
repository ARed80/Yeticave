INSERT INTO categories (category_title, character_code)
VALUES 
    ('Доски и лыжи',    'boards'),
    ('Крепления',       'attachment'),
    ('Ботинки',         'boots'),
    ('Одежда',          'clothing'),
    ('Инструменты',     'tools'),
    ('Разное',          'other');

INSERT INTO users (email, user_name, user_pass, contact_info)
VALUES
    ('ar_test1@gmail.com', 'ar_test1', 'ar_pass1', '+7-999-000-00-11'),
    ('ar_test2@gmail.com', 'ar_test2', 'ar_pass2', '+7-999-000-00-22');

INSERT INTO lots (lot_title, lot_description, img_url, start_price, final_date, bet_step, user_id, category_id)
VALUES
    ('2014 Rossignol District Snowboard',                   'Текст рыба описание лота',     '/img/lot-1.jpg',   10999,    '2022-09-25',     300,  2,  1),        
    ('DC Ply Mens 2016/2017 Snowboard',                     'Текст рыба описание лота',     '/img/lot-2.jpg',   159999,   '2022-09-26',     500,  1,  1),
    ('Крепления Union Contact Pro 2015 года размер L/XL',   'Текст рыба описание лота',     '/img/lot-3.jpg',   8000,     '2022-09-27',     100,  2,  2),
    ('Ботинки для сноуборда DC Mutiny Charocal',            'Текст рыба описание лота',     '/img/lot-4.jpg',   10999,    '2022-09-18',     200,  1,  3),
    ('Куртка для сноуборда DC Mutiny Charocal',             'Текст рыба описание лота',     '/img/lot-5.jpg',   7500,     '2022-09-15',     100,  2,  4),
    ('Маска Oakley Canopy',                                 'Текст рыба описание лота',     '/img/lot-6.jpg',   5400,     '2022-09-26',     50,   2,  6);

UPDATE lots
SET winner_id = 1
WHERE id = 4;

UPDATE lots
SET winner_id = 2
WHERE id = 5;

INSERT INTO bets (bet_price, user_id, lot_id)
VALUES
    (8100, 1, 3),
    (5450, 1, 6);

/*    получить все категории;   */
SELECT * FROM categories;

/*    получить самые новые (к примеру 2 самых новых), открытые лоты. Каждый лот должен включать название, стартовую цену, ссылку на изображение, цену, название категории;    */
SELECT
    lot_title               AS Название_лота,
    start_price             AS Начальная_цена,
    img_url                 AS Ссылка_на_картинку,
    query_in.max_bet_price  AS Последняя_цена_лота,
    category_title          AS Название_категории,
    date_of_create          AS Дата_создания_лота
FROM lots
    LEFT JOIN 
        (SELECT lot_id, MAX(bet_price) AS max_bet_price
        FROM bets
        GROUP BY lot_id) query_in ON lots.id = query_in.lot_id
    JOIN categories ON lots.category_id = categories.id
WHERE final_date > CURRENT_TIMESTAMP
ORDER BY date_of_create DESC
LIMIT 2;

/*  показать последнюю цену лота    */
SELECT lot_id, MAX(bet_price) AS max_bet_price
FROM bets
GROUP BY lot_id;

/*    показать лот по его ID. Получите также название категории, к которой принадлежит лот;     */
SELECT    
    lots.date_of_create         AS Дата_создания_лота,
    lots.lot_title              AS Название_лота,
    lots.lot_description        AS Описание_лота,
    lots.img_url                AS Ссылка_на_картинку,
    lots.start_price            AS Начальная_цена,
    lots.final_date             AS Дата_закрытия_лота,
    lots.bet_step               AS Шаг_ставки,
    users.user_name             AS Создатель_лота,
    categories.category_title   AS Название_категории
FROM lots
    JOIN categories ON lots.category_id = categories.id
    JOIN users ON lots.user_id = users.id
WHERE lots.id = 1;

/*    обновить название лота по его идентификатору;     */
UPDATE lots
SET lot_title = '2014 Rossignol District Red Snowboard'
WHERE id = 1;

/*    получить список ставок для лота по его идентификатору с сортировкой по дате;      */
SELECT
    bets.id             AS id_ставки,
    bets.date_of_bet    AS Дата_ставки,
    bets.bet_price      AS Цена_ставки,
    users.user_name     AS Имя_поставившего    
FROM bets
    JOIN users ON bets.user_id = users.id
WHERE bets.lot_id = 3
ORDER BY bets.date_of_bet;

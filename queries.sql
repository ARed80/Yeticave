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

SELECT * FROM categories;

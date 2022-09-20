CREATE DATABASE yeticave
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;

USE yeticave;

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_title VARCHAR(50) NOT NULL,
    character_code VARCHAR(50) UNIQUE
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(50) NOT NULL UNIQUE,
    user_name VARCHAR(50),
    user_pass VARCHAR(256),
    contact_info VARCHAR(100) UNIQUE    
);

CREATE TABLE lots (
    id INT PRIMARY KEY AUTO_INCREMENT,    
    date_of_create DATETIME DEFAULT CURRENT_TIMESTAMP,
    lot_title VARCHAR(100) NOT NULL,
    description VARCHAR(300),
    img_link VARCHAR(100) UNIQUE,
    start_price DECIMAL(10,2),
    end_date DATETIME NOT NULL,
    bet_step INT,
    user_id INT,
    winner_id INT,
    category_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (winner_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE bets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_of_bet DATETIME DEFAULT CURRENT_TIMESTAMP,
    bet_price DECIMAL(10,2),
    user_id INT,
    lot_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (lot_id) REFERENCES lots(id)
);

\c findgarp_test

DROP TABLE IF EXISTS analysis;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  username VARCHAR(25) PRIMARY KEY,
  password TEXT NOT NULL,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  is_admin BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE analysis (
    username VARCHAR(25) REFERENCES users ON DELETE CASCADE,
    ticker VARCHAR(6) REFERENCES companies ON DELETE CASCADE,
    PRIMARY KEY (username, ticker),
    epsGrowthNext5Y TEXT,
    highPeNext5Y TEXT,
    lowPeNext5Y TEXT,
    comment TEXT
);

INSERT INTO users
  (username, password, first_name, last_name)
VALUES
('demo', '$2b$10$Pd85hn7TxSuwQxjOW1vOZOUHyvBZI7R1RFGDvS9rVqk1RThI5KDlK', 'Demosthenes', 'Pandionis');

INSERT INTO analysis
  (username, ticker, epsGrowthNext5Y, highPeNext5Y, lowPeNext5Y, comment)
VALUES
('demo', 'AMZN', 20, 60, 20, 'Notes about AMZN'),
('demo', 'XOM', 5, 20, 5, 'Notes about XOM'),
('demo', 'PG', 3, 30, 10, 'Notes about PG'),
('demo', 'V', 9, 45, 20, 'Notes about V'),
('demo', 'MSFT', 13, 40, 15, 'Notes about MSFT'),
('demo', 'INTC', 5, 12, 4, 'Notes about INTC'),
('demo', 'K', 2, 18, 10, 'Notes about K');

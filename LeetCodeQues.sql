create database leetCodeQues;
use leetCodeQues;
CREATE TABLE companies (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
INSERT INTO companies (id, name) VALUES
(1, 'Company A'),
(2, 'Company B'),
(3, 'Company C'),
(4, 'Company D'),
(5, 'Company E'),
(6, 'Company F'),
(7, 'Company G'),
(8, 'Company H'),
(9, 'Company I'),
(10, 'Company J');
CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY,
    revenue DECIMAL(10, 2) NOT NULL,
    expenses DECIMAL(10, 2) NOT NULL,
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES companies(id)
);
INSERT INTO campaigns (campaign_id, revenue, expenses, company_id) VALUES
(1, 5000.00, 3000.00, 1),
(2, 7000.50, 4000.75, 2),
(3, 4500.75, 2500.50, 1),
(4, 8000.25, 3500.00, 4),
(5, 6000.50, 2800.25, 5),
(6, 9000.75, 4200.00, 6),
(7, 5500.25, 3200.50, 3),
(8, 7500.00, 3800.75, 8),
(9, 4800.50, 2600.25, 4),
(10, 7200.25, 3400.50, 7);
select companies.* from companies inner join
(select company_id, count(company_id), sum(expenses) as totalExpenses, sum(revenue) as totalRevenue, (sum(revenue)-sum(expenses)) as profit 
from campaigns group by company_id order by profit desc limit 3) as temp on companies.id = temp.company_id;
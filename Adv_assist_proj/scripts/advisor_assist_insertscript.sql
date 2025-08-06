
--Insert Scripts for Agent Assist Schema

INSERT INTO PersonalDemographics (CustomerID, FirstName, LastName, DateOfBirth, Gender, MaritalStatus, EducationLevel, EmploymentStatus, AnnualIncome, GeographicLocation) VALUES
('C001', 'John', 'Doe', '1976-09-19', 'Male', 'Married', 'Graduate', 'Employed', 120000, 'USA'),
('C002', 'Ajay', 'Sharma', '1986-09-28', 'Male', 'Single', 'Postgraduate', 'Self-Employed', 95000, 'India'),
('C003', 'Maria', 'Fernandez', '1993-11-03', 'Female', 'Single', 'Graduate', 'Employed', 70000, 'India');

-- **************
-- Insert: clients
INSERT INTO clients (client_id, name, age, income, net_worth, risk_tolerance_score, segment, occupation, location, goals) VALUES
('C001', 'John', 45, 120000, 800000, 9, 'Mass Affluent', 'Professional', 'USA', '["Retirement"]'),
('C002', 'Ajay', 38, 95000, 600000, 6, 'Upper Middle Class', 'Consultant', 'India', '["Buy Second Home", "Tax Optimization"]'),
('C003', 'Maria', 32, 70000, 300000, 3, 'Young Professional', 'IT Employee', 'India', '["Buy House"]');

-- Insert: portfolios
INSERT INTO portfolios (portfolio_id, client_id, asset_class, ticker, holding_value, allocation_pct, expected_return_pct, volatility_score) VALUES
('P001', 'C001', 'Equity', 'EQTY_USA', 480000, 60.0, 9.0, 0.7),
('P002', 'C001', 'Bond', 'BOND_USA', 240000, 30.0, 4.0, 0.2),
('P003', 'C001', 'Crypto', 'BTC_ETH', 80000, 10.0, 12.0, 1.0),
('P004', 'C002', 'Equity', 'EQTY_IND', 400000, 60.0, 8.0, 0.6),
('P005', 'C002', 'Bond', 'BOND_IND', 200000, 30.0, 4.0, 0.2),
('P006', 'C002', 'Real_Estate', 'PROP_IND', 100000, 10.0, 6.0, 0.3),
('P007', 'C003', 'Fixed_Deposit', 'FD_IND', 200000, 66.7, 5.0, 0.1),
('P008', 'C003', 'Mutual_Fund', 'MF_LV_IND', 100000, 33.3, 6.0, 0.2);

-- Insert: risk_profiles
INSERT INTO risk_profiles (risk_level, min_score, max_score, recommended_allocation_equity, description) VALUES
('Conservative', 1, 4, 30.0, 'Low risk appetite. Prefers capital preservation and low volatility.'),
('Moderate', 5, 7, 50.0, 'Balanced risk. Comfortable with moderate market fluctuations.'),
('Aggressive', 8, 10, 70.0, 'High risk tolerance. Seeks high returns, accepts high volatility.');

-- Insert: goal_recommendations
--INSERT INTO goal_recommendations (segment, risk_level, recommended_goals, planning_horizon_years, goal_priority_order) VALUES
--('Mass Affluent', 'Aggressive', '["Retirement Planning", "Wealth Accumulation"]', 10, '["Retirement Planning"]'),
--('Upper Middle Class', 'Moderate', '["Second Home", "Tax Efficiency"]', 7, '["Second Home", "Tax Efficiency"]'),
--('Young Professional', 'Conservative', '["Home Purchase", "Emergency Fund"]', 5, '["Home Purchase"]');

INSERT INTO goal_recommendations (segment, risk_level, recommended_goals, planning_horizon_years, goal_priority_order) VALUES
('Young Professional', 'Conservative', '["Home Purchase", "Emergency Fund"]', 5, '["Home Purchase"]'),
('Young Professional', 'Moderate', '["Home Purchase", "Retirement Planning", "Education Fund"]', 8, '["Home Purchase", "Retirement Planning"]'),
('Young Professional', 'Aggressive', '["Wealth Accumulation", "Early Retirement", "Startup Investment"]', 12, '["Early Retirement", "Wealth Accumulation"]'),
('Upper Middle Class', 'Conservative', '["Debt Repayment", "Emergency Fund", "Retirement Planning"]', 6, '["Retirement Planning", "Debt Repayment"]'),
('Upper Middle Class', 'Moderate', '["Second Home", "Tax Efficiency"]', 7, '["Second Home", "Tax Efficiency"]'),
('Upper Middle Class', 'Aggressive', '["Portfolio Expansion", "Global Investments", "Early Retirement"]', 10, '["Early Retirement", "Portfolio Expansion"]'),
('Mass Affluent', 'Conservative', '["Capital Preservation", "Estate Planning", "Philanthropy"]', 8, '["Estate Planning", "Capital Preservation"]'),
('Mass Affluent', 'Moderate', '["Portfolio Diversification", "Wealth Preservation", "Retirement Planning"]', 10, '["Portfolio Diversification", "Retirement Planning"]'),
('Mass Affluent', 'Aggressive', '["Retirement Planning", "Wealth Accumulation"]', 10, '["Retirement Planning"]');



-- Insert: portfolio_analysis_summary
INSERT INTO portfolio_analysis_summary (client_id, diversification_score, risk_adjusted_return, underexposed_assets, overexposed_risks, recommendation_summary) VALUES
('C001', 0.9, 1.3, '["Commodities"]', '["Crypto"]', 'Well diversified but slightly high exposure to crypto. Maintain current allocation with regular rebalancing.'),
('C002', 0.75, 1.0, '["Cash"]', '["Equity"]', 'Good balance, consider reducing equity exposure and exploring debt for tax efficiency.'),
('C003', 0.5, 0.8, '["Equity"]', '["Fixed Income"]', 'Very conservative. Suggest adding small exposure to equity or hybrid funds.');

-- *********************

-- Insert: FinancialTransactionDataView
INSERT INTO FinancialTransactionDataView (TransactionID, client_id, TransactionDate, TransactionType, Amount, TransactionCategory, PaymentMethod, MerchantDetails) VALUES
(101, 'C002', '2024-06-17', 'Sold', 18417.82, 'Equity', 'Bank Transfer', 'Zerodha'),
(102, 'C003', '2024-06-17', 'Buy', 7897.54, 'Crypto', 'Bank Transfer', 'Coinbase'),
(103, 'C003', '2024-06-26', 'Buy', 10575.37, 'Real Estate', 'Mobile Wallet', 'Housing.com'),
(104, 'C001', '2024-06-19', 'Buy', 12343.5, 'Bond', 'Credit Card', 'HDFC Securities'),
(105, 'C002', '2024-06-25', 'Buy', 3121.03, 'Bond', 'Bank Transfer', 'HDFC Securities'),
(106, 'C003', '2024-06-28', 'Sold', 10146.35, 'Bond', 'UPI', 'HDFC Securities'),
(107, 'C001', '2024-06-18', 'Buy', 6052.81, 'Mutual_Fund', 'UPI', 'Groww'),
(108, 'C003', '2024-06-02', 'Buy', 14423.53, 'Fixed_Deposit', 'Mobile Wallet', 'ICICI Bank'),
(109, 'C001', '2024-06-19', 'Buy', 15949.91, 'Mutual_Fund', 'Mobile Wallet', 'Groww'),
(110, 'C002', '2024-06-03', 'Buy', 10060.98, 'Fixed_Deposit', 'Mobile Wallet', 'ICICI Bank'),
(111, 'C003', '2024-06-10', 'Buy', 2089.84, 'Fixed_Deposit', 'Mobile Wallet', 'ICICI Bank'),
(112, 'C001', '2024-06-24', 'Buy', 17519.98, 'Bond', 'UPI', 'HDFC Securities'),
(113, 'C002', '2024-06-05', 'Sold', 16794.89, 'Fixed_Deposit', 'Mobile Wallet', 'ICICI Bank'),
(114, 'C002', '2024-06-20', 'Sold', 15930.5, 'Real_Estate', 'Bank Transfer', 'Housing.com'),
(115, 'C002', '2024-06-06', 'Buy', 11719.79, 'Bond', 'Mobile Wallet', 'HDFC Securities');

-- Insert: ProductAndServiceUsage
INSERT INTO ProductAndServiceUsage (UsageID, client_id, ProductName, ServiceUsed, UsageDate, UsageFrequency, Channel, FeedbackOrRating) VALUES
(201, 'C001', 'Equity', 'Mobile Trading App', '2024-05-10', 'Monthly', 'Mobile', 8),
(202, 'C001', 'Bond', 'Portfolio Management', '2024-05-15', 'Quarterly', 'Web', 9),
(203, 'C001', 'Crypto', 'Digital Wallet', '2024-05-18', 'Weekly', 'Mobile', 7),
(204, 'C002', 'Equity', 'Stock Advisory', '2024-05-12', 'Monthly', 'Phone', 8),
(205, 'C002', 'Bond', 'Tax Planning', '2024-05-20', 'Yearly', 'Web', 7),
(206, 'C002', 'Real_Estate', 'Loan Consultation', '2024-05-25', 'Once', 'In-Person', 6),
(207, 'C003', 'Fixed_Deposit', 'Online Deposit Renewal', '2024-05-05', 'Yearly', 'Web', 10),
(208, 'C003', 'Mutual_Fund', 'NAV Alerts', '2024-05-08', 'Monthly', 'Mobile', 9);




CREATE TABLE clients (
    client_id VARCHAR(50) PRIMARY KEY,
    name TEXT,
    age INT,
    income FLOAT,
    net_worth FLOAT,
    risk_tolerance_score INT,
    segment TEXT,
    occupation TEXT,
    location TEXT,
    goals TEXT[]
);

CREATE TABLE portfolios (
    portfolio_id VARCHAR(50) PRIMARY KEY,
    client_id VARCHAR(50),
    asset_class TEXT,
    ticker TEXT,
    holding_value FLOAT,
    allocation_pct FLOAT,
    expected_return_pct FLOAT,
    volatility_score FLOAT,
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

CREATE TABLE risk_profiles (
    risk_level TEXT PRIMARY KEY,
    min_score INT,
    max_score INT,
    recommended_allocation_equity FLOAT,
    description TEXT
);

CREATE TABLE goal_recommendations (
    segment TEXT,
    risk_level TEXT,
    recommended_goals TEXT[],
    planning_horizon_years INT,
    goal_priority_order TEXT[]
);

CREATE TABLE portfolio_analysis_summary (
    client_id VARCHAR(50),
    diversification_score FLOAT,
    risk_adjusted_return FLOAT,
    underexposed_assets TEXT[],
    overexposed_risks TEXT[],
    recommendation_summary TEXT,
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

INSERT INTO clients (client_id, name, age, income, net_worth, risk_tolerance_score, segment, occupation, location, goals) VALUES
('C001', 'John', 45, 120000, 800000, 9, 'Mass Affluent', 'Professional', 'USA', ARRAY['Retirement']),
('C002', 'Ajay', 38, 95000, 600000, 6, 'Upper Middle Class', 'Consultant', 'India', ARRAY['Buy Second Home', 'Tax Optimization']),
('C003', 'Maria', 32, 70000, 300000, 3, 'Young Professional', 'IT Employee', 'India', ARRAY['Buy House']);

INSERT INTO portfolios (portfolio_id, client_id, asset_class, ticker, holding_value, allocation_pct, expected_return_pct, volatility_score) VALUES
('P001', 'C001', 'Equity', 'EQTY_USA', 480000, 60.0, 9.0, 0.7),
('P002', 'C001', 'Bond', 'BOND_USA', 240000, 30.0, 4.0, 0.2),
('P003', 'C001', 'Crypto', 'BTC_ETH', 80000, 10.0, 12.0, 1.0),
('P004', 'C002', 'Equity', 'EQTY_IND', 400000, 60.0, 8.0, 0.6),
('P005', 'C002', 'Bond', 'BOND_IND', 200000, 30.0, 4.0, 0.2),
('P006', 'C002', 'Real Estate', 'PROP_IND', 100000, 10.0, 6.0, 0.3),
('P007', 'C003', 'Fixed Deposit', 'FD_IND', 200000, 66.7, 5.0, 0.1),
('P008', 'C003', 'Mutual Fund', 'MF_LV_IND', 100000, 33.3, 6.0, 0.2);

INSERT INTO risk_profiles (risk_level, min_score, max_score, recommended_allocation_equity, description) VALUES
('Conservative', 1, 4, 30.0, 'Low risk appetite. Prefers capital preservation and low volatility.'),
('Moderate', 5, 7, 50.0, 'Balanced risk. Comfortable with moderate market fluctuations.'),
('Aggressive', 8, 10, 70.0, 'High risk tolerance. Seeks high returns, accepts high volatility.');

INSERT INTO goal_recommendations (segment, risk_level, recommended_goals, planning_horizon_years, goal_priority_order) VALUES
('Mass Affluent', 'Aggressive', ARRAY['Retirement Planning', 'Wealth Accumulation'], 10, ARRAY['Retirement Planning']),
('Upper Middle Class', 'Moderate', ARRAY['Second Home', 'Tax Efficiency'], 7, ARRAY['Second Home', 'Tax Efficiency']),
('Young Professional', 'Conservative', ARRAY['Home Purchase', 'Emergency Fund'], 5, ARRAY['Home Purchase']);

INSERT INTO portfolio_analysis_summary (client_id, diversification_score, risk_adjusted_return, underexposed_assets, overexposed_risks, recommendation_summary) VALUES
('C001', 0.9, 1.3, ARRAY['Commodities'], ARRAY['Crypto'], 'Well diversified but slightly high exposure to crypto. Maintain current allocation with regular rebalancing.'),
('C002', 0.75, 1.0, ARRAY['Cash'], ARRAY['Equity'], 'Good balance, consider reducing equity exposure and exploring debt for tax efficiency.'),
('C003', 0.5, 0.8, ARRAY['Equity'], ARRAY['Fixed Income'], 'Very conservative. Suggest adding small exposure to equity or hybrid funds.');

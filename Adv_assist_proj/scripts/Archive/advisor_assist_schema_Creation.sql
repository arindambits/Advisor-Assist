--CREATE TABLE scripts for Advisor Assist Schema;

-- Table: PersonalDemographics
drop table if exists PersonalDemographics;
CREATE TABLE PersonalDemographics (
    CustomerID TEXT PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    DateOfBirth DATE,
    Gender TEXT,
    MaritalStatus TEXT,
    EducationLevel TEXT,
    EmploymentStatus TEXT,
    AnnualIncome REAL,
    GeographicLocation TEXT    
);

-- Table: clients
DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
    client_id TEXT PRIMARY KEY,
    name TEXT,
    age INTEGER,
    income REAL,
    net_worth REAL,
    risk_tolerance_score INTEGER,
    segment TEXT,
    occupation TEXT,
    location TEXT,
    goals TEXT, -- JSON-style string
    FOREIGN KEY (client_id) REFERENCES PersonalDemographics (CustomerID)

);

-- Table: portfolios
DROP TABLE IF EXISTS portfolios;
CREATE TABLE portfolios (
    portfolio_id TEXT PRIMARY KEY,
    client_id TEXT,
    asset_class TEXT,
    ticker TEXT,
    holding_value REAL,
    allocation_pct REAL,
    expected_return_pct REAL,
    volatility_score REAL,
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- Table: risk_profiles
DROP TABLE IF EXISTS risk_profiles;
CREATE TABLE risk_profiles (
    risk_level TEXT PRIMARY KEY,
    min_score INTEGER,
    max_score INTEGER,
    recommended_allocation_equity REAL,
    description TEXT
);

-- Table: goal_recommendations
DROP TABLE IF EXISTS goal_recommendations;
CREATE TABLE goal_recommendations (
    segment TEXT,
    risk_level TEXT,
    recommended_goals TEXT, -- JSON-style string
    planning_horizon_years INTEGER,
    goal_priority_order TEXT -- JSON-style string
);

-- Table: portfolio_analysis_summary
DROP TABLE IF EXISTS portfolio_analysis_summary;
CREATE TABLE portfolio_analysis_summary (
    client_id TEXT,
    diversification_score REAL,
    risk_adjusted_return REAL,
    underexposed_assets TEXT, -- JSON-style string
    overexposed_risks TEXT, -- JSON-style string
    recommendation_summary TEXT,
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);


-- Table: FinancialTransactionDataView
DROP TABLE IF EXISTS FinancialTransactionDataView;
CREATE TABLE FinancialTransactionDataView (
    TransactionID INT PRIMARY KEY,
    client_id TEXT,
    TransactionDate DATE,
    TransactionType TEXT,
    Amount REAL,
    TransactionCategory TEXT,
    PaymentMethod TEXT,
    MerchantDetails TEXT,
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- Table: ProductAndServiceUsage
DROP TABLE IF EXISTS ProductAndServiceUsage;
CREATE TABLE ProductAndServiceUsage (
    UsageID INT PRIMARY KEY,
    client_id TEXT,
    ProductName TEXT,
    ServiceUsed TEXT,
    UsageDate DATE,
    UsageFrequency TEXT,
    Channel TEXT,
    FeedbackOrRating INT,
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);
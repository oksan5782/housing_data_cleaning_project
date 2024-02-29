-- Separate the city name from the rest of the property address by comma
SELECT 
    SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) AS Address, -- Address before city
    SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress)) AS City -- City 
FROM housing_data_cleaning.dbo.Nashville_Housing;

-- Update table with new records
ALTER TABLE Nashville_Housing
ADD PropertySplitAddress NVARCHAR(255);

UPDATE Nashville_Housing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1);


ALTER TABLE Nashville_Housing
ADD PropertyCity NVARCHAR(255);

UPDATE Nashville_Housing
SET PropertyCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress));

-- Check update results
SELECT TOP 10 *
FROM housing_data_cleaning.dbo.Nashville_Housing;
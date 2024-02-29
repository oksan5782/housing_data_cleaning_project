-- Separate city name and state from the rest of the OwnerAddress column by comma
SELECT OwnerAddress
FROM housing_data_cleaning.dbo.Nashville_Housing;

-- Extract adress, city and state from the OwnerAddress
SELECT
    PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3),
    PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2),
    PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
FROM housing_data_cleaning.dbo.Nashville_Housing;

-- Update table with new records
ALTER TABLE Nashville_Housing
ADD OwnerSplitAddress NVARCHAR(255);

ALTER TABLE Nashville_Housing
ADD OwnerCity NVARCHAR(255);

ALTER TABLE Nashville_Housing
ADD OwnerState NVARCHAR(255);

UPDATE Nashville_Housing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3);

UPDATE Nashville_Housing
SET OwnerCity = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2);

UPDATE Nashville_Housing
SET OwnerState = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1);

-- Check update results
SELECT TOP 100 *
FROM housing_data_cleaning.dbo.Nashville_Housing;
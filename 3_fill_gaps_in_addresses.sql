-- Update property address data 
SELECT COUNT(*)
FROM housing_data_cleaning.dbo.Nashville_Housing
WHERE PropertyAddress IS NULL; -- 29 lines to update

-- Select missing address values in case of matching ParcelID and different UniqueID as a temp column
SELECT h1.ParcelID, h1.PropertyAddress, h2.ParcelID, h2.PropertyAddress, 
    ISNULL(h1.PropertyAddress, h2.PropertyAddress) AS TempPlaceholder
FROM housing_data_cleaning.dbo.Nashville_Housing h1
JOIN housing_data_cleaning.dbo.Nashville_Housing h2
    ON h1.ParcelID = h2.ParcelID
    AND h1.UniqueID != h2.UniqueID
WHERE h1.PropertyAddress IS NULL;


-- Set PropertyAddress to that of another record if having the same ParcelID and different UniqueID
UPDATE h1
SET PropertyAddress = ISNULL(h1.PropertyAddress, h2.PropertyAddress)
FROM housing_data_cleaning.dbo.Nashville_Housing h1
JOIN housing_data_cleaning.dbo.Nashville_Housing h2
    ON h1.ParcelID = h2.ParcelID
    AND h1.UniqueID != h2.UniqueID
WHERE h1.PropertyAddress IS NULL;
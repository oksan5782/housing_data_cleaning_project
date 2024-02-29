-- Remove redundant columns
ALTER TABLE Nashville_Housing
DROP COLUMN PropertyAddress, OwnerAddress;

-- Check the results
SELECT TOP 10 * 
FROM housing_data_cleaning.dbo.Nashville_Housing;

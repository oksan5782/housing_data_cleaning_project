-- Remove duplicates using CTE and window functions 

-- Mark duplicates using repetitive but distinctive parameters
SELECT *, 
    ROW_NUMBER() OVER(
        PARTITION BY ParcelID,
                     PropertyAddress,
                     SalePrice,
                     SaleDate,
                     LegalReference
                     ORDER BY UniqueID
                )  row_number 
FROM housing_data_cleaning.dbo.Nashville_Housing
ORDER BY PropertyAddress;

-- Select all duplicates
WITH RowNumberCTE AS (
SELECT *, 
    ROW_NUMBER() OVER(
        PARTITION BY ParcelID,
                     PropertyAddress,
                     SalePrice,
                     SaleDate,
                     LegalReference
                     ORDER BY UniqueID
                )  row_number 
FROM housing_data_cleaning.dbo.Nashville_Housing 
)
SELECT * FROM RowNumberCTE
WHERE row_number > 1
ORDER BY PropertyAddress;

-- Delete duplicates
WITH RowNumberCTE AS (
SELECT *, 
    ROW_NUMBER() OVER(
        PARTITION BY ParcelID,
                     PropertyAddress,
                     SalePrice,
                     SaleDate,
                     LegalReference
                     ORDER BY UniqueID
                )  row_number 
FROM housing_data_cleaning.dbo.Nashville_Housing 
)
DELETE FROM RowNumberCTE
WHERE row_number > 1;
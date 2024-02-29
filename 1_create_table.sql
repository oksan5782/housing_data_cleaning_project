DROP TABLE IF EXISTS Nashville_Housing;

CREATE TABLE Nashville_Housing (
    UniqueID INT,
    ParcelID NVARCHAR(255),
    LandUse NVARCHAR(255),
    PropertyAddress NVARCHAR(255),
    SaleDate DATE, 
    SalePrice NVARCHAR(255),
    LegalReference NVARCHAR(255),
    SoldAsVacant NVARCHAR(255),
    OwnerName NVARCHAR(255),
    OwnerAddress NVARCHAR(255),
    Acreage NVARCHAR(255),
    TaxDistrict NVARCHAR(255),
    LandValue INT, -- NVARCHAR(255),
    BuildingValue INT, 
    TotalValue INT, 
    YearBuilt INT,
    Bedrooms INT,
    FullBath INT, 
    HalfBath INT
);


BULK INSERT Nashville_Housing
FROM '/var/opt/mssql/data/NashvilleHousingData.csv'
WITH (
    FIELDTERMINATOR = ';',  -- Specify the field terminator
    ROWTERMINATOR = '\n',   -- Specify the row terminator
    FIRSTROW = 2,           -- Skip the header row if necessary
    FIELDQUOTE = ''
);


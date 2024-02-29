-- Unify records in SoldAsVacant column

-- Find out which formatting style is more common in the table
SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant) AS Count
FROM housing_data_cleaning.dbo.Nashville_Housing
GROUP BY SoldAsVacant
ORDER BY Count DESC;

-- Preview change
SELECT SoldAsVacant,
    CASE WHEN SoldAsVacant = 'N' THEN 'No'
         WHEN SoldAsVacant = 'Y' THEN 'Yes'
         ELSE SoldAsVacant
    END AS UnifiedSoldAsVacant
FROM housing_data_cleaning.dbo.Nashville_Housing;

-- Update the column 
UPDATE Nashville_Housing
    SET SoldAsVacant = 
    CASE WHEN SoldAsVacant = 'N' THEN 'No'
         WHEN SoldAsVacant = 'Y' THEN 'Yes'
         ELSE SoldAsVacant
    END;
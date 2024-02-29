# housing_data_cleaning_project

SQL Data Cleaning Project: A project focused on cleaning and reorganizing Nashville housing data records using SQL queries. Implements various data cleaning techniques such as filling gaps, removing duplicates and standardizing formats. Utilizes Docker for easy setup and includes T-SQL commands for data manipulation.

## Project Description

The project uses data from the CSV file added to the repository. The dataset contains sample housing data records with 19-22 columns. The main objectives of the project are to clean and reorganize the data to ensure consistency and accuracy.

Some of the queries implemented in the project include:

  - Separating the city name from the rest of the property address by comma.
  - Filling null values with appropriate content.
  - Unifying diverse records into a reduced number of options.
  - Splitting columns into 2-3 different records using substrings and replacements.

## Running the Docker Container

To run the SQL Server Docker container with the necessary configurations for this project, follow these steps:

1. Make sure you have Docker installed on your system. If not, refer to the [official Docker documentation](https://docs.docker.com/get-docker/) for installation instructions.

2. Run the following command in your terminal to start the Docker container:
   ```bash
   docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=<strong_pw>" \
   -p 1433:1433 --name sql-data-cleaning-project\
   -v /volume_filepath:/var/opt/mssql/data \
   -d \
   mcr.microsoft.com/mssql/server:2022-latest

  - Replace <strong_pw> with a strong password for the SQL Server SA account.
  - Replace /volume_filepath with the filepath on your host machine where you want to persist SQL Server data.

    Once the container is running, you can connect to the SQL Server instance using your preferred database management tool.

## T-SQL Commands

The project utilizes T-SQL commands to perform various data cleaning tasks on the sample housing dataset. These commands include a range of functionalities, including separating city names from property addresses, filling null values with appropriate content, unifying diverse records, and splitting columns into multiple records using substrings and replacements. 

The SQL scripts provided in this repository implement these commands to ensure the data is cleaned and organized effectively.

For any questions or issues, please don't hesitate to open an issue in this repository.


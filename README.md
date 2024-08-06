# DataSpark

 The four datasets customers, sales, products and exchange rates are imported using necessary functions.
The missing values are checked for each data and the variable delivery date is dropped since it has many missing values.
The datatypes were checked and additional columns were created by converting into suitable datatype.
The age column was created by converting birthdate column, Opened month was created by converting the date format variable into suitable column.
The datasets were merged using a common variable between them. Such as product key to merge sales and products dataset, Customer key to merge customer and sales dataset etc...
 The preprocessed data is imported into SQL as a database.
The relevant tables for each data source was created and using SQL INSERT statements the data is loaded into it.
10 SQL queries were written to extract key insights from the merged and preprocessed data.
 In order to create interactive dashboards, SQl is connected with poweerbi, and the datasets are imported.
Different charts are displayed to get insights.

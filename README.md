** 
********#RATAIL-INVENTORY-MANAGEMENT-DB-DESIGN**`
  
  The primary objective of this design is to create a structured and relational data model that efficiently manages the stock inventory information (stock in and stock out). The products are grouped into different categories, prices, and the supplier that handles each product more like distribution. This database supports various business operations, including employee management, departmental analysis, and project oversight while enabling robust data retrieval and reporting functionalities. The design ensures data integrity, reduces redundancy, and allows for seamless data aggregation and analysis, which is essential for informed decision-making within a retail company.

  **Summary of Reporting Queries**;
  The project includes a series of SQL queries and stored procedures that cater to specific data analysis and reporting needs for stock and delivery intake:

**Price of product Analysis**:
  Fetches the products with the same price, providing insights into potential prices from its category for standardization. Retrieves the second-highest price within its category to assist in clearer inventory.

**Price of the product explanation**:
  This fetches the maximum price of the product within each category, allowing the retailer to understand distribution using the category.

**Supplier Workforce Distribution**:
  Provides a count of products managed by each supplier, sorted by the number of suppliers, which helps in proper accountability and supplier performance assessment.

**Products Data Formatting**:
  Retrieve and format product names and prices to streamline reporting, making it easier to take stork intake and clarity

**Row-Based Data Retrieval**:
  fetches only the odd-numbered rows, resulting to data filtering capabilities that can be useful for sampling or segmented reporting.
Product Price Reporting:
choosing the price of products that is greater than a stipulated price, which is important to help in knowing whether to increase the price or not in an organization.

**Product Price Increment Automation**:
  Create a stored procedure to adjust the product price for the electronics category under specific suppliers, streamlining organizational procedures and ensuring consistent product price updates.

**Accurate Product Reporting**:
  A stored procedure that fetches and organizes the data of a product, along with their category, supplier, and warehouse location, including error handling which helps in data retrieval.


**IMPACT ON BUSINESS PROCESSES**;
  
The database design and its associated queries have a significant impact on various organizations:

•  	  **Maximize Inventory management**: The database design gives room for efficient tracking and management of products at the inventory level by reducing the risk of product intake and excess inventory problems.

•	   ** Accurate data decision making**: this design gives an edge on how detailed data on product price increment, suppliers' strategy and management, and most especially the importance of the product. This query supports the strength and the company's ability to adapt to market trends and address customer needs.

•	    **Enhanced Operational Efficiency**: Essential tasks are automated, such as price increment update and detailed data retrieval, operational refining, and manual effort minimizing. This increases efficiency and enables decision-making faster and more effective utilization of the company’s resources.

•    	**Supplier Management**: The ability for precise monitoring of supplier contributions, allowing the company to negotiate improved terms and conditions, diversify its supply chain and route, and maintain a consistent product flow.

•	    **Strategic Marketing and Sales**: By pinpointing high-value products and analyzing prices of the product trends, the company can create more targeted marketing campaigns that help in boosting sales at the time enhancing customer needs and satisfaction.


the tools used are:

SQL, Data Insertion and Management, stored Procedures, Views, and Error Handling. 

--Table : WDICountry_tbl

create table WDICountry_tbl (
Country_Code 				varchar2(3),
Short_Name 					varchar2(20),
Table_Name 					varchar2(20),
Long_Name   				varchar2(20),
2-alpha_code 				varchar2(2),
Currency_Unit				varchar2(10)
Special_Notes				varchar2(300),
Region						varchar2(15),
Income_Group				varchar2(10),
WB-2_code					varchar2(2),
Nat_acc_base year 			number(4),
Nat_acc_ref_year			number(4),
SNA_price_valuation			varchar2(30),
Lending_category			varchar2(5),
Other_groups				varchar2(5),
Sys_Nat_Acc					varchar2(50),
Alt_conv_factor				varchar2(30),
PPP_survey_year				number,
Bal_payment_Manual			varchar2(30),
Ext_debt_report_status		varchar2(10),
SOT							varchar2(40),
Gov_Accounting_concept		varchar2(40),
IMF_dissemination			varchar2(40),
Latest_population_census	varchar2(40),		
Latest_household_survey		varchar2(40),
Source_Income_expenditure   varchar2(40),
Vital_registration _complete varchar2(4),	
Latest_agricultural_census	varchar2(40),
Latest_industrial_data		varchar2(40),
Latest_trade_data			number(4),
Modified_date 				date,
Modified_by					varchar2(10),
Created_date				date,
Created_by					varchar2(10),
CONSTRAINT Country_Code_pk PRIMARY KEY (Country_Code) 
);

--Table : WDICountry_Series_tbl

create table WDICountry_Series_tbl(
Country_Code 				varchar2(3),
Series_Code  				varchar2(50),
Description  				
varchar2(200),
Modified_date 				date,
Modified_by					varchar2(10),
Created_date				date,
Created_by					varchar2(10),
CONSTRAINT Series_Code_pk PRIMARY KEY (Series_Code),
CONSTRAINT fk_Country_Code FOREIGN KEY (Country_Code) REFERENCES WDICountry_tbl(Country_Code)
);

--Table :WDIDATA_tbl
create table WDIDATA_tbl (
Country_Name				varchar2(30),
Country_Code				varchar2(3),
Indicator_Name				varchar2(30,)
Indicator_Code  			varchar2(50)
1960						number, .....
2021						number,
Modified_date 				date,
Modified_by					varchar2(10),
Created_date				date,
Created_by					varchar2(10),
CONSTRAINT fk_Country_Code FOREIGN KEY (Country_Code) REFERENCES WDICountry_tbl(Country_Code)
)

--Table :WDIFootNote_tbl

create table WDIFootNote_tbl(
Country_Code 				varchar2(3),	
Series_Code	 				varchar2(50),
Year		 				Number, 
DESCRIPTION  				varchar2(200),
Modified_date 				date,
Modified_by					varchar2(10),
Created_date				date,
Created_by					varchar2(10),
CONSTRAINT fk_Country_Code FOREIGN KEY (Country_Code) REFERENCES WDICountry_tbl(Country_Code),
CONSTRAINT fk_Series_Code FOREIGN KEY (Series_Code) REFERENCES WDICountry_Series_tbl(Series_Code)
);

--TABLE WDISeries
create table WDISeries_tbl(
Series_Code								varchar2(15),
Topic                                   varchar2(20),
Indicator_Name                          varchar2(20),
Short_definition                        varchar2(100),
Long_definition                         varchar2(200),
UOM                                     varchar2(20),
Periodicity                             varchar2(20),
Base_Period                             varchar2(20),
Other_notes                             varchar2(20),
Aggregation_method                      varchar2(20),
Limitations_exceptions                  varchar2(20),
original_source                         varchar2(20),
General_comments                        varchar2(20),
Source                                  varchar2(20),
Statistical_concept_methodology         varchar2(20),
Development_relevance                   varchar2(20),
Related_source_links                    varchar2(20),
web_links                               varchar2(20),
Related_indicators                      varchar2(20),
License_Type                            varchar2(20),
License_Type                            varchar2(20),
Modified_date 							date,
Modified_by								varchar2(10),
Created_date							date,
Created_by								varchar2(10),
CONSTRAINT fk_Series_Code FOREIGN KEY (Series_Code) REFERENCES WDICountry_Series_tbl(Series_Code)
)

--Table : WDISeries_time_tbl

create table WDISeries_time_tbl (
Series_Code varchar2(50),
Year Number,
Description varchar2(200),
CONSTRAINT fk_Series_Code FOREIGN KEY (Series_Code) REFERENCES WDICountry_Series_tbl(Series_Code)
 );



--create package


CREATE OR REPLACE PACKAGE WDI_PKG AS 
   PROCEDURE insert_data_WDI_PRC;
  
END WDI_PKG; 


CREATE OR REPLACE PACKAGE BODY WDI_PKG AS 
   PROCEDURE insert_data_WDI_PRC
   IS 
   BEGIN 
      INSERT INTO WDICountry_tbl (id,name,age,address,salary) 
         VALUES(c_id, c_name, c_age, c_addr, c_sal); 
	EXCEPTION 
     WHEN others THEN 
      dbms_output.put_line('Error in WDICountry_tbl!');
   END ; 
   
   BEGIN 
      INSERT INTO WDICountry_Series_tbl (id,name,age,address,salary) 
         VALUES(c_id, c_name, c_age, c_addr, c_sal); 
	EXCEPTION 
     WHEN others THEN 
      dbms_output.put_line('Error in WDICountry_Series_tbl!');
   END ;
   
   
    BEGIN 
      INSERT INTO WDIDATA_tbl (id,name,age,address,salary) 
         VALUES(c_id, c_name, c_age, c_addr, c_sal); 
	EXCEPTION 
     WHEN others THEN 
      dbms_output.put_line('Error in WDIDATA_tbl!');
   END ;
   
   
    BEGIN 
      INSERT INTO WDIFootNote_tbl (id,name,age,address,salary) 
         VALUES(c_id, c_name, c_age, c_addr, c_sal); 
	EXCEPTION 
     WHEN others THEN 
      dbms_output.put_line('Error in  WDIFootNote_tbl!');
   END ;
   
    BEGIN 
      INSERT INTO WDISeries_time_tbl (id,name,age,address,salary) 
         VALUES(c_id, c_name, c_age, c_addr, c_sal);
	EXCEPTION 
     WHEN others THEN 
      dbms_output.put_line('Error in WDISeries_time_tbl!');
   END ;
   
    BEGIN 
      INSERT INTO WDISeries_tbl (id,name,age,address,salary) 
         VALUES(c_id, c_name, c_age, c_addr, c_sal); 
	EXCEPTION 
     WHEN others THEN 
      dbms_output.put_line('Error in WDISeries!');
   END;
   
   commit;
      
END WDI_PKG; 
/

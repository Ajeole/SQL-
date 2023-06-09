
CREATE DATABASE employees_db;


USE employees_db;


CREATE TABLE REGIONS
(region_id INT CONSTRAINT region_id_nn NOT NULL,
region_name VARCHAR(25),
CONSTRAINT reg_id_pk PRIMARY KEY NONCLUSTERED (region_id));


CREATE TABLE COUNTRIES 
(country_id CHAR(2) CONSTRAINT country_id_nn NOT NULL, 
country_name VARCHAR(40),
region_id INT,
CONSTRAINT country_c_id_pk PRIMARY KEY (country_id)); 


CREATE TABLE LOCATIONS
(location_id INT,
street_address VARCHAR(40),
postal_code VARCHAR(12),
city VARCHAR(30) CONSTRAINT loc_city_nn NOT NULL,
state_province VARCHAR(25),
country_id CHAR(2),
CONSTRAINT loc_id_pk PRIMARY KEY (location_id));


CREATE TABLE departments
(department_id INT,
department_name VARCHAR(30) CONSTRAINT dept_name_nn NOT NULL,
manager_id INT,
location_id INT);


CREATE TABLE jobs
(job_id VARCHAR(10),
job_title VARCHAR(35) CONSTRAINT job_title_nn NOT NULL,
min_salary INT,
max_salary INT);

CREATE TABLE employees
(employee_id INT,
first_name VARCHAR(20),
last_name VARCHAR(25) CONSTRAINT emp_last_name_nn NOT NULL,
email VARCHAR(25) CONSTRAINT emp_email_nn NOT NULL,
phone_number VARCHAR(20),
hire_date DATE CONSTRAINT emp_hire_date_nn NOT NULL,
job_id VARCHAR(10) CONSTRAINT emp_job_nn NOT NULL,
salary DECIMAL(8,2),
commission_pct DECIMAL(2,2),
manager_id INT,
department_id INT);

CREATE TABLE job_history
(employee_id INT CONSTRAINT jhist_employee_nn NOT NULL,
start_date DATE CONSTRAINT jhist_start_date_nn NOT NULL,
end_date DATE CONSTRAINT jhist_end_date_nn NOT NULL,
job_id VARCHAR(10) CONSTRAINT jhist_job_nn NOT NULL,
department_id INT);

INSERT INTO regions VALUES ( 1 , 'Europe' );
INSERT INTO regions VALUES ( 2 , 'Americas' ); 
INSERT INTO regions VALUES ( 3 , 'Asia' ); 
INSERT INTO regions VALUES ( 4 , 'Middle East and Africa' );

INSERT INTO countries VALUES ( 'IT' , 'Italy' , 1 );
INSERT INTO countries VALUES ( 'JP' , 'Japan' , 3 ); 
INSERT INTO countries VALUES ( 'US' , 'United States of America' , 2 );
INSERT INTO countries VALUES ( 'CA' , 'Canada' , 2 );
INSERT INTO countries VALUES ( 'CN' , 'China' , 3 );
INSERT INTO countries VALUES ( 'IN' , 'India' , 3 ); 
INSERT INTO countries VALUES ( 'AU' , 'Australia' , 3 ); 
INSERT INTO countries VALUES ( 'ZW' , 'Zimbabwe' , 4 );
INSERT INTO countries VALUES ( 'SG' , 'Singapore' , 3 );
INSERT INTO countries VALUES ( 'UK' , 'United Kingdom' , 1 ); 
INSERT INTO countries VALUES ( 'FR' , 'France' , 1 ); 
INSERT INTO countries VALUES ( 'DE' , 'Germany' , 1 );
INSERT INTO countries VALUES ( 'ZM' , 'Zambia' , 4 );
INSERT INTO countries VALUES ( 'EG' , 'Egypt' , 4 );
INSERT INTO countries VALUES ( 'BR' , 'Brazil' , 2 );
INSERT INTO countries VALUES ( 'CH' , 'Switzerland' , 1 );
INSERT INTO countries VALUES ( 'NL' , 'Netherlands' , 1 );
INSERT INTO countries VALUES ( 'MX' , 'Mexico' , 2 ); 
INSERT INTO countries VALUES ( 'KW' , 'Kuwait' , 4 );
INSERT INTO countries VALUES ( 'IL' , 'Israel' , 4 );
INSERT INTO countries VALUES ( 'DK' , 'Denmark' , 1 );
INSERT INTO countries VALUES ( 'ML' , 'Malaysia' , 3 );
INSERT INTO countries VALUES ( 'NG' , 'Nigeria' , 4 );
INSERT INTO countries VALUES ( 'AR' , 'Argentina' , 2 ); 
INSERT INTO countries VALUES ( 'BE' , 'Belgium' , 1 );

INSERT INTO locations VALUES ( 1000 , '1297 Via Cola di Rie' , '00989' , 'Roma' , NULL , 'IT' );
INSERT INTO locations VALUES ( 1100 , '93091 Calle della Testa' , '10934' , 'Venice' , NULL , 'IT' );
INSERT INTO locations VALUES ( 1200 , '2017 Shinjuku-ku' , '1689' , 'Tokyo' , 'Tokyo Prefecture' , 'JP' );
INSERT INTO locations VALUES ( 1300 , '9450 Kamiya-cho' , '6823' , 'Hiroshima' , NULL , 'JP' );
INSERT INTO locations VALUES ( 1400 , '2014 Jabberwocky Rd' , '26192' , 'Southlake' , 'Texas' , 'US' );
INSERT INTO locations VALUES ( 1500 , '2011 Interiors Blvd' , '99236' , 'South San Francisco' , 'California' , 'US' );
INSERT INTO locations VALUES ( 1600 , '2007 Zagora St' , '50090' , 'South Brunswick' , 'New Jersey' , 'US' );
INSERT INTO locations VALUES ( 1700 , '2004 Charade Rd' , '98199' , 'Seattle' , 'Washington' , 'US' );
INSERT INTO locations VALUES ( 1800 , '147 Spadina Ave' , 'M5V 2L7' , 'Toronto' , 'Ontario' , 'CA' );
INSERT INTO locations VALUES ( 1900 , '6092 Boxwood St' , 'YSW 9T2' , 'Whitehorse' , 'Yukon' , 'CA' );
INSERT INTO locations VALUES ( 2000 , '40-5-12 Laogianggen' , '190518' , 'Beijing' , NULL , 'CN' );
INSERT INTO locations VALUES ( 2100 , '1298 Vileparle (E)' , '490231' , 'Bombay' , 'Maharashtra' , 'IN' );
INSERT INTO locations VALUES ( 2200 , '12-98 Victoria Street' , '2901' , 'Sydney' , 'New South Wales' , 'AU' );
INSERT INTO locations VALUES ( 2300 , '198 Clementi North' , '540198' , 'Singapore' , NULL , 'SG' );
INSERT INTO locations VALUES ( 2400 , '8204 Arthur St' , NULL , 'London' , NULL , 'UK' );
INSERT INTO locations VALUES ( 2500 , 'Magdalen Centre, The Oxford Science Park' , 'OX9 9ZB' , 'Oxford' , 'Oxford' , 'UK' );
INSERT INTO locations VALUES ( 2600 , '9702 Chester Road' , '09629850293' , 'Stretford' , 'Manchester' , 'UK' );
INSERT INTO locations VALUES ( 2700 , 'Schwanthalerstr. 7031' , '80925' , 'Munich' , 'Bavaria' , 'DE' );
INSERT INTO locations VALUES ( 2800 , 'Rua Frei Caneca 1360 ' , '01307-002' , 'Sao Paulo' , 'Sao Paulo' , 'BR' );
INSERT INTO locations VALUES ( 2900 , '20 Rue des Corps-Saints' , '1730' , 'Geneva' , 'Geneve' , 'CH' );
INSERT INTO locations VALUES ( 3000 , 'Murtenstrasse 921' , '3095' , 'Bern' , 'BE' , 'CH' );
INSERT INTO locations VALUES ( 3100 , 'Pieter Breughelstraat 837' , '3029SK' , 'Utrecht' , 'Utrecht' , 'NL' );
INSERT INTO locations VALUES ( 3200 , 'Mariano Escobedo 9991' , '11932' , 'Mexico City' , 'Distrito Federal,' , 'MX' );

INSERT INTO departments VALUES ( 10 , 'Administration' , 200 , 1700 ); 
INSERT INTO departments VALUES ( 20 , 'Marketing' , 201 , 1800 );
INSERT INTO departments VALUES ( 30 , 'Purchasing' , 114 , 1700 );
INSERT INTO departments VALUES ( 40 , 'Human Resources' , 203 , 2400 );
INSERT INTO departments VALUES ( 50 , 'Shipping' , 121 , 1500 );
INSERT INTO departments VALUES ( 60 , 'IT' , 103 , 1400 );
INSERT INTO departments VALUES ( 70 , 'Public Relations' , 204 , 2700 );
INSERT INTO departments VALUES ( 80 , 'Sales' , 145 , 2500 );
INSERT INTO departments VALUES ( 90 , 'Executive' , 100 , 1700 );
INSERT INTO departments VALUES ( 100 , 'Finance' , 108 , 1700 );
INSERT INTO departments VALUES ( 110 , 'Accounting' , 205 , 1700 );
INSERT INTO departments VALUES ( 120 , 'Treasury' , NULL , 1700 );
INSERT INTO departments VALUES ( 130 , 'Corporate Tax' , NULL , 1700 );
INSERT INTO departments VALUES ( 140 , 'Control And Credit' , NULL , 1700 );
INSERT INTO departments VALUES ( 150 , 'Shareholder Services' , NULL , 1700 );
INSERT INTO departments VALUES ( 160 , 'Benefits' , NULL , 1700 );
INSERT INTO departments VALUES ( 170 , 'Manufacturing' , NULL , 1700 );
INSERT INTO departments VALUES ( 180 , 'Construction' , NULL , 1700 ); 
INSERT INTO departments VALUES ( 190 , 'Contracting' , NULL , 1700 );
INSERT INTO departments VALUES ( 200 , 'Operations' , NULL , 1700 ); 
INSERT INTO departments VALUES ( 210 , 'IT Support' , NULL , 1700 );
INSERT INTO departments VALUES ( 220 , 'NOC' , NULL , 1700 );
INSERT INTO departments VALUES ( 230 , 'IT Helpdesk' , NULL , 1700 );
INSERT INTO departments VALUES ( 240 , 'Government Sales' , NULL , 1700 );
INSERT INTO departments VALUES ( 250 , 'Retail Sales' , NULL , 1700 );
INSERT INTO departments VALUES ( 260 , 'Recruiting' , NULL , 1700 );
INSERT INTO departments VALUES ( 270 , 'Payroll' , NULL , 1700 );

INSERT INTO jobs VALUES ( 'AD_PRES' , 'President' , 20080 , 40000 );
INSERT INTO jobs VALUES ( 'AD_VP' , 'Administration Vice President' , 15000 , 30000 );
INSERT INTO jobs VALUES ( 'AD_ASST' , 'Administration Assistant' , 3000 , 6000 );
INSERT INTO jobs VALUES ( 'FI_MGR' , 'Finance Manager' , 8200 , 16000 );
INSERT INTO jobs VALUES ( 'FI_ACCOUNT' , 'Accountant' , 4200 , 9000 );
INSERT INTO jobs VALUES ( 'AC_MGR' , 'Accounting Manager' , 8200 , 16000 );
INSERT INTO jobs VALUES ( 'AC_ACCOUNT' , 'Public Accountant' , 4200 , 9000 );
INSERT INTO jobs VALUES ( 'SA_MAN' , 'Sales Manager' , 10000 , 20080 );
INSERT INTO jobs VALUES ( 'SA_REP' , 'Sales Representative' , 6000 , 12008 );
INSERT INTO jobs VALUES ( 'PU_MAN' , 'Purchasing Manager' , 8000 , 15000 ); 
INSERT INTO jobs VALUES ( 'PU_CLERK' , 'Purchasing Clerk' , 2500 , 5500 );
INSERT INTO jobs VALUES ( 'ST_MAN' , 'Stock Manager' , 5500 , 8500 );
INSERT INTO jobs VALUES ( 'ST_CLERK' , 'Stock Clerk' , 2008 , 5000 );
INSERT INTO jobs VALUES ( 'SH_CLERK' , 'Shipping Clerk' , 2500 , 5500 ); 
INSERT INTO jobs VALUES ( 'IT_PROG' , 'Programmer' , 4000 , 10000 );
INSERT INTO jobs VALUES ( 'MK_MAN' , 'Marketing Manager' , 9000 , 15000 );
INSERT INTO jobs VALUES ( 'MK_REP' , 'Marketing Representative' , 4000 , 9000 );
INSERT INTO jobs VALUES ( 'HR_REP' , 'Human Resources Representative' , 4000 , 9000 );
INSERT INTO jobs VALUES ( 'PR_REP' , 'Public Relations Representative' , 4500 , 10500 );

INSERT INTO employees VALUES ( 101,'Neena','Kochhar','NKOCHHAR','515.123.4568',CONVERT(DATETIME, '9-21-2005'),'AD_VP',17000,NULL,100,90);
INSERT INTO employees VALUES ( 102,'Lex','De Haan','LDEHAAN','515.123.4569',CONVERT(DATETIME, '1-13-2001'),'AD_VP',17000,NULL,100,90);
INSERT INTO employees VALUES ( 103,'Alexander','Hunold','AHUNOLD','590.423.4567',CONVERT(DATETIME, '1-3-2006'),'IT_PROG',9000,NULL,102,60);
INSERT INTO employees VALUES ( 104,'Bruce','Ernst','BERNST','590.423.4568',CONVERT(DATETIME, '5-21-2007'),'IT_PROG',6000,NULL,103,60);
INSERT INTO employees VALUES ( 105,'David','Austin','DAUSTIN','590.423.4569',CONVERT(DATETIME, '6-25-2005'),'IT_PROG',4800,NULL,103,60);
INSERT INTO employees VALUES ( 106,'Valli','Pataballa','VPATABAL','590.423.4560',CONVERT(DATETIME, '2-5-2006'),'IT_PROG',4800,NULL,103,60);
INSERT INTO employees VALUES ( 107,'Diana','Lorentz','DLORENTZ','590.423.5567',CONVERT(DATETIME, '2-7-2007'),'IT_PROG',4200,NULL,103,60);
INSERT INTO employees VALUES ( 108,'Nancy','Greenberg','NGREENBE','515.124.4569',CONVERT(DATETIME, '8-17-2002'),'FI_MGR',12008,NULL,101,100);
INSERT INTO employees VALUES ( 109,'Daniel','Faviet','DFAVIET','515.124.4169',CONVERT(DATETIME, '8-16-2002'),'FI_ACCOUNT',9000,NULL,108,100);
INSERT INTO employees VALUES ( 110,'John','Chen','JCHEN','515.124.4269',CONVERT(DATETIME, '9-28-2005'),'FI_ACCOUNT',8200,NULL,108,100);
INSERT INTO employees VALUES ( 111,'Ismael','Sciarra','ISCIARRA','515.124.4369',CONVERT(DATETIME, '9-30-2005'),'FI_ACCOUNT',7700,NULL,108,100);
INSERT INTO employees VALUES ( 112,'Jose Manuel','Urman','JMURMAN','515.124.4469',CONVERT(DATETIME, '3-7-2006'),'FI_ACCOUNT',7800,NULL,108,100);
INSERT INTO employees VALUES ( 113,'Luis','Popp','LPOPP','515.124.4567',CONVERT(DATETIME, '12-7-2007'),'FI_ACCOUNT',6900,NULL,108,100);
INSERT INTO employees VALUES ( 114,'Den','Raphaely','DRAPHEAL','515.127.4561',CONVERT(DATETIME, '12-7-2002'),'PU_MAN',11000,NULL,100,30);
INSERT INTO employees VALUES ( 115,'Alexander','Khoo','AKHOO','515.127.4562',CONVERT(DATETIME, '5-18-2003'),'PU_CLERK',3100,NULL,114,30);
INSERT INTO employees VALUES ( 116,'Shelli','Baida','SBAIDA','515.127.4563',CONVERT(DATETIME, '12-24-2005'),'PU_CLERK',2900,NULL,114,30);
INSERT INTO employees VALUES ( 117,'Sigal','Tobias','STOBIAS','515.127.4564',CONVERT(DATETIME, '7-24-2005'),'PU_CLERK',2800,NULL,114,30);
INSERT INTO employees VALUES ( 118,'Guy','Himuro','GHIMURO','515.127.4565',CONVERT(DATETIME, '11-15-2006'),'PU_CLERK',2600,NULL,114,30);
INSERT INTO employees VALUES ( 119,'Karen','Colmenares','KCOLMENA','515.127.4566',CONVERT(DATETIME, '8-10-2007'),'PU_CLERK',2500,NULL,114,30);
INSERT INTO employees VALUES ( 120,'Matthew','Weiss','MWEISS','650.123.1234',CONVERT(DATETIME, '7-18-2004'),'ST_MAN',8000,NULL,100,50);
INSERT INTO employees VALUES ( 121,'Adam','Fripp','AFRIPP','650.123.2234',CONVERT(DATETIME, '4-10-2005'),'ST_MAN',8200,NULL,100,50);
INSERT INTO employees VALUES ( 122,'Payam','Kaufling','PKAUFLIN','650.123.3234',CONVERT(DATETIME, '5-1-2003'),'ST_MAN',7900,NULL,100,50);
INSERT INTO employees VALUES ( 123,'Shanta','Vollman','SVOLLMAN','650.123.4234',CONVERT(DATETIME, '10-10-2005'),'ST_MAN',6500,NULL,100,50);
INSERT INTO employees VALUES ( 124,'Kevin','Mourgos','KMOURGOS','650.123.5234',CONVERT(DATETIME, '11-16-2007'),'ST_MAN',5800,NULL,100,50);
INSERT INTO employees VALUES ( 125,'Julia','Nayer','JNAYER','650.124.1214',CONVERT(DATETIME, '7-16-2005'),'ST_CLERK',3200,NULL,120,50);
INSERT INTO employees VALUES ( 126,'Irene','Mikkilineni','IMIKKILI','650.124.1224',CONVERT(DATETIME, '9-28-2006'),'ST_CLERK',2700,NULL,120,50);
INSERT INTO employees VALUES ( 127,'James','Landry','JLANDRY','650.124.1334',CONVERT(DATETIME, '1-14-2007'),'ST_CLERK',2400,NULL,120,50);
INSERT INTO employees VALUES ( 128,'Steven','Markle','SMARKLE','650.124.1434',CONVERT(DATETIME, '3-8-2008'),'ST_CLERK',2200,NULL,120,50);
INSERT INTO employees VALUES ( 129,'Laura','Bissot','LBISSOT','650.124.5234',CONVERT(DATETIME, '8-20-2005'),'ST_CLERK',3300,NULL,121,50);
INSERT INTO employees VALUES ( 130,'Mozhe','Atkinson','MATKINSO','650.124.6234',CONVERT(DATETIME, '10-30-2005'),'ST_CLERK',2800,NULL,121,50);
INSERT INTO employees VALUES ( 131,'James','Marlow','JAMRLOW','650.124.7234',CONVERT(DATETIME, '2-16-2005'),'ST_CLERK',2500,NULL,121,50);
INSERT INTO employees VALUES ( 132,'TJ','Olson','TJOLSON','650.124.8234',CONVERT(DATETIME, '4-10-2007'),'ST_CLERK',2100,NULL,121,50);
INSERT INTO employees VALUES ( 133,'Jason','Mallin','JMALLIN','650.127.1934',CONVERT(DATETIME, '6-14-2004'),'ST_CLERK',3300,NULL,122,50);
INSERT INTO employees VALUES ( 134,'Michael','Rogers','MROGERS','650.127.1834',CONVERT(DATETIME, '8-26-2006'),'ST_CLERK',2900,NULL,122,50);
INSERT INTO employees VALUES ( 135,'Ki','Gee','KGEE','650.127.1734',CONVERT(DATETIME, '12-12-2007'),'ST_CLERK',2400,NULL,122,50);
INSERT INTO employees VALUES ( 136,'Hazel','Philtanker','HPHILTAN','650.127.1634',CONVERT(DATETIME, '2-6-2008'),'ST_CLERK',2200,NULL,122,50);
INSERT INTO employees VALUES ( 137,'Renske','Ladwig','RLADWIG','650.121.1234',CONVERT(DATETIME, '7-14-2003'),'ST_CLERK',3600,NULL,123,50);
INSERT INTO employees VALUES ( 138,'Stephen','Stiles','SSTILES','650.121.2034',CONVERT(DATETIME, '10-26-2005'),'ST_CLERK',3200,NULL,123,50);
INSERT INTO employees VALUES ( 139,'John','Seo','JSEO','650.121.2019',CONVERT(DATETIME, '2-12-2006'),'ST_CLERK',2700,NULL,123,50);
INSERT INTO employees VALUES ( 140,'Joshua','Patel','JPATEL','650.121.1834',CONVERT(DATETIME, '4-6-2006'),'ST_CLERK',2500,NULL,123,50);
INSERT INTO employees VALUES ( 141,'Trenna','Rajs','TRAJS','650.121.8009',CONVERT(DATETIME, '10-17-2003'),'ST_CLERK',3500,NULL,124,50);
INSERT INTO employees VALUES ( 142,'Curtis','Davies','CDAVIES','650.121.2994',CONVERT(DATETIME, '1-29-2005'),'ST_CLERK',3100,NULL,124,50);
INSERT INTO employees VALUES ( 143,'Randall','Matos','RMATOS','650.121.2874',CONVERT(DATETIME, '3-15-2006'),'ST_CLERK',2600,NULL,124,50);
INSERT INTO employees VALUES ( 144,'Peter','Vargas','PVARGAS','650.121.2004',CONVERT(DATETIME, '7-9-2006'),'ST_CLERK',2500,NULL,124,50);
INSERT INTO employees VALUES ( 145,'John','Russell','JRUSSEL','011.44.1344.429268',CONVERT(DATETIME, '10-1-2004'),'SA_MAN',14000,.4,100,80);
INSERT INTO employees VALUES ( 146,'Karen','Partners','KPARTNER','011.44.1344.467268',CONVERT(DATETIME, '1-5-2005'),'SA_MAN',13500,.3,100,80);
INSERT INTO employees VALUES ( 147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278',CONVERT(DATETIME, '3-10-2005'),'SA_MAN',12000,.3,100,80);
INSERT INTO employees VALUES ( 148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268',CONVERT(DATETIME, '10-15-2007'),'SA_MAN',11000,.3,100,80);
INSERT INTO employees VALUES ( 149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018',CONVERT(DATETIME, '1-29-2008'),'SA_MAN',10500,.2,100,80);
INSERT INTO employees VALUES ( 150,'Peter','Tucker','PTUCKER','011.44.1344.129268',CONVERT(DATETIME, '1-30-2005'),'SA_REP',10000,.3,145,80);
INSERT INTO employees VALUES ( 151,'David','Bernstein','DBERNSTE','011.44.1344.345268',CONVERT(DATETIME, '3-24-2005'),'SA_REP',9500,.25,145,80);
INSERT INTO employees VALUES ( 152,'Peter','Hall','PHALL','011.44.1344.478968',CONVERT(DATETIME, '8-20-2005'),'SA_REP',9000,.25,145,80);
INSERT INTO employees VALUES ( 153,'Christopher','Olsen','COLSEN','011.44.1344.498718',CONVERT(DATETIME, '3-30-2006'),'SA_REP',8000,.2,145,80);
INSERT INTO employees VALUES ( 154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668',CONVERT(DATETIME, '12-9-2006'),'SA_REP',7500,.2,145,80);
INSERT INTO employees VALUES ( 155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508',CONVERT(DATETIME, '11-23-2007'),'SA_REP',7000,.15,145,80);
INSERT INTO employees VALUES ( 156,'Janette','King','JKING','011.44.1345.429268',CONVERT(DATETIME, '1-30-2004'),'SA_REP',10000,.35,146,80);
INSERT INTO employees VALUES ( 157,'Patrick','Sully','PSULLY','011.44.1345.929268',CONVERT(DATETIME, '3-4-2004'),'SA_REP',9500,.35,146,80);
INSERT INTO employees VALUES ( 158,'Allan','McEwen','AMCEWEN','011.44.1345.829268',CONVERT(DATETIME, '8-1-2004'),'SA_REP',9000,.35,146,80);
INSERT INTO employees VALUES ( 159,'Lindsey','Smith','LSMITH','011.44.1345.729268',CONVERT(DATETIME, '3-10-2005'),'SA_REP',8000,.3,146,80);
INSERT INTO employees VALUES ( 160,'Louise','Doran','LDORAN','011.44.1345.629268',CONVERT(DATETIME, '12-15-2005'),'SA_REP',7500,.3,146,80);
INSERT INTO employees VALUES ( 161,'Sarath','Sewall','SSEWALL','011.44.1345.529268',CONVERT(DATETIME, '11-3-2006'),'SA_REP',7000,.25,146,80);
INSERT INTO employees VALUES ( 162,'Clara','Vishney','CVISHNEY','011.44.1346.129268',CONVERT(DATETIME, '11-11-2005'),'SA_REP',10500,.25,147,80);
INSERT INTO employees VALUES ( 163,'Danielle','Greene','DGREENE','011.44.1346.229268',CONVERT(DATETIME, '3-19-2007'),'SA_REP',9500,.15,147,80);
INSERT INTO employees VALUES ( 164,'Mattea','Marvins','MMARVINS','011.44.1346.329268',CONVERT(DATETIME, '1-24-2008'),'SA_REP',7200,.10,147,80);
INSERT INTO employees VALUES ( 165,'David','Lee','DLEE','011.44.1346.529268',CONVERT(DATETIME, '2-23-2008'),'SA_REP',6800,.1,147,80);
INSERT INTO employees VALUES ( 166,'Sundar','Ande','SANDE','011.44.1346.629268',CONVERT(DATETIME, '3-24-2008'),'SA_REP',6400,.10,147,80);
INSERT INTO employees VALUES ( 167,'Amit','Banda','ABANDA','011.44.1346.729268',CONVERT(DATETIME, '4-21-2008'),'SA_REP',6200,.10,147,80);
INSERT INTO employees VALUES ( 168,'Lisa','Ozer','LOZER','011.44.1343.929268',CONVERT(DATETIME, '3-11-2005'),'SA_REP',11500,.25,148,80);
INSERT INTO employees VALUES ( 169  ,'Harrison','Bloom','HBLOOM','011.44.1343.829268',CONVERT(DATETIME, '3-23-2006'),'SA_REP',10000,.20,148,80);
INSERT INTO employees VALUES ( 170,'Tayler','Fox','TFOX','011.44.1343.729268',CONVERT(DATETIME, '1-24-2006'),'SA_REP',9600,.20,148,80);
INSERT INTO employees VALUES ( 171,'William','Smith','WSMITH','011.44.1343.629268',CONVERT(DATETIME, '2-23-2007'),'SA_REP',7400,.15,148,80);
INSERT INTO employees VALUES ( 172,'Elizabeth','Bates','EBATES','011.44.1343.529268',CONVERT(DATETIME, '3-24-2007'),'SA_REP',7300,.15,148,80);
INSERT INTO employees VALUES ( 173,'Sundita','Kumar','SKUMAR','011.44.1343.329268',CONVERT(DATETIME, '4-21-2008'),'SA_REP',6100,.10,148,80);
INSERT INTO employees VALUES ( 174,'Ellen','Abel','EABEL','011.44.1644.429267',CONVERT(DATETIME, '5-11-2004'),'SA_REP',11000,.30,149,80);
INSERT INTO employees VALUES ( 175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266',CONVERT(DATETIME, '3-19-2005'),'SA_REP',8800,.25,149,80);
INSERT INTO employees VALUES ( 176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265',CONVERT(DATETIME, '3-24-2006'),'SA_REP',8600,.20,149,80);
INSERT INTO employees VALUES ( 177,'Jack','Livingston','JLIVINGS','011.44.1644.429264',CONVERT(DATETIME, '4-23-2006'),'SA_REP',8400,.20,149,80);
INSERT INTO employees VALUES ( 178,'Kimberely','Grant','KGRANT','011.44.1644.429263',CONVERT(DATETIME, '5-24-2007'),'SA_REP',7000,.15,149,NULL);
INSERT INTO employees VALUES ( 179,'Charles','Johnson','CJOHNSON','011.44.1644.429262',CONVERT(DATETIME, '1-4-2008'),'SA_REP',6200,.10,149,80);
INSERT INTO employees VALUES ( 180,'Winston','Taylor','WTAYLOR','650.507.9876',CONVERT(DATETIME, '1-24-2006'),'SH_CLERK',3200,NULL,120,50);
INSERT INTO employees VALUES ( 181,'Jean','Fleaur','JFLEAUR','650.507.9877',CONVERT(DATETIME, '2-23-2006'),'SH_CLERK',3100,NULL,120,50);
INSERT INTO employees VALUES ( 182,'Martha','Sullivan','MSULLIVA','650.507.9878',CONVERT(DATETIME, '6-21-2007'),'SH_CLERK',2500,NULL,120,50);
INSERT INTO employees VALUES ( 183,'Girard','Geoni','GGEONI','650.507.9879',CONVERT(DATETIME, '2-3-2008'),'SH_CLERK',2800,NULL,120,50);
INSERT INTO employees VALUES ( 184,'Nandita','Sarchand','NSARCHAN','650.509.1876',CONVERT(DATETIME, '1-27-2004'),'SH_CLERK',4200,NULL,121,50);
INSERT INTO employees VALUES ( 185,'Alexis','Bull','ABULL','650.509.2876',CONVERT(DATETIME, '2-20-2005'),'SH_CLERK',4100,NULL,121,50);
INSERT INTO employees VALUES ( 186,'Julia','Dellinger','JDELLING','650.509.3876',CONVERT(DATETIME, '6-24-2006'),'SH_CLERK',3400,NULL,121,50);
INSERT INTO employees VALUES ( 187,'Anthony','Cabrio','ACABRIO','650.509.4876',CONVERT(DATETIME, '2-7-2007'),'SH_CLERK',3000,NULL,121,50);
INSERT INTO employees VALUES ( 188,'Kelly','Chung','KCHUNG','650.505.1876',CONVERT(DATETIME, '6-14-2005'),'SH_CLERK',3800,NULL,122,50);
INSERT INTO employees VALUES ( 189,'Jennifer','Dilly','JDILLY','650.505.2876',CONVERT(DATETIME, '8-13-2005'),'SH_CLERK',3600,NULL,122,50);
INSERT INTO employees VALUES ( 190,'Timothy','Gates','TGATES','650.505.3876',CONVERT(DATETIME, '7-11-2006'),'SH_CLERK',2900,NULL,122,50);
INSERT INTO employees VALUES ( 191,'Randall','Perkins','RPERKINS','650.505.4876',CONVERT(DATETIME, '12-19-2007'),'SH_CLERK',2500,NULL,122,50);
INSERT INTO employees VALUES ( 192,'Sarah','Bell','SBELL','650.501.1876',CONVERT(DATETIME, '2-4-2004'),'SH_CLERK',4000,NULL,123,50);
INSERT INTO employees VALUES ( 193,'Britney','Everett','BEVERETT','650.501.2876',CONVERT(DATETIME, '3-3-2005'),'SH_CLERK',3900,NULL,123,50);
INSERT INTO employees VALUES ( 194,'Samuel','McCain','SMCCAIN','650.501.3876',CONVERT(DATETIME, '7-1-2006'),'SH_CLERK',3200,NULL,123,50);
INSERT INTO employees VALUES ( 195,'Vance','Jones','VJONES','650.501.4876',CONVERT(DATETIME, '3-17-2007'),'SH_CLERK',2800,NULL,123,50);
INSERT INTO employees VALUES ( 196,'Alana','Walsh','AWALSH','650.507.9811',CONVERT(DATETIME, '4-24-2006'),'SH_CLERK',3100,NULL,124,50);
INSERT INTO employees VALUES ( 197,'Kevin','Feeney','KFEENEY','650.507.9822',CONVERT(DATETIME, '5-23-2006'),'SH_CLERK',3000,NULL,124,50);
INSERT INTO employees VALUES ( 198,'Donald','OConnell','DOCONNEL','650.507.9833',CONVERT(DATETIME, '6-21-2007'),'SH_CLERK',2600,NULL,124,50);
INSERT INTO employees VALUES ( 199,'Douglas','Grant','DGRANT','650.507.9844',CONVERT(DATETIME, '1-13-2008'),'SH_CLERK',2600,NULL,124,50);
INSERT INTO employees VALUES ( 200,'Jennifer','Whalen','JWHALEN','515.123.4444',CONVERT(DATETIME, '9-17-2003'),'AD_ASST',4400,NULL,101,10);
INSERT INTO employees VALUES ( 201,'Michael','Hartstein','MHARTSTE','515.123.5555',CONVERT(DATETIME, '2-17-2004'),'MK_MAN',13000,NULL,100,20);
INSERT INTO employees VALUES ( 202,'Pat','Fay','PFAY','603.123.6666',CONVERT(DATETIME, '8-17-2005'),'MK_REP',6000,NULL,201,20);
INSERT INTO employees VALUES ( 203,'Susan','Mavris','SMAVRIS','515.123.7777',CONVERT(DATETIME, '6-7-2002'),'HR_REP',6500,NULL,101,40);
INSERT INTO employees VALUES ( 204,'Hermann','Baer','HBAER','515.123.8888',CONVERT(DATETIME, '6-7-2002'),'PR_REP',10000,NULL,101,70);
INSERT INTO employees VALUES ( 205,'Shelley','Higgins','SHIGGINS','515.123.8080',CONVERT(DATETIME, '6-7-2002'),'AC_MGR',12008,NULL,101,110);
INSERT INTO employees VALUES ( 206,'William','Gietz','WGIETZ','515.123.8181',CONVERT(DATETIME, '6-7-2002'),'AC_ACCOUNT',8300,NULL,205,110);


INSERT INTO job_history VALUES (102,CONVERT(DATETIME, '01-13-2001'),CONVERT(DATETIME, '07-24-2006'),'IT_PROG',60);
INSERT INTO job_history VALUES (101,CONVERT(DATETIME, '09-21-1997'),CONVERT(DATETIME, '10-27-2001'),'AC_ACCOUNT',110);
INSERT INTO job_history VALUES (101,CONVERT(DATETIME, '10-28-2001'),CONVERT(DATETIME, '03-15-2005'),'AC_MGR',110);
INSERT INTO job_history VALUES (201,CONVERT(DATETIME, '02-17-2004'),CONVERT(DATETIME, '12-19-2007'),'MK_REP',20);
INSERT INTO job_history VALUES  (114,CONVERT(DATETIME, '03-24-2006'),CONVERT(DATETIME, '12-31-2007'),'ST_CLERK',50);
INSERT INTO job_history VALUES  (122,CONVERT(DATETIME, '01-01-2007'),CONVERT(DATETIME, '12-31-2007'),'ST_CLERK',50);
INSERT INTO job_history VALUES  (200,CONVERT(DATETIME, '09-17-1995'),CONVERT(DATETIME, '06-17-2001'),'AD_ASST',90);
INSERT INTO job_history VALUES  (176,CONVERT(DATETIME, '03-24-2006'),CONVERT(DATETIME, '12-31-2006'),'SA_REP',80);
INSERT INTO job_history VALUES  (176,CONVERT(DATETIME, '01-01-2007'),CONVERT(DATETIME, '12-31-2007'),'SA_MAN',80);
INSERT INTO job_history VALUES  (200,CONVERT(DATETIME, '07-01-2002'),CONVERT(DATETIME, '12-31-2006'),'AC_ACCOUNT',90);

--To display the minimum salary. 
SELECT MIN(salary)
FROM employees;

--To display the highest salary.
SELECT Top 1 salary
FROM employees
ORDER BY salary DESC;

--To display the total salary of all employees. 
SELECT SUM (salary)
FROM employees;

--To display the average salary of all employees.
SELECT AVG (salary)
FROM employees;

--To count the number of rows in the employee table. The result should be just one row.
SELECT COUNT (*)
FROM employees;

--To count the number of employees that make commission and display answer in just one row.
SELECT COUNT (*)
FROM employees
WHERE commission_pct IS NOT NULL;

--To count the number of employees� first name column. The result should be just one row.
SELECT COUNT (first_name)
FROM employees;

--To display all employees that make less than Peter Hall.
SELECT *
FROM employees 
WHERE salary<(SELECT salary
FROM employees
WHERE first_name='Peter'
AND last_name = 'Hall');

--To display all the employees in the same department as Lisa Ozer.
SELECT *
FROM employees
WHERE department_id= (SELECT department_id
FROM employees
WHERE first_name='Lisa'
AND last_name = 'Ozer');

--To display all the employees in the same department as Martha Sullivan and that make more than TJ Olson.
SELECT *
FROM employees
WHERE department_id= (SELECT department_id
FROM employees
WHERE first_name='Martha'
AND last_name = 'Sullivan' AND  salary > (SELECT salary
FROM employees
WHERE first_name='TJ'
AND last_name = 'Olson'));

--To display all the departments that exist in the departments table that are not in the employees� table. Do not use a where clause.
SELECT DISTINCT department_id  FROM departments
EXCEPT
SELECT DISTINCT department_id  FROM employees; 

--To display all the departments that exist in department tables that are also in the employees� table. Do not use a where clause.
SELECT DISTINCT department_id  FROM departments
INTERSECT
SELECT DISTINCT department_id  FROM employees; 

--To display all the departments name, street address, postal code, city, and state of each department. Use the departments and locations table for this query.
SELECT department_name, street_address,postal_code,city,state_province
FROM departments, locations
WHERE departments.location_id = locations.location_id;

--OR

SELECT department_name, street_address,postal_code,city,state_province,
departments.location_id As dep_loc_id,locations.location_id As loc_loc_id
FROM departments
INNER JOIN locations
ON departments.location_id = locations.location_id;

--To display the first name and salary of all the employees in the accounting departments. 
SELECT employees.first_name, employees.salary, departments.department_name
FROM employees, departments
WHERE employees.department_id =departments.department_id
AND departments.department_name = 'Accounting';

--To display all the last name of all the employees whose department location id are 1700 and 1800.
SELECT last_name
FROM employees
WHERE department_id IN 
(SELECT department_id FROM departments WHERE location_id= 1700  OR location_id = 1800); 

--To display the phone number of all the employees in the Marketing department.
SELECT phone_number
FROM employees
WHERE department_id  IN
(SELECT department_id FROM departments WHERE department_name = 'Marketing');

--To display all the employees in the Shipping and Marketing departments who make more than 3100.
SELECT first_name,salary
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE
department_name IN ('Shipping', 'Marketing')) AND salary >3100; 

--To print the first three characters of FIRST_NAME from employee�s table.
SELECT SUBSTRING (first_name,1,3) 
AS Abv_firstname
FROM employees;

--OR

SELECT LEFT (first_name,3) 
FROM employees;

--To display all the employees who were hired before Tayler Fox.
SELECT*
FROM employees 
WHERE hire_date < (SELECT hire_date
FROM employees
WHERE first_name='Tayler'
AND last_name = 'Fox');

--To display names and salary of the employees in executive department. 
SELECT first_name,last_name, salary
FROM employees
WHERE department_id  IN
(SELECT department_id FROM departments WHERE department_name = 'Executive');

--To display the employees whose job ID is the same as that of employee 141.
SELECT *
FROM employees
WHERE job_id = (SELECT job_id
FROM employees
WHERE employee_id = 141);

--To display the employee number, last name, salary, and salary increased by 15% and expressed as a whole number for each employees and abel the column New Salary.
SELECT employee_id, last_name, salary, CONVERT(INT, ROUND (salary+(0.15 * salary),0)) AS 'New Salary' 
FROM employees;

--To print the FIRST_NAME and LAST_NAME from employees table into a single column COMPLETE_NAME. A space char should separate them.
SELECT first_name, last_name,
first_name +' '+ last_name AS complete_name
FROM employees;

--OR

SELECT first_name, last_name, CONCAT(
first_name, ' ', last_name) AS complete_name
FROM employees;

--To display all the employees and their salaries that make more than Abel.
SELECT first_name, last_name, salary
FROM employees
WHERE salary>
(SELECT salary
FROM employees
WHERE last_name = 'Abel');

--To display the employees� last names and commission amounts. If an employee does not earn commission, put �no commission�. Label the column COMM. 
SELECT last_name, commission_pct, 'no comission'AS COM
FROM employees
WHERE commission_pct IS NULL
UNION
SELECT last_name, commission_pct,CAST(commission_pct AS VARCHAR) AS COM
FROM employees
WHERE commission_pct IS NOT NULL;

--OR

SELECT last_name, commission_pct, 
CASE WHEN commission_pct IS NULL THEN 'no comission' 
ELSE CONVERT(VARCHAR, commission_pct) END AS COM
FROM employees;

--To Create a unique listing of all jobs that are in department 80 and include the location of department in the output.
SELECT DISTINCT job_id, emp.department_id, location_id
FROM employees AS emp
JOIN departments AS dep
ON emp.department_id = dep.department_id
WHERE dep.department_id = 80;

--To display the employee�s last name, department name, location ID, and city of all employees who earn a commission.
SELECT last_name, department_name, dep.location_id, city
FROM employees AS emp
JOIN departments AS dep
ON emp.department_id =dep.department_id
JOIN LOCATIONS As loc
ON dep.location_id = loc.location_id
WHERE commission_pct IS NOT NULL;

--To display the name and hire date of any employee hired after employee Davies.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > (SELECT hire_date
FROM employees
WHERE last_name = 'Davies');

--To show one row twice in results from a table.
SELECT * FROM departments
UNION ALL
SELECT * FROM departments
ORDER BY department_id;

--To display the highest, lowest, sum, and average salary of all employees. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.
SELECT salary, MIN(salary) AS Minimum, MAX(salary)AS Maximum, SUM(salary)AS 'Sum', AVG(salary) AS Average
 FROM employees
 GROUP BY salary; 

--To show the top n (say 10) records of a table.
SELECT Top 10 *
FROM employees
ORDER BY employee_id;

--To display the MINIMUN, MAXIMUM, SUM AND AVERAGE salary of each job type. 
 SELECT job_id, MIN(salary), MAX(salary), SUM(salary), AVG(salary)
 FROM employees
 GROUP BY job_id;

--To display all the employees and their managers from the employees� table.
SELECT emp.employee_id, emp.first_name AS emp_first_name, emp.last_name AS emp_last_name,
emp.manager_id, man.first_name AS man_first_name, man.last_name As man_last_name
FROM employees AS emp
LEFT OUTER JOIN employees AS man
ON man.employee_id = emp.manager_id;

--To determine the number of managers without listing them. Label the column NUMBER of managers. Hint: use manager_id column to determine the number of managers.
SELECT COUNT (manager_id) AS NUMBER_Managers
FROM employees;

--To display the difference between the HIGHEST AND LOWEST salaries. Label the column DIFFERENCE.
SELECT (MAX(salary)- MIN(salary)) AS DIFFERENCE
FROM employees;

--To display the sum salary of all employees in each department.
 SELECT department_id, SUM(salary) AS Sum_Salary_per_dep
 FROM employees
 GROUP BY department_id
 ORDER BY 2 DESC;

--To display each department's name, location, number of employees, and the average salary of employees in the department. Label the column NAME, LOCATION, NUMBER OF PEOPLE, respectively.

SELECT department_name AS NAME, location_id AS LOCATION, COUNT(employee_id) AS 'NUMBER OF PEOPLE', AVG(salary) 'AVG SAL'
FROM departments AS dep
JOIN employees AS emp
ON dep.department_id = emp.department_id
GROUP BY department_name,location_id;

--To find the position of the alphabet (�J�) in the first name column �Julia� from employee�s table.
SELECT first_name, CHARINDEX ('J', first_name)
FROM employees;

--To display the employee number and last name of all employees who earns more than the average salary. Sort the result in ascending order of salary.
SELECT employee_id, last_name
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary ASC

--To display the employee number and last names of all employees who work in a department with any employees whose last name contains a letter U.
SELECT employee_id, last_name 
FROM employees
WHERE department_id IN (SELECT department_id FROM employees WHERE last_name LIKE ('%u%'));

-- To display the last name, department number and job id of all employees whose department location ID is 1700.
SELECT last_name, dep.department_id, job_id, location_id 
FROM employees as emp
JOIN departments AS dep
ON dep.department_id = emp.department_id
WHERE location_id = 1700;

--To display the last name and salary of every employee who reports to king.
SELECT last_name, salary
FROM employees 
WHERE manager_id = (SELECT employee_id FROM employees Where  first_name ='KING' OR last_name ='KING');

--To display the department number, last name, job ID of every employee in Executive department.
SELECT dep.department_id, last_name, job_id 
FROM employees AS emp
JOIN departments AS dep
ON dep.department_id = emp.department_id
WHERE department_name = 'Executive';

--To display all last name, their department name and id from employees and department tables.
SELECT last_name, department_name,  dep.department_id
FROM employees AS emp
JOIN departments AS dep
ON dep.department_id = emp.department_id;

--To display all the last name department name, id and location from employees, department, and locations tables.
SELECT last_name, department_name, employee_id, street_address, city, state_province
FROM employees AS emp
JOIN departments AS dep
ON emp.department_id = dep.department_id
JOIN LOCATIONS As loc
ON dep.location_id = loc.location_id;

SELECT * FROM LOCATIONS
--To print all employee details from the employees table order by DEPARTMENT Descending.
SELECT * 
FROM employees
ORDER BY department_id;

-- To determine who earns more than Mr. Tobias:
SELECT first_name, last_name
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Tobias' OR  first_name = 'Tobias');

--To determine who earns more than Mr. Taylor:
SELECT first_name, last_name
FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees WHERE first_name ='Taylor' OR last_name = 'Taylor');
 
--OR
 
SELECT first_name, last_name
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE first_name = 'Winston' AND last_name = 'Taylor');

--To find the job with the highest average salary.
SELECT TOP 1 job_id, AVG (salary) AS avg_sal
FROM employees
GROUP BY job_id
ORDER BY avg_sal DESC;

--To find the employees that make more than Taylor and are in department 80. 
SELECT first_name, last_name, salary
FROM employees
WHERE department_id IN (SELECT department_id = 80) 
AND salary > (SELECT salary FROM employees WHERE first_name = 'Winston' AND last_name = 'Taylor'); 

--To display all department names and their full street address.
SELECT department_name, street_address
FROM departments AS dep
JOIN LOCATIONS AS loc
ON dep.location_id = loc.location_id;

--To display the number of people with the same job.
SELECT COUNT(employee_id) AS 'Number Of People', job_title
FROM employees AS emp
JOIN jobs AS job
ON emp.job_id = job.job_id
GROUP BY job_title;

--OR

SELECT job_id,
COUNT(employee_id)
FROM employees 
GROUP BY job_id;

--To display the �FIRST_NAME� from employees table in upper case.
SELECT UPPER(first_name) 
FROM employees;

--To display the full name and salary of the employee that makes the most in departments 50 and 80.
SELECT first_name, last_name, department_id, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees WHERE department_id = 50) 
OR salary = (SELECT MAX(salary) FROM employees WHERE department_id = 80);

--To display the department names for the departments 10, 20 and 30.
SELECT department_id, department_name
FROM departments
WHERE department_id = 10 OR  department_id = 20 OR  department_id = 30;

--To display all the manager id and department names of all the departments in United Kingdom (UK).
SELECT manager_id, department_name, country_id
FROM departments AS dep
JOIN LOCATIONS AS loc
ON dep.location_id = loc.location_id 
WHERE country_id = 'UK';

--To display the full name and phone numbers of all employees who are not in location id 1700. 
SELECT first_name, last_name, phone_number, location_id 
FROM employees AS emp
JOIN departments AS dep
ON emp.department_id = dep.department_id
WHERE location_id != 1700;

--To display the full name, department name and hire date of all employees that were hired after Shelli Baida.
SELECT first_name,last_name, department_name 
FROM employees AS emp
JOIN departments AS dep
ON  emp.department_id = dep.department_id
WHERE hire_date < (SELECT hire_date FROM employees WHERE first_name  = 'Shelli' AND last_name = 'Baida')

--To display the full name and salary of all employees who make the same salary as Janette King.
SELECT first_name, last_name, salary 
FROM employees 
WHERE salary < ( SELECT salary FROM employees WHERE first_name  = 'janette' AND last_name = 'King');

--To display the full name hire date and salary of all employees who were hired in 2007 and make more than Elizabeth Bates.
SELECT first_name, last_name, hire_date, salary 
FROM employees 
WHERE salary > ( SELECT salary FROM employees WHERE first_name  = 'Elizabeth' AND last_name = 'Bates') AND hire_date LIKE ('2007%');


--To display all departments whose average salary is greater than $8000. 
SELECT AVG (salary) AS avg_sal, emp. department_id, department_name
FROM employees AS emp
JOIN departments AS dep
ON emp.department_id = dep.department_id
WHERE salary > 8000
GROUP BY department_name, emp.department_id;

--To display all departments whose maximum salary is greater than 10000.
SELECT department_name
FROM employees AS emp
JOIN departments AS dep
ON emp.department_id = dep.department_id
JOIN jobs As job
ON emp.job_id = job.job_id
WHERE max_salary > 10000;

--To display the job title and total monthly salary for each job that has a total salary exceeding $13,000. Exclude any job title that looks like rep and sort the result by total monthly salary.
SELECT job_title, SUM(salary) AS tot_mon_sal
FROM employees AS emp
LEFT JOIN jobs AS job
ON emp.job_id = job.job_id
GROUP BY job_title
HAVING SUM (salary)> 1300 AND job_title NOT LIKE ('%REP%')
ORDER BY SUM (salary) DESC

--To display the department id, department name, location id and city of departments 20 and 50.
SELECT department_id, department_name, loc. location_id, city
FROM departments AS dep 
JOIN LOCATIONS AS loc
ON dep.location_id = loc.location_id
WHERE  department_id = 20 OR department_id = 50;

--To display the city and department name that are having a location id of 1400. 
SELECT loc.location_id, department_name, city
FROM departments AS dep 
JOIN LOCATIONS AS loc
ON dep.location_id = loc.location_id
WHERE loc.location_id = 1400;

--To isplay the salary of last name, job id and salary of all employees whose salary is equal to the minimum salary.
SELECT last_name, job_id, salary
FROM employees
WHERE salary = (SELECT MIN (salary) FROM employees)

--To display the departments who have a minimum salary greater that of department 50.
SELECT department_id, employee_id, salary
FROM employees WHERE salary > (SELECT MIN(salary) FROM employees WHERE department_id = 50)
ORDER BY salary DESC;

--To display all employees who make more than Timothy Gates and less than Harrison Bloom.
SELECT first_name, last_name, salary 
FROM employees 
WHERE salary > (SELECT salary FROM employees WHERE first_name = 'Timothy' AND last_name = 'Gates')
AND salary < (SELECT salary FROM employees WHERE first_name = 'Harrison' AND last_name = 'Bloom')
ORDER BY salary DESC;

--To display all employees who are in Lindsey Smith or Joshua Patel department, who make more than Ismael Sciarra and were hired in 2007 and 2008.
SELECT first_name, last_name, hire_date, department_id, salary
FROM employees 
WHERE department_id IN (SELECT department_id FROM employees WHERE first_name = 'Lindsey' AND last_name = 'Smith' 
OR first_name = 'Joshua' AND last_name = 'Patel')
AND salary > (SELECT salary FROM employees WHERE first_name = 'Ismael' AND last_name = 'Sciarra')
AND year(hire_date) IN (2007,2008)
ORDER BY salary DESC;

--To display the full name, 10-digit phone number, salary, department name, street address, postal code, city, and state province of all employees.
SELECT first_name,last_name, phone_number, department_name, salary, street_address, postal_code, city, state_province
FROM employees AS emp
JOIN departments AS dep
ON emp.department_id =dep.department_id
JOIN LOCATIONS As loc
ON dep.location_id = loc.location_id;

-- To fetch the unique values of DEPARTMENT from employees table and prints its length.
SELECT DISTINCT department_id,
LEN (department_id) AS len
FROM employees;

--To print all employee details from the Worker table order by FIRST_NAME Ascending.
SELECT * 
FROM employees
ORDER BY first_name ASC;





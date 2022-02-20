USE residence;

# mysql staywell schema
DROP TABLE IF EXISTS owner;
DROP TABLE IF EXISTS office;
DROP TABLE IF EXISTS property;   
DROP TABLE IF EXISTS office;
DROP TABLE IF EXISTS service_category;
DROP TABLE IF EXISTS service_request; 
DROP TABLE IF EXISTS residents;


CREATE TABLE owner (
    owner_num CHAR(5) PRIMARY KEY NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state CHAR(2) NOT NULL,
    zip_code CHAR(5) NOT NULL
);

CREATE TABLE office (
    office_num INT PRIMARY KEY NOT NULL,
    office_name VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    area VARCHAR(50) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state CHAR(2) NOT NULL,
    zip_code CHAR(5) NOT NULL
);

CREATE TABLE property (
    property_id INT PRIMARY KEY NOT NULL,
    office_num INT NOT NULL,
    address VARCHAR(100) NOT NULL,
    sqr_ft INT NOT NULL,
    bdrms INT NOT NULL,
    floors INT NOT NULL,
    monthly_rent INT,
    owner_num CHAR(5) NOT NULL,
    CONSTRAINT owner_prop_fk FOREIGN KEY (owner_num)
        REFERENCES owner (owner_num),
	CONSTRAINT office_prop_fk FOREIGN KEY (office_num)
        REFERENCES office (office_num)
);




CREATE TABLE service_category (
    category_num INT PRIMARY KEY NOT NULL,
    category_description VARCHAR(100) NOT NULL
);

CREATE TABLE service_request (
    service_id INT PRIMARY KEY NOT NULL,
    property_id INT NOT NULL,
    category_number INT NOT NULL,
    office_id TINYINT NOT NULL,
    description VARCHAR(200) NOT NULL,
    status VARCHAR(200) NOT NULL,
    est_hours TINYINT NOT NULL,
    spent_hours TINYINT NOT NULL,
    next_service_date DATE,
    CONSTRAINT property_serv_fk FOREIGN KEY (property_id)
        REFERENCES property (property_id),
    CONSTRAINT service_category_fk FOREIGN KEY (category_number)
        REFERENCES service_category (category_num)
);

CREATE TABLE residents (
    resident_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    surname VARCHAR(20) NOT NULL,
    property_id INT NOT NULL,
    CONSTRAINT resi_property_fk FOREIGN KEY (property_id)
        REFERENCES property (property_id)
);

        

# insert owners
INSERT INTO owner VALUES('mo100','moore','elle-may','8006 w. newport ave.','reno','nv','89508');
INSERT INTO owner VALUES('pa101','patel','makesh','7337 sheffield st.','seattle','wa','98119');
INSERT INTO owner VALUES('ak102','aksoy','ceyda','411 griffin rd.','seattle','wa','98131');
INSERT INTO owner VALUES('co103','cole','meerab','9486 circle ave.','olympia','wa','98506');
INSERT INTO owner VALUES('ko104','kowalczyk','jakub','7431 s. bishop st.','bellingham','wa','98226');
INSERT INTO owner VALUES('si105','sims','haydon','527 primrose rd.','portland','or','97203');
INSERT INTO owner VALUES('bu106','burke','ernest','613 old pleasant st.','twin falls','id','83303');
INSERT INTO owner VALUES('re107','redman','seth','7681 fordham st.','seattle','wa','98119');
INSERT INTO owner VALUES('lo108','lopez','janine','9856 pumpkin hill ln.','everett','wa','98213');
INSERT INTO owner VALUES('bi109','bianchi','nicole','7990 willow dr.','new york','ny','10005');
INSERT INTO owner VALUES('jo110','jones','ammarah','730 military ave.','seattle','wa','98126');




# insert properties 
INSERT INTO property VALUES('1','1','30 west thomas rd.','1600','3','1',1400,'bu106');
INSERT INTO property VALUES('2','1','782 queen ln.','2100','4','2',1900,'ak102');
INSERT INTO property VALUES('3','1','9800 sunbeam ave.','1005','2','1',1200,'bi109');
INSERT INTO property VALUES('4','1','105 north illinois rd.','1750','3','1',1650,'ko104');
INSERT INTO property VALUES('5','1','887 vine rd.','1125','2','1',1160,'si105');
INSERT INTO property VALUES('6','1','8 laurel dr.','2125','4','2',2050,'mo100');
INSERT INTO property VALUES('7','2','447 goldfield st.','1675','3','2',1700,'co103');
INSERT INTO property VALUES('8','2','594 leatherwood dr.','2700','5','2',2750,'ko104');
INSERT INTO property VALUES('9','2','504 windsor ave.','700','2','1',1050,'pa101');
INSERT INTO property VALUES('10','2','891 alton dr.','1300','3','1',1600,'lo108');
INSERT INTO property VALUES('11','2','9531 sherwood rd.','1075','2','1',1100,'jo110');
INSERT INTO property VALUES('12','2','2 bow ridge ave.','1400','3','2',1700,'re107');




# insert offices 
INSERT INTO office VALUES('1','staywell-colombia city','1135 n. wells avenue','colombia city','seattle','wa','98118');
INSERT INTO office VALUES('2','staywell-georgetown','986 s. madison rd','georgetown','seattle','wa','98108');



# insert service categories
INSERT INTO service_category VALUES('1','plumbing');
INSERT INTO service_category VALUES('2','heating');
INSERT INTO service_category VALUES('3','painting');
INSERT INTO service_category VALUES('4','electrical systems');
INSERT INTO service_category VALUES('5','carpentry');
INSERT INTO service_category VALUES('6','furniture replacement');


# insert service requests
INSERT INTO service_request VALUES('1','11','2','2','the second bedroom upstairs is not heating up at night.','problem has been confirmed. central heating engineer has been scheduled. ','2','1','2019-11-01');
INSERT INTO service_request VALUES('2','1','4','1','a new strip light is needed for the kitchen.','scheduled','1','0','2019-10-2');
INSERT INTO service_request VALUES('3','6','5','1','the bathroom door does not close properly.','service rep has confirmed issue. scheduled to be refitted.','3','1','2019-11-09');
INSERT INTO service_request VALUES('4','2','4','1','new outlet has been requested for the first upstairs bedroom. (there is currently no outlet).','scheduled','1','0','2019-10-02');
INSERT INTO service_request VALUES('5','8','3','2','new paint job requested for the common area (lounge). ','open','10','0',NULL);
INSERT INTO service_request VALUES('6','4','1 ','1','shower is dripping when not in use.','problem confirmed. plumber has been scheduled.','4','2','2019-10-07');
INSERT INTO service_request VALUES('7','2','2','1','heating unit in the entrance smells like itís burning.','service rep confirmed the issue to be dust in the heating unit. to be cleaned.  ','1','0','2019-10-09');
INSERT INTO service_request VALUES('8','9','1','2','kitchen sink does not drain properly. ','problem confirmed. plumber scheduled.','6','2','2019-11-12');
INSERT INTO service_request VALUES('9','12','6','2','new sofa requested.','open','2','0',NULL);


# insert residents 
INSERT INTO residents VALUES('1','albie ','oíryan','1');
INSERT INTO residents VALUES('2','tariq ','khan','1');
INSERT INTO residents VALUES('3','ismail ','salib','1');
INSERT INTO residents VALUES('4','callen ','beck','2');
INSERT INTO residents VALUES('5','milosz ','polansky','2');
INSERT INTO residents VALUES('6','ashanti ','lucas','2');
INSERT INTO residents VALUES('7','randy ','woodrue','2');
INSERT INTO residents VALUES('8','aislinn ','lawrence','3');
INSERT INTO residents VALUES('9','monique ','french','3');
INSERT INTO residents VALUES('10','amara ','dejsuwan','4');
INSERT INTO residents VALUES('12','rosalie ','blackmore','4');
INSERT INTO residents VALUES('13','carina ','britton','4');
INSERT INTO residents VALUES('14','valentino ','ortega','5');
INSERT INTO residents VALUES('15','kaylem ','kent','5');
INSERT INTO residents VALUES('16','alessia ','wagner','6');
INSERT INTO residents VALUES('17','tyrone ','galvan','6');
INSERT INTO residents VALUES('18','constance ','fleming','6');
INSERT INTO residents VALUES('19','eamonn ','bain','6');
INSERT INTO residents VALUES('20','misbah ','yacob','7');
INSERT INTO residents VALUES('21','gianluca ','esposito','7');
INSERT INTO residents VALUES('22','elinor ','lake','7');
INSERT INTO residents VALUES('23','ray ','rosas','8');
INSERT INTO residents VALUES('24','damon ','caldwell','8');
INSERT INTO residents VALUES('25','dawood ','busby','8');
INSERT INTO residents VALUES('26','dora ','harris','8');
INSERT INTO residents VALUES('27','leroy ','stokes','8');
INSERT INTO residents VALUES('28','tamia ','hess','9');
INSERT INTO residents VALUES('29','amelia ','sanders','9');
INSERT INTO residents VALUES('30','zarah ','byers','10');
INSERT INTO residents VALUES('31','sara ','farrow','10');
INSERT INTO residents VALUES('32','delilah ','roy','10');
INSERT INTO residents VALUES('33','dougie ','mcdaniel','11');
INSERT INTO residents VALUES('34','tahir ','halabi','11');
INSERT INTO residents VALUES('35','mila ','zhikin','12');
INSERT INTO residents VALUES('36','glenn ','donovan','12');
INSERT INTO residents VALUES('37','zayn ','fowler','12');

DROP SEQUENCE CustomerGen;
DROP SEQUENCE SaleGen;
DROP TABLE Warehouse;
DROP TABLE Stock;
DROP TABLE Sale;
DROP TABLE Store;
DROP TABLE Product;
DROP TABLE Customer;
DROP TABLE BankAccount;
DROP TABLE Bank;

CREATE SEQUENCE CustomerGen 
MINVALUE 0001
START WITH 0001
INCREMENT BY 1
CACHE 10;
CREATE SEQUENCE SaleGen 
MINVALUE 0001
START WITH 0001
INCREMENT BY 1
CACHE 10;

create TABLE Bank (BankID VARCHAR2(6) NOT NULL PRIMARY KEY,
City VARCHAR2(15) NOT NULL,
BankName VARCHAR2 (15) NOT NULL,
BankEmail VARCHAR2 (20) NOT NULL UNIQUE,
BankPhoneNumber VARCHAR2 (11) NOT NULL UNIQUE );

Create TABLE BankAccount(AccountNumber VARCHAR2(11) NOT NULL PRIMARY KEY,
SortCode VARCHAR2(9) NOT NULL UNIQUE,
CustomerEmail VARCHAR2(25) NOT NULL UNIQUE,
BankID VARCHAR(6) NOT NULL REFERENCES Bank(BankID));

Create TABLE Customer(CustomerID NUMBER(5) NOT NULL PRIMARY KEY, 
Name VARCHAR2(20) NOT NULL, 
Address VARCHAR2(30) NOT NULL,
TelephoneNumber VARCHAR2(11) NOT NULL UNIQUE,
DateOfBirth DATE,
BankAccountNumber VARCHAR2(11) NOT NULL REFERENCES BankAccount(AccountNumber) ON DELETE CASCADE);

Create TABLE Product(ProductID VARCHAR2(8) NOT NULL PRIMARY KEY, 
ProductType CHAR(2) NOT NULL CHECK(ProductType IN('CM', 'CT', 'A')), 
ProductName VARCHAR2(25) NOT NULL UNIQUE,
Description VARCHAR2(35) NOT NULL,
Cost NUMBER(5) NOT NULL);

Create TABLE STORE(StoreID VARCHAR2(10) NOT NULL PRIMARY KEY,  
StoreCity VARCHAR2(30) NOT NULL,
TelephoneNumber VARCHAR2(11) NOT NULL UNIQUE );

Create TABLE Sale(SaleID NUMBER(8) NOT NULL PRIMARY KEY, 
ProductID VARCHAR2(8) NOT NULL REFERENCES Product(ProductID),
DateOfSale DATE,
CustomerID NUMBER(5) NOT NULL REFERENCES Customer(CustomerID),
StoreID VARCHAR2(10) NOT NULL REFERENCES Store(StoreID ));

Create Table Stock(StoreID VARCHAR2(10) NOT NULL REFERENCES Store(StoreID),
ProductID VARCHAR2(8) NOT NULL REFERENCES Product(ProductID), 
Stock NUMBER(6) Not NULL,
PRIMARY KEY(ProductID, StoreID));

Create TABLE Warehouse(WarehouseID VARCHAR2(10) NOT NULL PRIMARY KEY, 
StoreID VARCHAR2(10) NOT NULL REFERENCES Store(StoreID),
RestockHistory DATE,
TelephoneNumber VARCHAR2(11) NOT NULL UNIQUE);



INSERT INTO BANK VALUES ('1', 'Newcastle', 'HSBC', 'hsbcNC@outlook.com', '01002637418');
INSERT INTO BANK VALUES ('2', 'Sunderland', 'HSBC', 'hsbcSL@outlook.com', '01002637419');
INSERT INTO BANK VALUES ('3', 'Brighton', 'HSBC', 'hsbcBR@outlook.com', '01002637420');
INSERT INTO BANK VALUES ('4', 'London', 'HSBC', 'hsbcLN@outlook.com', '01002637421');
INSERT INTO BANK VALUES ('5', 'Newcastle', 'Llyods', 'LloydsNC@outlook.com', '01003637418');
INSERT INTO BANK VALUES ('6', 'Manchester', 'Lloyds', 'LloydsMC@outlook.com', '02002637419');

INSERT INTO BANKACCOUNT VALUES('001', '11111111', 'MalekRash@outlook.com', '1');
INSERT INTO BANKACCOUNT VALUES('002', '21111111', 'JoeRogan@outlook.com', '5');
INSERT INTO BANKACCOUNT VALUES('003', '22111111', 'Rakha@outlook.com', '3');
INSERT INTO BANKACCOUNT VALUES('004', '22211111', 'Charles@outlook.com', '1');
INSERT INTO BANKACCOUNT VALUES('005', '22221111', 'Naruto@outlook.com', '2');
INSERT INTO BANKACCOUNT VALUES('006', '22222111', 'Sasuke@outlook.com', '4');
INSERT INTO BANKACCOUNT VALUES('007', '22222211', 'Luffy@outlook.com', '6');
INSERT INTO BANKACCOUNT VALUES('008', '22222221', 'Peter@outlook.com', '2');
INSERT INTO BANKACCOUNT VALUES('009', '22222222', 'Craig@outlook.com', '6');
INSERT INTO BANKACCOUNT VALUES('010', '32222222', 'Faith@outlook.com', '1');

INSERT INTO CUSTOMER VALUES(CustomerGen.NEXTVAL,'Malek', 'Centrel Station, Newcastle', '01007543293', '05-JUL-2004','001');
INSERT INTO CUSTOMER VALUES(CustomerGen.NEXTVAL,'Joe', 'Granger street, Newcastle', '01007453243', '11-AUG-1967','002');
INSERT INTO CUSTOMER VALUES(CustomerGen.NEXTVAL,'Rakha', 'Churchill Square, Brighton', '01007543239', '23-OCT-1994','003');
INSERT INTO CUSTOMER VALUES(CustomerGen.NEXTVAL,'Charles', 'Grey street, Newcastle', '01007453211', '20-SEP-1989','004');
INSERT INTO CUSTOMER VALUES(CustomerGen.NEXTVAL,'Naruto', 'Park Lane, Sunderland', '01005743293', '10-JAN-2000','005');
INSERT INTO CUSTOMER VALUES(CustomerGen.NEXTVAL,'Sasuke', 'Oxford street, London', '01009453943', '01-MAY-1997','006');
INSERT INTO CUSTOMER VALUES(CustomerGen.NEXTVAL,'Luffy', 'Baird Street, Manchester', '01007673239', '12-FEB-1999','007');
INSERT INTO CUSTOMER VALUES(CustomerGen.NEXTVAL,'Peter', 'Millfield, Sunderland', '01007451231', '09-NOV-2005','008');
INSERT INTO CUSTOMER VALUES(CustomerGen.NEXTVAL,'Craig', 'Quay Street, Manchester', '01009873293', '04-MAR-1995','009');
INSERT INTO CUSTOMER VALUES(CustomerGen.NEXTVAL,'Faith', 'Chester street, Newcastle', '01007458843', '26-DEC-2001','010');


INSERT INTO Product VALUES('1', 'CM', 'Vivy Coffee Machine', 'A small coffee pod machine', 75);
INSERT INTO Product VALUES('2', 'A', 'Barista Set', 'Coffee Tamper Set', 50);
INSERT INTO Product VALUES('3', 'CT', 'Costa Blend Coffee', 'Arabica Beans', 30);
INSERT INTO Product VALUES('4', 'A', 'Coffee Scoop Set', 'Stainless Steel Coffee Scoop Set', 80);
INSERT INTO Product VALUES('5', 'CM', 'Tassimo Coffee Machine', 'A Large coffee pod machine', 100);


INSERT INTO Store VALUES('NC1','Newcastle' ,'90447667812');
INSERT INTO Store VALUES('BR1','Brighton' ,'90557667812');
INSERT INTO Store VALUES('SL1','Sunderland' ,'90447668012');
INSERT INTO Store VALUES('MC1','Manchester' ,'90447887812');
INSERT INTO Store VALUES('LN1','London' ,'90667667812');

INSERT INTO SALE VALUES(SaleGen.nextval ,'2', '11-AUG-2023', 6, 'NC1') ;
INSERT INTO SALE VALUES(SaleGen.nextval, '5',  '13-AUG-2023', 9, 'BR1');
INSERT INTO SALE VALUES(SaleGen.nextval ,'3',  '13-AUG-2023', 2, 'LN1');
INSERT INTO SALE VALUES(SaleGen.nextval,'1',   '14-AUG-2023', 5, 'MC1');
INSERT INTO SALE VALUES(SaleGen.nextval,'2',   '14-AUG-2023', 4,'SL1');
INSERT INTO SALE VALUES(SaleGen.nextval,'5',   '15-AUG-2023', 3,'MC1');

INSERT INTO Stock VALUES('NC1', '1', 10);
INSERT INTO Stock VALUES('NC1', '2', 0);
INSERT INTO Stock VALUES('NC1', '3', 0);
INSERT INTO Stock VALUES('NC1', '4', 5);
INSERT INTO Stock VALUES('NC1', '5', 20);
INSERT INTO Stock VALUES('BR1', '1', 6);
INSERT INTO Stock VALUES('BR1', '2', 0);
INSERT INTO Stock VALUES('BR1', '3', 6);
INSERT INTO Stock VALUES('BR1', '4', 10);
INSERT INTO Stock VALUES('BR1', '5', 2);
INSERT INTO Stock VALUES('MC1', '1', 0);
INSERT INTO Stock VALUES('MC1', '2', 8);
INSERT INTO Stock VALUES('MC1', '3', 6);
INSERT INTO Stock VALUES('MC1', '4', 0);
INSERT INTO Stock VALUES('MC1', '5', 0);
INSERT INTO Stock VALUES('SL1', '1', 5);
INSERT INTO Stock VALUES('SL1', '2', 2);
INSERT INTO Stock VALUES('SL1', '3', 0);
INSERT INTO Stock VALUES('SL1', '4', 5);
INSERT INTO Stock VALUES('SL1', '5', 0);
INSERT INTO Stock VALUES('LN1', '1', 4);
INSERT INTO Stock VALUES('LN1', '2', 0);
INSERT INTO Stock VALUES('LN1', '3', 6);
INSERT INTO Stock VALUES('LN1', '4', 5);
INSERT INTO Stock VALUES('LN1', '5', 0);

INSERT INTO Warehouse VALUES('NCWH','NC1', '10-AUG-2023','09091234567');
INSERT INTO Warehouse VALUES('BRWH','BR1','10-AUG-2023','09091234577' );
INSERT INTO Warehouse VALUES('SLWH','SL1', '11-AUG-2023','09091234568' );
INSERT INTO Warehouse VALUES('MCWH','MC1', '11-AUG-2023','09091334567' );
INSERT INTO Warehouse VALUES('LNWH','LN1', '12-AUG-2023','09091234890' );


CREATE OR REPLACE PROCEDURE CustomerReg
(
    BankAccNum BANKACCOUNT.AccountNumber%TYPE,
    SortC BANKACCOUNT.SORTCODE%TYPE,
    CusMail BANKACCOUNT.CUSTOMEREMAIL%TYPE,
    BankI BANKACCOUNT.BANKID%TYPE,
    CusName CUSTOMER.NAME%TYPE,
    CusAddress CUSTOMER.ADDRESS%TYPE,
    CusNum CUSTOMER.TELEPHONENUMBER%TYPE,
    CusDoB CUSTOMER.DATEOFBIRTH%TYPE)
    AS 
    BEGIN 
        INSERT INTO BANKACCOUNT VALUES (BankAccNum, SortC, CusMail, BankI);
        INSERT INTO CUSTOMER VALUES ( CUSTOMERGEN.nextval, CusName, CusAddress, 
        CusNum, CusDob, BankAccNum);
        DBMS_OUTPUT.PUT_LINE('Customer Registered');  
        EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN DBMS_OUTPUT.PUT_LINE('Bank account Already Exists!');
        END;
        /
    CREATE OR REPLACE PROCEDURE SalePro
(
    prodID PRODUCT.ProductID%TYPE,
    Dos SALE.DateOfSale%TYPE,
    CusId Customer.CustomerID%TYPE,
    StID Store.StoreID%TYPE)
    AS
    stck STOCK.STOCK%TYPE;
    CusName CUSTOMER.NAME%TYPE;
    pCost PRODUCT.Cost%TYPE;
    pName Product.ProductName%TYPE;
    OutOfStock EXCEPTION;
    StrCity STORE.StoreCity%TYPE;
    BEGIN
        SELECT STOCK
        INTO stck
        FROM STOCK
        WHERE ProdId = ProductID AND StID = StoreID;
        IF stck < 1 THEN RAISE OutOfStock;
        END IF;
        SELECT NAME 
        INTO CusName
        FROM CUSTOMER
        WHERE CusId = CustomerID; 
         SELECT COST 
        INTO pCost
        From Product
        Where prodID = ProductID;
        SELECT ProductName 
        INTO pName
        From Product
        Where prodID = ProductID;
        SELECT StoreCity
        INTO StrCity
        FROM STORE
        WHERE StID = STOREID;
        INSERT INTO Sale VALUES (SALEGEN.nextval, prodID, SYSDATE, CusID, StID);
        DBMS_OUTPUT.PUT_LINE('Customer ' || CusName || ' Just Purchased a ' ||pName|| ' Totaling :' ||pCost|| ' £ From the ' || StrCity || ' Store');
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Please Enter A Valid ProductID / CustomerID  ');
        WHEN OutOfStock THEN DBMS_OUTPUT.PUT_LINE('Out Of Stock');
    END;
    /
    CREATE OR REPLACE PROCEDURE MangmentRepPro(Date1 DATE, Date2 DATE) 
    As CURSOR MangCursor IS 
    SELECT SaleID, ProductID, DateOfSale, CustomerID, StoreID
    FROM SALE
    WHERE DateOfSale Between Date1 AND Date2;
    MangerRepo SALE%ROWTYPE;
    NoSale EXCEPTION;
    InValidDate EXCEPTION;
    BEGIN
        Open MangCursor;
        LOOP
            FETCH MangCursor INTO MangerRepo.SaleID, MangerRepo.ProductID, MangerRepo.DateOfSale,
            MangerRepo.CustomerID, MangerRepo.StoreID;
            EXIT WHEN MangCursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE (MangerRepo.SaleID || ' ' || MangerRepo.ProductID || ' '|| MangerRepo.DateOfSale || ' ' || MangerRepo.CustomerID 
            || ' ' || MangerRepo.StoreID);
        END LOOP;
        DBMS_OUTPUT.PUT_LINE ( MangCursor%ROWCOUNT || ' Sets Of Data Retrieved');
        IF 
        MangCursor%ROWCOUNT < 1 THEN RAISE NoSale;
        END IF;
        IF Date2 IS NULL THEN RAISE InValidDate;
        END IF;
        Close MangCursor;
        EXCEPTION 
        WHEN NoSale THEN DBMS_OUTPUT.PUT_LINE('No Sale Between These Dates');
        WHEN InValidDate THEN DBMS_OUTPUT.PUT_LINE('Please Enter Dates In A Start Date/ End Date Format');
    END;
    /
             
    
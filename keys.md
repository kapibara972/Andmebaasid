### 1. Primary Key -- Primaarvõti on veerg, mis identifitseerib iga rea unikaalselt

[Select lause](Select.md) | [kasutajad](kasutaja.md) | [keys](keys.md) | [küsimused](kysimused.md) | [Triggerid](trigerid.md) 

Erineb:
  ainult 1 tabelis, 
  ei tohi olla NULL, 
  ei tohi korduda
  
Kasutus:
  iga kirje eristamine, 
  tabeli põhi-ID

SQL näide:
```sql
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);
```
<img width="566" height="417" alt="image" src="https://github.com/user-attachments/assets/b4970429-0829-4b76-a8cb-340335b8ece3" />


### 2. Foreign Key -- Foreign key seob ühe tabeli teise tabeliga
Erineb:
viitab teise tabeli PK-le, 
võib korduda

Kasutus:
seoste loomine tabelite vahel

SQL näide:
```sql
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
```
<img width="821" height="522" alt="image" src="https://github.com/user-attachments/assets/42b146d2-c059-4875-a721-cbf8ff8a151b" />

### 3. Unique Key -- Tagab, et väärtused ei kordu veerus.
Erineb:
mitu UNIQUE saab olla, 
ei ole tabeli peamine ID

Kasutus:
email, username

SQL näide:
```sql
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);
```
<img width="568" height="462" alt="image" src="https://github.com/user-attachments/assets/ce83ea51-9f37-43c8-8666-2ef1427ea7a5" />

### 4. Simple Key -- Võti, mis koosneb ühest veerust.

Erineb:
ei ole kombinatsioon

Kasutus:
lihtne ID

SQL näide:
```sql
CREATE TABLE Products (
    product_id INT PRIMARY KEY
);
```
<img width="598" height="469" alt="image" src="https://github.com/user-attachments/assets/1f76312b-6664-42ed-928f-63adbb858670" />

### 5. Composite Key -- Primaarvõti, mis koosneb mitmest veerust
Erineb:
mitu veergu koos

Kasutus:
kui üks veerg ei ole piisav

```sql
CREATE TABLE OrderItems (
    order_id INT,
    product_id INT,
    PRIMARY KEY (order_id, product_id)
);
```
<img width="629" height="425" alt="image" src="https://github.com/user-attachments/assets/11dba4f8-ffd1-468e-990f-edf1732c06a6" />

### 6. Compound Key -- Mitmest veerust koosnev võti
Erineb:
sageli teoreetiline erinevus composite’ist

Kasutus:
kombineeritud identifikaator

```sql
CREATE TABLE Classrooms (
    building_id INT,
    room_number INT,
    UNIQUE (building_id, room_number)
);
```
<img width="630" height="358" alt="image" src="https://github.com/user-attachments/assets/c29b559c-e524-4284-ad8f-77251ca1e4ad" />

### 7. Superkey -- Iga veergude kombinatsioon, mis identifitseerib rea unikaalselt
Erineb:
võib sisaldada üleliigseid veerge

Kasutus:
teoorias (andmebaasi disain)

```sql
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    name VARCHAR(100)
);
```
<img width="543" height="468" alt="image" src="https://github.com/user-attachments/assets/b619a432-6dd1-4781-b8d7-80e3ee81d9fe" />

### 8. Candidate Key -- Minimaalne superkey (ilma liigsete veergudeta)
Erineb:
ei sisalda liigseid veerge, 
võib olla mitu kandidaatvõtit

Kasutus:
PK valimine

```sql
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);
```
<img width="599" height="430" alt="image" src="https://github.com/user-attachments/assets/a8d2b7ef-ca67-4c5e-9e56-d0c981fee1fe" />

### 9. Alternate Key -- Candidate key, mis ei ole valitud primary key’ks
Erineb:
PK asemel teine kandidaat,
  candidate key - kõik võimalikud
  primary key - valitud üks
  alternate key - ülejäänud

Kasutus:
Kasutatakse alternatiivse unikaalse identifikaatorina (nt email või IBAN).

```sql
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    iban VARCHAR(34) UNIQUE
);
```
<img width="574" height="377" alt="image" src="https://github.com/user-attachments/assets/a102d264-300a-48c8-8567-38a507d68d1a" />




### allikad:
1 .https://en.wikipedia.org/wiki/Primary_key

2. https://en.wikipedia.org/wiki/Foreign_key
  
4. https://en.wikipedia.org/wiki/Candidate_key
  
6. https://en.wikipedia.org/wiki/Composite_key

5 .https://en.wikipedia.org/wiki/Unique_key

8. https://en.wikipedia.org/wiki/Superkey

10. https://en.wikipedia.org/wiki/Surrogate_key


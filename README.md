# Water Report Portal System 🚰

A **Java-based Web Application** to report and track water quality issues in different locations.  
Built using **JSP, Servlets, JDBC, MySQL, and Tomcat**.

---

## 📌 Features
- User can submit water quality issues with:
  - Name
  - Location
  - Description
  - Optional Image Upload
- Issues are stored in a MySQL database.
- View all reported issues in a simple list.
- Scalable design to add more features in the future (Admin Panel, Real-time Monitoring, REST APIs).

---

## 🖼️ Application Screenshots

### 1. Home Page
![Home Page](assets/images/index.png)

### 2. Submit Issue Page
![Submit Issue](assets/images/submit_issue.png)

### 3. Success Page
![Success Page](assets/images/success.png)

### 4. View Issues Page
![View Issues](assets/images/view_issues.png)


## 🛠️ Tech Stack
- **Frontend:** JSP, HTML, CSS
- **Backend:** Java Servlets
- **Database:** MySQL
- **Server:** Apache Tomcat


---

## ⚙️ Installation & Setup

### 1. Clone the repository
```bash
git clone https://github.com/your-username/WaterReportPortalSystem.git
cd WaterReportPortalSystem
```

### 2. Configure Database
* Start MySQL server
* Create database and table:

```sql
CREATE DATABASE rohit;
USE rohit;

CREATE TABLE issue (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL,
  location VARCHAR(200) NOT NULL,
  description TEXT NOT NULL,
  image LONGBLOB,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 3. Update Database Properties
Edit `src/main/resources/config.properties`:

```properties
db.url=jdbc:mysql://localhost:3306/rohit
db.username=your_mysql_username
db.password=your_mysql_password
```

### 4. Build & Deploy
```bash
mvn clean package
```
- Deploy the WAR file from `target/` to **Tomcat’s webapps folder**
- Start Tomcat server:
```
http://localhost:9999/WaterReportPortalSystem
```

---

## 🚀 Usage
1. Open `http://localhost:9999/WaterReportPortalSystem/`
2. Submit an issue through the form
3. View submitted issues on **View Issues** page

---

## 📂 Project Structure
```
WaterReportPortalSystem/
│── src/main/java/com/rohitgawande/waterquality/
│   ├── controller/
│   ├── dao/
│   ├── model/
│   └── util/
│
│── src/main/webapp/
│   ├── index.jsp
│   ├── success.jsp
│   ├── viewIssues.jsp
│   └── WEB-INF/web.xml
│
│── src/main/resources/config.properties
│── pom.xml
│── README.md
│── LICENSE
│── .gitignore
│── assets/images/   # Store screenshots here
```

---

## 📈 Future Enhancements
- Add **User Authentication** (Login/Register)
- Role-based access (**Admin Panel**)
- REST APIs for mobile/IoT integration
- Real-time notifications for new issues
- Data visualization (charts/maps)

---

## 🤝 Contributing
1. Fork the repo  
2. Create a new branch (`feature-xyz`)  
3. Commit changes  
4. Push branch and create a Pull Request  

---

## 📜 License
This project is licensed under the **MIT License**.  
See the [LICENSE](./LICENSE) file for details.

Дипломен проект: Разработка на Web приложение за поръчване на храна
Инструкции за инсталация на дипломен проект
Нужен софтуер: MySQL Server, MySQL Workbench(за визуализация на база данни), Eclipse for Web Developers
Стъпки за стартиране
1. Инсталация на Eclipse IDE - https://www.eclipse.org/downloads/packages/release/2021-09/m1/eclipse-ide-enterprise-java-and-web-developers
2. Инсталация на MySQL Server - https://dev.mysql.com/downloads/mysql/ 
3. Инсталация на MySQL Workbench - https://dev.mysql.com/downloads/workbench/ (Възможна инсталация на веднъж със сървар)
4. Оверете се, че в - Task Manager - Services - MYSQL service съществува и е "running"
5. Отворете MySQL Workbench.
**При направата на профил оверете се името да е "root", а паролата "t0d33oRzoo3i2P", защото кода търси за тези данни.
6. След като workbench е отворен, сървъра е пуснат и сте влезли в даденият профил осигурете, че върви на порт 3306 (localhost:3306)
7. Ако всичко от миналата стъпка е преминало за добавяне на базата данни на проекта следвайте тези стъпки:
	*Server
	*Data Import
	*Import from Dump Project Folder - изберете папката "DataBaseDip" съдържаща файлове за всяка таблица
	*Изберете "loginschema" и всички включени таблици с нея
	*Import Progress -> Start Import
4. Стартиране на Eclipse.exe
5. Проследване в менюта -
	*File
	*Import - "Select an import source:" Въведете "war" и изберете WAR File
	*В полета "WAR File:" избере бутона Browser и изберете мястото, където е инсталиран файла "BearShip.war"
	*Изберете Тarget Runtime: Apache Tomcat v8.5
	*Finish
	*Select All
	*Десен бутон на появилата се папка "BearShip" 
	*Run As
	*Run On Server
	*Choose an existing server
	*localhost > Tomcat v8.5 Server at localhost
	*Finish

-------------------------------------------------------
При грешка в зареждането на localhost:3306, MySQL сървъра не е инсталиран правилно
-------------------------------------------------------
Осигурете, че във файла ".classpath" следният ред кореспондира на вашата директория -
<classpathentry kind="lib" path="C:/Users/(Name)/Desktop/eclipse/apache-tomcat-8.5.73/lib/mysql-connector-java-8.0.27.jar"/>
	

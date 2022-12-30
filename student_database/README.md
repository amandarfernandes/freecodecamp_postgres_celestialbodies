# Learn SQL by Building a Student Database: 

For this project, you need to log in to PostgreSQL with psql to create your database. Do that by entering 
```
psql --username=freecodecamp --dbname=postgres 
```
in the terminal. Make all the tests below pass to complete the project. Be sure to get creative, and have fun!

Don't forget to connect to your database after you create it 😄

### Instructions
 
+ Create a **students** database and connect to it.
+ Create four tables: students, majors, courses, majors_courses.
+ The **students**.csv file has four fields, you will make a column for each of those as well as an ID column. 
  1. Add a column to your students table named **student_id**. Give it a type of **SERIAL** so it automatically increments and make it a **PRIMARY KEY**
  1. The first column is **first_name**. Make it a type of **VARCHAR(50)** and give it the **NOT NULL** constraint.
  1. The next column is **last_name**. Give it the same ***data type and max-length as first_name*** and make sure it has the **NOT NULL** constraint.
  1. The next column is for the major. Since you will have each major in another table this column will be a foreign key that references it. 
      Create a column in the students table named **major_id**, give it a data type of **INT** for now.
  1. Create the last column, **gpa**. Give it a data type of **NUMERIC(2,1)**.
+  Let's fill in the **majors** table next.
    1. Add a **major_id** column to it. Make it a type of SERIAL and the PRIMARY KEY for this table
    1. This table will only have one other column for the name of the major. Add a column to it named **major**. Make it a VARCHAR with a max-length of 50 and give it the NOT NULL constraint.
+ Now, set the **major_id** column from the **students** table as a ***foreign key that references the major_id column from the majors*** table.
+ Next, is the **courses** table.
  1. Add a **course_id** column to it. Give it a type of SERIAL and make it the primary key.
  2. Add a **course** column to the courses table that's a type of VARCHAR. The course names are a little longer, so give them a max-length of 100. Also, make sure it can't accept null values.
+ The **majors_courses** junction table will have two columns, each referencing the primary key from two related table. 
  1. First, add a major_id column to it. Just give it a type of INT for now.
  2. Set the major_id column you just created as a foreign key that references the major_id column from the majors table.
  3. Next, add a course_id column to the same table. Just give it a type of INT again for now.
  4. Set your new course_id column as a foreign key that references the other course_id column.
  5. There's one thing missing. This table doesn't have a primary key. The data from courses.csv will go in this table. A single major will be in it multiple times, and same with a course. So neither of them can be a primary key. But there will never be a row with the same two values as another row. So the two columns together, are unique. You can create a composite primary key that uses more than one column as a unique pair
+ Add the first major from the courses.csv file into the majors table. It's a VARCHAR, so make sure to put the value in single quotes.
+ Next, insert the first course from courses.csv into the courses table.
+ Add a row to majors_courses for the first entry in courses.csv
+ Insert the first person from students.csv into the students table.
+Adding the rest of the info one at a time would be tedious. You are going to make a script to do it for you. I recommend "splitting" the terminal for this part. You can do that by clicking the "hamburger" menu at the top left of the window, going to the "Terminal" menu, and clicking "Split Terminal". Once you've done that, use the touch command to create a file named **insert_data.sh** in your project folder.

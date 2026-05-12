import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="yourpassword",
    database="student_marks"
)

cursor = conn.cursor()

print("\n===== STUDENT MARKS REPORT =====\n")

query = """
SELECT s.name, s.class, sub.subject_name, m.marks
FROM marks m
JOIN students s ON m.student_id = s.student_id
JOIN subjects sub ON m.subject_id = sub.subject_id
ORDER BY s.name;
"""

cursor.execute(query)

results = cursor.fetchall()

for row in results:
    name, student_class, subject, marks = row
    print(f"Student: {name}")
    print(f"Class   : {student_class}")
    print(f"Subject : {subject}")
    print(f"Marks   : {marks}")
    print("-" * 30)

print("\n===== AVERAGE MARKS =====\n")

avg_query = """
SELECT s.name, AVG(m.marks) AS average_marks
FROM marks m
JOIN students s ON m.student_id = s.student_id
GROUP BY s.name;
"""

cursor.execute(avg_query)

for row in cursor.fetchall():
    print(f"{row[0]} -> Average Marks: {round(row[1], 2)}")

conn.close()

import mysql.connector
import csv

connection = mysql.connector.connect(
    host='localhost',
    user='root',
    password='111111',
    database='project',
)

def generate_users():
    users = []

    for i in range(200, 300200):
        user_id = 200 + i
        user_data = {
            "User_ID": user_id,
            "ID": f"patientId{200 + i}",
            "Password": f"patientPW{200 + i}",
            "Role": "PATIENT",
        }
        users.append(user_data)

    with open("users.csv", mode="w", newline="", encoding="utf-8") as file:
        fieldnames = ["User_ID", "ID", "Password", "Role"]
        writer = csv.DictWriter(file, fieldnames=fieldnames)

        writer.writeheader()
        writer.writerows(users)

    cursor = connection.cursor()
    insert_query = "INSERT INTO user (User_ID, ID, Password, Role) VALUES (%s, %s, %s, %s)"
    for user_data in users:
        cursor.execute(insert_query, (user_data["User_ID"], user_data["ID"], user_data["Password"], user_data["Role"]))

    connection.commit()
    cursor.close()

if __name__ == "__main__":
    generate_users()

connection.close()
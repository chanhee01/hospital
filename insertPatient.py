import mysql.connector
import csv
import random

connection = mysql.connector.connect(
    host='localhost',
    user='root',
    password='111111',
    database='project',
)

def generate_patients():
    patients = []

    for i in range(1, 300000):
        patient_id = i
        doctor_id = random.randint(1, 20)
        nurse_id = random.randint(1, 20)

        ssn = 11100000 + i
        gender = random.choice(["Male", "Female"])
        address = f"patient address{1 + i}"
        blood_type = random.choice(["A", "B", "O", "AB"])
        height = random.randint(160, 190)
        weight = random.randint(50, 90)
        phone_number = f"010-3333-{1000 + i}"
        user_id = 400 + i

        patient_data = {
            "Patient_ID": patient_id,
            "Doctor_ID": doctor_id,
            "Nurse_ID": nurse_id,
            "SSN": ssn,
            "Gender": gender,
            "Address": address,
            "Blood_Type": blood_type,
            "Height": height,
            "Weight": weight,
            "Phone_Number": phone_number,
            "User_ID": user_id,
        }
        patients.append(patient_data)

    cursor = connection.cursor()
    insert_query = """
        INSERT INTO patient (Patient_ID, Doctor_ID, Nurse_ID, SSN, Gender,
                             Address, Blood_Type, Height, Weight, Phone_Number, User_ID)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """
    for patient_data in patients:
        cursor.execute(insert_query, (
            patient_data["Patient_ID"], patient_data["Doctor_ID"],
            patient_data["Nurse_ID"], patient_data["SSN"],
            patient_data["Gender"], patient_data["Address"],
            patient_data["Blood_Type"], patient_data["Height"],
            patient_data["Weight"], patient_data["Phone_Number"],
            patient_data["User_ID"]
        ))

    connection.commit()
    cursor.close()

    with open("patients.csv", mode="w", newline="", encoding="utf-8") as file:
        fieldnames = [
            "Patient_ID", "Doctor_ID", "Nurse_ID", "SSN", "Gender",
            "Address", "Blood_Type", "Height", "Weight", "Phone_Number", "User_ID"
        ]
        writer = csv.DictWriter(file, fieldnames=fieldnames)

        writer.writeheader()
        writer.writerows(patients)

if __name__ == "__main__":
    generate_patients()

connection.close()
CREATE TABLE DOCTOR (
  Doctor_ID INT AUTO_INCREMENT PRIMARY KEY,
  Department_ID INT,
  Name VARCHAR(20),
  Address VARCHAR(50),
  Phone_Number VARCHAR(20),
  User_ID INT,
  FOREIGN KEY(User_ID) REFERENCES USER(User_ID) ON DELETE CASCADE,
  FOREIGN KEY(Department_ID) REFERENCES MEDICAL_SPECIALTY(Department_ID) ON DELETE CASCADE
);

CREATE TABLE NURSE (
  Nurse_ID INT AUTO_INCREMENT PRIMARY KEY,
  Department_ID INT,
  Name VARCHAR(20),
  Address VARCHAR(50),
  Phone_Number VARCHAR(20),
  User_ID INT,
  FOREIGN KEY(User_ID) REFERENCES USER(User_ID) ON DELETE CASCADE,
  FOREIGN KEY(Department_ID) REFERENCES MEDICAL_SPECIALTY(Department_ID) ON DELETE CASCADE
);

CREATE TABLE PATIENT (
  Patient_ID INT AUTO_INCREMENT PRIMARY KEY,
  Doctor_ID INT,
  Nurse_ID INT,
  Name VARCHAR(20),
  SSN VARCHAR(20),
  Gender VARCHAR(10),
  Address VARCHAR(50),
  Blood_Type VARCHAR(5),
  Height INT,
  Weight INT,
  Phone_Number VARCHAR(20),
  User_ID INT,
  FOREIGN KEY(User_ID) REFERENCES USER(User_ID) ON DELETE CASCADE,
  FOREIGN KEY(Doctor_ID) REFERENCES DOCTOR(Doctor_ID) ON DELETE SET NULL,
  FOREIGN KEY(Nurse_ID) REFERENCES NURSE(Nurse_ID) ON DELETE SET NULL
);

CREATE TABLE MEDICAL_SPECIALTY (
  Department_ID INT AUTO_INCREMENT PRIMARY KEY,
  Department_Name VARCHAR(20),
  Phone_Number VARCHAR(20)
);

CREATE TABLE INPATIENT (
  Inpatient_Number INT AUTO_INCREMENT PRIMARY KEY,
  Patient_ID INT,
  Room_Info VARCHAR(20),
  Admission_Date DATETIME,
  Discharge_Date_Time DATETIME
);

CREATE TABLE RESERVATION (
  Reservation_Number INT AUTO_INCREMENT PRIMARY KEY,
  Reservation_Date_Time DATETIME,
  Department_ID INT,
  Patient_ID INT,
  FOREIGN KEY(Department_ID) REFERENCES MEDICAL_SPECIALTY(Department_ID) ON DELETE CASCADE,
  FOREIGN KEY(Patient_ID) REFERENCES PATIENT(Patient_ID) ON DELETE CASCADE
);

CREATE TABLE EXAMINATION (
  Examination_number INT AUTO_INCREMENT PRIMARY KEY,
  Examination_Date_Time DATETIME,
  Examination_Details VARCHAR(50),
  Doctor_ID INT,
  Patient_ID INT,
  FOREIGN KEY(Doctor_ID) REFERENCES DOCTOR(Doctor_ID) ON DELETE SET NULL,
  FOREIGN KEY(Patient_ID) REFERENCES PATIENT(Patient_ID) ON DELETE CASCADE
);

CREATE TABLE TREATMENT (
  Treatment_number INT AUTO_INCREMENT PRIMARY KEY,
  Treatment_Date_Time DATETIME,
  Treatment_Details VARCHAR(50),
  Nurse_ID INT,
  Patient_ID INT,
  FOREIGN KEY(Nurse_ID) REFERENCES NURSE(Nurse_ID) ON DELETE SET NULL,
  FOREIGN KEY(Patient_ID) REFERENCES PATIENT(Patient_ID) ON DELETE CASCADE
);

CREATE TABLE USER (
  User_ID INT AUTO_INCREMENT PRIMARY KEY,
  ID VARCHAR(20),
  Password VARCHAR(20),
  Role VARCHAR(20)
);



// 의사 데이터 insert
INSERT INTO DOCTOR VALUES (1, 1, '의사1', '의사 주소1', '010-1111-1111', 2);
INSERT INTO DOCTOR VALUES (2, 1, '의사2', '의사 주소2', '010-1111-1112', 3);
INSERT INTO DOCTOR VALUES (3, 1, '의사3', '의사 주소3', '010-1111-1113', 4);
INSERT INTO DOCTOR VALUES (4, 1, '의사4', '의사 주소4', '010-1111-1114', 5);
INSERT INTO DOCTOR VALUES (5, 1, '의사5', '의사 주소5', '010-1111-1115', 6);
INSERT INTO DOCTOR VALUES (6, 2, '의사6', '의사 주소6', '010-1111-1116', 7);
INSERT INTO DOCTOR VALUES (7, 2, '의사7', '의사 주소7', '010-1111-1117', 8);
INSERT INTO DOCTOR VALUES (8, 2, '의사8', '의사 주소8', '010-1111-1118', 9);
INSERT INTO DOCTOR VALUES (9, 2, '의사9', '의사 주소9', '010-1111-1119', 10);
INSERT INTO DOCTOR VALUES (10, 2, '의사10', '의사 주소10', '010-1111-1120', 11);
INSERT INTO DOCTOR VALUES (11, 3, '의사11', '의사 주소11', '010-1111-1121', 12);
INSERT INTO DOCTOR VALUES (12, 3, '의사12', '의사 주소12', '010-1111-1122', 13);
INSERT INTO DOCTOR VALUES (13, 3, '의사13', '의사 주소13', '010-1111-1123', 14);
INSERT INTO DOCTOR VALUES (14, 3, '의사14', '의사 주소14', '010-1111-1124', 15);
INSERT INTO DOCTOR VALUES (15, 3, '의사15', '의사 주소15', '010-1111-1125', 16);
INSERT INTO DOCTOR VALUES (16, 4, '의사16', '의사 주소16', '010-1111-1126', 17);
INSERT INTO DOCTOR VALUES (17, 4, '의사17', '의사 주소17', '010-1111-1127', 18);
INSERT INTO DOCTOR VALUES (18, 4, '의사18', '의사 주소18', '010-1111-1128', 19);
INSERT INTO DOCTOR VALUES (19, 4, '의사19', '의사 주소19', '010-1111-1129', 20);
INSERT INTO DOCTOR VALUES (20, 4, '의사20', '의사 주소20', '010-1111-1130', 21);


// 간호사 데이터 insert
INSERT INTO NURSE VALUES (1, 1, '간호사1', '간호사 주소1', '010-2222-1111', 22);
INSERT INTO NURSE VALUES (2, 1, '간호사2', '간호사 주소2', '010-2222-1112', 23);
INSERT INTO NURSE VALUES (3, 1, '간호사3', '간호사 주소3', '010-2222-1113', 24);
INSERT INTO NURSE VALUES (4, 1, '간호사4', '간호사 주소4', '010-2222-1114', 25);
INSERT INTO NURSE VALUES (5, 1, '간호사5', '간호사 주소5', '010-2222-1115', 26);
INSERT INTO NURSE VALUES (6, 1, '간호사6', '간호사 주소6', '010-2222-1116', 27);
INSERT INTO NURSE VALUES (7, 1, '간호사7', '간호사 주소7', '010-2222-1117', 28);
INSERT INTO NURSE VALUES (8, 1, '간호사8', '간호사 주소8', '010-2222-1118', 29);
INSERT INTO NURSE VALUES (9, 1, '간호사9', '간호사 주소9', '010-2222-1119', 30);
INSERT INTO NURSE VALUES (10, 2, '간호사10', '간호사 주소10', '010-2222-1120', 31);
INSERT INTO NURSE VALUES (11, 2, '간호사11', '간호사 주소11', '010-2222-1121', 32);
INSERT INTO NURSE VALUES (12, 2, '간호사12', '간호사 주소12', '010-2222-1122', 33);
INSERT INTO NURSE VALUES (13, 2, '간호사13', '간호사 주소13', '010-2222-1123', 34);
INSERT INTO NURSE VALUES (14, 2, '간호사14', '간호사 주소14', '010-2222-1124', 35);
INSERT INTO NURSE VALUES (15, 2, '간호사15', '간호사 주소15', '010-2222-1125', 36);
INSERT INTO NURSE VALUES (16, 2, '간호사16', '간호사 주소16', '010-2222-1126', 37);
INSERT INTO NURSE VALUES (17, 3, '간호사17', '간호사 주소17', '010-2222-1127', 38);
INSERT INTO NURSE VALUES (18, 3, '간호사18', '간호사 주소18', '010-2222-1128', 39);
INSERT INTO NURSE VALUES (19, 3, '간호사19', '간호사 주소19', '010-2222-1129', 40);
INSERT INTO NURSE VALUES (20, 3, '간호사20', '간호사 주소20', '010-2222-1130', 41);
INSERT INTO NURSE VALUES (21, 3, '간호사21', '간호사 주소21', '010-2222-1131', 42);
INSERT INTO NURSE VALUES (22, 3, '간호사22', '간호사 주소22', '010-2222-1132', 43);
INSERT INTO NURSE VALUES (23, 3, '간호사23', '간호사 주소23', '010-2222-1133', 44);
INSERT INTO NURSE VALUES (24, 3, '간호사24', '간호사 주소24', '010-2222-1134', 45);
INSERT INTO NURSE VALUES (25, 4, '간호사25', '간호사 주소25', '010-2222-1135', 46);
INSERT INTO NURSE VALUES (26, 4, '간호사26', '간호사 주소26', '010-2222-1136', 47);
INSERT INTO NURSE VALUES (27, 4, '간호사27', '간호사 주소27', '010-2222-1137', 48);
INSERT INTO NURSE VALUES (28, 4, '간호사28', '간호사 주소28', '010-2222-1138', 49);
INSERT INTO NURSE VALUES (29, 4, '간호사29', '간호사 주소29', '010-2222-1139', 50);
INSERT INTO NURSE VALUES (30, 4, '간호사30', '간호사 주소30', '010-2222-1140', 51);


// 환자 데이터 insert
INSERT INTO PATIENT VALUES(1, 1, 1, '환자1', '1111111', 'Male', '환자 주소1', 'A', 174, 72, '010-3333-1101', 52);
INSERT INTO PATIENT VALUES(2, 1, 1, '환자2', '1111112', 'Female', '환자 주소2', 'B', 170, 60, '010-3333-1102', 53);
INSERT INTO PATIENT VALUES(3, 1, 1, '환자3', '1111113', 'Male', '환자 주소3', 'A', 183, 74, '010-3333-1103', 54);
INSERT INTO PATIENT VALUES(4, 1, 1, '환자4', '1111114', 'Female', '환자 주소4', 'O', 158, 70, '010-3333-1104', 55);
INSERT INTO PATIENT VALUES(5, 1, 1, '환자5', '1111115', 'Male', '환자 주소5', 'AB', 186, 84, '010-3333-1105', 56);
INSERT INTO PATIENT VALUES(6, 1, 1, '환자6', '1111116', 'Female', '환자 주소6', 'A', 169, 61, '010-3333-1106', 57);
INSERT INTO PATIENT VALUES(7, 1, 1, '환자7', '1111117', 'Male', '환자 주소7', 'B', 182, 70, '010-3333-1107', 58);
INSERT INTO PATIENT VALUES(8, 1, 1, '환자8', '1111118', 'Female', '환자 주소8', 'O', 170, 58, '010-3333-1108', 59);
INSERT INTO PATIENT VALUES(9, 1, 1, '환자9', '1111119', 'Male', '환자 주소9', 'AB', 182, 74, '010-3333-1109', 60);
INSERT INTO PATIENT VALUES(10, 1, 1, '환자10', '11111110', 'Female', '환자 주소10', 'A', 171, 61, '010-3333-1110', 61);
INSERT INTO PATIENT VALUES(11, 1, 1, '환자11', '11111111', 'Male', '환자 주소11', 'B', 182, 73, '010-3333-1111', 62);
INSERT INTO PATIENT VALUES(12, 1, 1, '환자12', '11111112', 'Female', '환자 주소12', 'O', 173, 61, '010-3333-1112', 63);
INSERT INTO PATIENT VALUES(13, 1, 1, '환자13', '11111113', 'Male', '환자 주소13', 'AB', 189, 84, '010-3333-1113', 64);
INSERT INTO PATIENT VALUES(14, 1, 1, '환자14', '11111114', 'Female', '환자 주소14', 'A', 164, 64, '010-3333-1114', 65);
INSERT INTO PATIENT VALUES(15, 1, 1, '환자15', '11111115', 'Male', '환자 주소15', 'B', 180, 70, '010-3333-1115', 66);
INSERT INTO PATIENT VALUES(16, 1, 1, '환자16', '11111116', 'Female', '환자 주소16', 'O', 173, 61, '010-3333-1116', 67);
INSERT INTO PATIENT VALUES(17, 1, 1, '환자17', '11111117', 'Male', '환자 주소17', 'AB', 181, 79, '010-3333-1117', 68);
INSERT INTO PATIENT VALUES(18, 1, 1, '환자18', '11111118', 'Female', '환자 주소18', 'A', 164, 72, '010-3333-1118', 69);
INSERT INTO PATIENT VALUES(19, 1, 1, '환자19', '11111119', 'Male', '환자 주소19', 'B', 182, 83, '010-3333-1119', 70);
INSERT INTO PATIENT VALUES(20, 1, 1, '환자20', '11111120', 'Female', '환자 주소20', 'O', 171, 65, '010-3333-1120', 71);
INSERT INTO PATIENT VALUES(21, 1, 1, '환자21', '11111121', 'Male', '환자 주소21', 'AB', 171, 72, '010-3333-1121', 72);
INSERT INTO PATIENT VALUES(22, 1, 1, '환자22', '11111122', 'Female', '환자 주소22', 'A', 159, 50, '010-3333-1122', 73);
INSERT INTO PATIENT VALUES(23, 1, 1, '환자23', '11111123', 'Male', '환자 주소23', 'B', 187, 70, '010-3333-1123', 74);
INSERT INTO PATIENT VALUES(24, 1, 1, '환자24', '11111124', 'Female', '환자 주소24', 'O', 172, 75, '010-3333-1124', 75);
INSERT INTO PATIENT VALUES(25, 1, 1, '환자25', '11111125', 'Male', '환자 주소25', 'AB', 190, 78, '010-3333-1125', 76);
INSERT INTO PATIENT VALUES(26, 1, 1, '환자26', '11111126', 'Female', '환자 주소26', 'A', 165, 66, '010-3333-1126', 77);
INSERT INTO PATIENT VALUES(27, 1, 1, '환자27', '11111127', 'Male', '환자 주소27', 'B', 170, 72, '010-3333-1127', 78);
INSERT INTO PATIENT VALUES(28, 1, 1, '환자28', '11111128', 'Female', '환자 주소28', 'O', 167, 67, '010-3333-1128', 79);
INSERT INTO PATIENT VALUES(29, 1, 1, '환자29', '11111129', 'Male', '환자 주소29', 'AB', 180, 79, '010-3333-1129', 80);
INSERT INTO PATIENT VALUES(30, 1, 1, '환자30', '11111130', 'Female', '환자 주소30', 'A', 170, 62, '010-3333-1130', 81);
INSERT INTO PATIENT VALUES(31, 1, 1, '환자31', '11111131', 'Male', '환자 주소31', 'B', 184, 76, '010-3333-1131', 82);
INSERT INTO PATIENT VALUES(32, 1, 1, '환자32', '11111132', 'Female', '환자 주소32', 'O', 171, 61, '010-3333-1132', 83);
INSERT INTO PATIENT VALUES(33, 1, 1, '환자33', '11111133', 'Male', '환자 주소33', 'AB', 182, 75, '010-3333-1133', 84);
INSERT INTO PATIENT VALUES(34, 1, 1, '환자34', '11111134', 'Female', '환자 주소34', 'A', 157, 57, '010-3333-1134', 85);
INSERT INTO PATIENT VALUES(35, 1, 1, '환자35', '11111135', 'Male', '환자 주소35', 'B', 167, 78, '010-3333-1135', 86);
INSERT INTO PATIENT VALUES(36, 1, 1, '환자36', '11111136', 'Female', '환자 주소36', 'O', 176, 71, '010-3333-1136', 87);
INSERT INTO PATIENT VALUES(37, 1, 1, '환자37', '11111137', 'Male', '환자 주소37', 'AB', 182, 72, '010-3333-1137', 88);
INSERT INTO PATIENT VALUES(38, 1, 1, '환자38', '11111138', 'Female', '환자 주소38', 'A', 162, 62, '010-3333-1138', 89);
INSERT INTO PATIENT VALUES(39, 1, 1, '환자39', '11111139', 'Male', '환자 주소39', 'B', 180, 70, '010-3333-1139', 90);
INSERT INTO PATIENT VALUES(40, 1, 1, '환자40', '11111140', 'Female', '환자 주소40', 'O', 170, 60, '010-3333-1140', 91);
INSERT INTO PATIENT VALUES(41, 1, 1, '환자41', '11111141', 'Male', '환자 주소41', 'AB', 182, 77, '010-3333-1141', 92);
INSERT INTO PATIENT VALUES(42, 1, 1, '환자42', '11111142', 'Female', '환자 주소42', 'A', 174, 73, '010-3333-1142', 93);
INSERT INTO PATIENT VALUES(43, 1, 1, '환자43', '11111143', 'Male', '환자 주소43', 'B', 187, 77, '010-3333-1143', 94);
INSERT INTO PATIENT VALUES(44, 1, 1, '환자44', '11111144', 'Female', '환자 주소44', 'O', 175, 67, '010-3333-1144', 95);
INSERT INTO PATIENT VALUES(45, 1, 1, '환자45', '11111145', 'Male', '환자 주소45', 'AB', 188, 77, '010-3333-1145', 96);
INSERT INTO PATIENT VALUES(46, 1, 1, '환자46', '11111146', 'Female', '환자 주소46', 'A', 164, 65, '010-3333-1146', 97);
INSERT INTO PATIENT VALUES(47, 1, 1, '환자47', '11111147', 'Male', '환자 주소47', 'O', 170, 70, '010-3333-1147', 98);
INSERT INTO PATIENT VALUES(48, 1, 1, '환자48', '11111148', 'Female', '환자 주소48', 'AB', 170, 60, '010-3333-1148', 99);
INSERT INTO PATIENT VALUES(49, 1, 1, '환자49', '11111149', 'Male', '환자 주소49', 'O', 182, 82, '010-3333-1149', 100);
INSERT INTO PATIENT VALUES(50, 1, 1, '환자50', '11111150', 'Female', '환자 주소50', 'AB', 161, 61, '010-3333-1150', 101);
INSERT INTO PATIENT VALUES(51, 1, 1, '환자51', '11111151', 'Male', '환자 주소51', 'O', 180, 70, '010-3333-1151', 102);
INSERT INTO PATIENT VALUES(52, 1, 1, '환자52', '11111152', 'Female', '환자 주소52', 'AB', 171, 61, '010-3333-1152', 103);
INSERT INTO PATIENT VALUES(53, 1, 1, '환자53', '11111153', 'Male', '환자 주소53', 'O', 180, 70, '010-3333-1153', 104);
INSERT INTO PATIENT VALUES(54, 1, 1, '환자54', '11111154', 'Female', '환자 주소54', 'AB', 167, 64, '010-3333-1154', 105);
INSERT INTO PATIENT VALUES(55, 1, 1, '환자55', '11111155', 'Male', '환자 주소55', 'O', 182, 80, '010-3333-1155', 106);
INSERT INTO PATIENT VALUES(56, 1, 1, '환자56', '11111156', 'Female', '환자 주소56', 'AB', 157, 57, '010-3333-1156', 107);
INSERT INTO PATIENT VALUES(57, 1, 1, '환자57', '11111157', 'Male', '환자 주소57', 'O', 183, 76, '010-3333-1157', 108);
INSERT INTO PATIENT VALUES(58, 1, 1, '환자58', '11111158', 'Female', '환자 주소58', 'AB', 161, 68, '010-3333-1158', 109);
INSERT INTO PATIENT VALUES(59, 1, 1, '환자59', '11111159', 'Male', '환자 주소59', 'O', 1804, 74, '010-3333-1159', 110);
INSERT INTO PATIENT VALUES(60, 1, 1, '환자60', '11111160', 'Female', '환자 주소60', 'AB', 167, 67, '010-3333-1160', 111);


INSERT INTO USER VALUE(1, 'adminId1', 'adminPW1', 'admin');

INSERT INTO USER VALUES (2, 'doctorId1', 'doctorPW1', 'doctor');
INSERT INTO USER VALUES (3, 'doctorId2', 'doctorPW2', 'doctor');
INSERT INTO USER VALUES (4, 'doctorId3', 'doctorPW3', 'doctor');
INSERT INTO USER VALUES (5, 'doctorId4', 'doctorPW4', 'doctor');
INSERT INTO USER VALUES (6, 'doctorId5', 'doctorPW5', 'doctor');
INSERT INTO USER VALUES (7, 'doctorId6', 'doctorPW6', 'doctor');
INSERT INTO USER VALUES (8, 'doctorId7', 'doctorPW7', 'doctor');
INSERT INTO USER VALUES (9, 'doctorId8', 'doctorPW8', 'doctor');
INSERT INTO USER VALUES (10, 'doctorId9', 'doctorPW9', 'doctor');
INSERT INTO USER VALUES (11, 'doctorId10', 'doctorPW10', 'doctor');
INSERT INTO USER VALUES (12, 'doctorId11', 'doctorPW11', 'doctor');
INSERT INTO USER VALUES (13, 'doctorId12', 'doctorPW12', 'doctor');
INSERT INTO USER VALUES (14, 'doctorId13', 'doctorPW13', 'doctor');
INSERT INTO USER VALUES (15, 'doctorId14', 'doctorPW14', 'doctor');
INSERT INTO USER VALUES (16, 'doctorId15', 'doctorPW15', 'doctor');
INSERT INTO USER VALUES (17, 'doctorId16', 'doctorPW16', 'doctor');
INSERT INTO USER VALUES (18, 'doctorId17', 'doctorPW17', 'doctor');
INSERT INTO USER VALUES (19, 'doctorId18', 'doctorPW18', 'doctor');
INSERT INTO USER VALUES (20, 'doctorId19', 'doctorPW19', 'doctor');
INSERT INTO USER VALUES (21, 'doctorId20', 'doctorPW20', 'doctor');

INSERT INTO USER VALUES (22, 'nurseId1', 'nursePW1', 'nurse');
INSERT INTO USER VALUES (23, 'nurseId2', 'nursePW2', 'nurse');
INSERT INTO USER VALUES (24, 'nurseId3', 'nursePW3', 'nurse');
INSERT INTO USER VALUES (25, 'nurseId4', 'nursePW4', 'nurse');
INSERT INTO USER VALUES (26, 'nurseId5', 'nursePW5', 'nurse');
INSERT INTO USER VALUES (27, 'nurseId6', 'nursePW6', 'nurse');
INSERT INTO USER VALUES (28, 'nurseId7', 'nursePW7', 'nurse');
INSERT INTO USER VALUES (29, 'nurseId8', 'nursePW8', 'nurse');
INSERT INTO USER VALUES (30, 'nurseId9', 'nursePW9', 'nurse');
INSERT INTO USER VALUES (31, 'nurseId10', 'nursePW10', 'nurse');
INSERT INTO USER VALUES (32, 'nurseId11', 'nursePW11', 'nurse');
INSERT INTO USER VALUES (33, 'nurseId12', 'nursePW12', 'nurse');
INSERT INTO USER VALUES (34, 'nurseId13', 'nursePW13', 'nurse');
INSERT INTO USER VALUES (35, 'nurseId14', 'nursePW14', 'nurse');
INSERT INTO USER VALUES (36, 'nurseId15', 'nursePW15', 'nurse');
INSERT INTO USER VALUES (37, 'nurseId16', 'nursePW16', 'nurse');
INSERT INTO USER VALUES (38, 'nurseId17', 'nursePW17', 'nurse');
INSERT INTO USER VALUES (39, 'nurseId18', 'nursePW18', 'nurse');
INSERT INTO USER VALUES (40, 'nurseId19', 'nursePW19', 'nurse');
INSERT INTO USER VALUES (41, 'nurseId20', 'nursePW20', 'nurse');
INSERT INTO USER VALUES (42, 'nurseId21', 'nursePW21', 'nurse');
INSERT INTO USER VALUES (43, 'nurseId22', 'nursePW22', 'nurse');
INSERT INTO USER VALUES (44, 'nurseId23', 'nursePW23', 'nurse');
INSERT INTO USER VALUES (45, 'nurseId24', 'nursePW24', 'nurse');
INSERT INTO USER VALUES (46, 'nurseId25', 'nursePW25', 'nurse');
INSERT INTO USER VALUES (47, 'nurseId26', 'nursePW26', 'nurse');
INSERT INTO USER VALUES (48, 'nurseId27', 'nursePW27', 'nurse');
INSERT INTO USER VALUES (49, 'nurseId28', 'nursePW28', 'nurse');
INSERT INTO USER VALUES (50, 'nurseId29', 'nursePW29', 'nurse');
INSERT INTO USER VALUES (51, 'nurseId30', 'nursePW30', 'nurse');

INSERT INTO USER VALUES (52, 'patientId1', 'patientPW1', 'patient');
INSERT INTO USER VALUES (53, 'patientId2', 'patientPW2', 'patient');
INSERT INTO USER VALUES (54, 'patientId3', 'patientPW3', 'patient');
INSERT INTO USER VALUES (55, 'patientId4', 'patientPW4', 'patient');
INSERT INTO USER VALUES (56, 'patientId5', 'patientPW5', 'patient');
INSERT INTO USER VALUES (57, 'patientId6', 'patientPW6', 'patient');
INSERT INTO USER VALUES (58, 'patientId7', 'patientPW7', 'patient');
INSERT INTO USER VALUES (59, 'patientId8', 'patientPW8', 'patient');
INSERT INTO USER VALUES (60, 'patientId9', 'patientPW9', 'patient');
INSERT INTO USER VALUES (61, 'patientId10', 'patientPW10', 'patient');
INSERT INTO USER VALUES (62, 'patientId11', 'patientPW11', 'patient');
INSERT INTO USER VALUES (63, 'patientId12', 'patientPW12', 'patient');
INSERT INTO USER VALUES (64, 'patientId13', 'patientPW13', 'patient');
INSERT INTO USER VALUES (65, 'patientId14', 'patientPW14', 'patient');
INSERT INTO USER VALUES (66, 'patientId15', 'patientPW15', 'patient');
INSERT INTO USER VALUES (67, 'patientId16', 'patientPW16', 'patient');
INSERT INTO USER VALUES (68, 'patientId17', 'patientPW17', 'patient');
INSERT INTO USER VALUES (69, 'patientId18', 'patientPW18', 'patient');
INSERT INTO USER VALUES (70, 'patientId19', 'patientPW19', 'patient');
INSERT INTO USER VALUES (71, 'patientId20', 'patientPW20', 'patient');
INSERT INTO USER VALUES (72, 'patientId21', 'patientPW21', 'patient');
INSERT INTO USER VALUES (73, 'patientId22', 'patientPW22', 'patient');
INSERT INTO USER VALUES (74, 'patientId23', 'patientPW23', 'patient');
INSERT INTO USER VALUES (75, 'patientId24', 'patientPW24', 'patient');
INSERT INTO USER VALUES (76, 'patientId25', 'patientPW25', 'patient');
INSERT INTO USER VALUES (77, 'patientId26', 'patientPW26', 'patient');
INSERT INTO USER VALUES (78, 'patientId27', 'patientPW27', 'patient');
INSERT INTO USER VALUES (79, 'patientId28', 'patientPW28', 'patient');
INSERT INTO USER VALUES (80, 'patientId29', 'patientPW29', 'patient');
INSERT INTO USER VALUES (81, 'patientId30', 'patientPW30', 'patient');
INSERT INTO USER VALUES (82, 'patientId31', 'patientPW31', 'patient');
INSERT INTO USER VALUES (83, 'patientId32', 'patientPW32', 'patient');
INSERT INTO USER VALUES (84, 'patientId33', 'patientPW33', 'patient');
INSERT INTO USER VALUES (85, 'patientId34', 'patientPW34', 'patient');
INSERT INTO USER VALUES (86, 'patientId35', 'patientPW35', 'patient');
INSERT INTO USER VALUES (87, 'patientId36', 'patientPW36', 'patient');
INSERT INTO USER VALUES (88, 'patientId37', 'patientPW37', 'patient');
INSERT INTO USER VALUES (89, 'patientId38', 'patientPW38', 'patient');
INSERT INTO USER VALUES (90, 'patientId39', 'patientPW39', 'patient');
INSERT INTO USER VALUES (91, 'patientId40', 'patientPW40', 'patient');
INSERT INTO USER VALUES (92, 'patientId41', 'patientPW41', 'patient');
INSERT INTO USER VALUES (93, 'patientId42', 'patientPW42', 'patient');
INSERT INTO USER VALUES (94, 'patientId43', 'patientPW43', 'patient');
INSERT INTO USER VALUES (95, 'patientId44', 'patientPW44', 'patient');
INSERT INTO USER VALUES (96, 'patientId45', 'patientPW45', 'patient');
INSERT INTO USER VALUES (97, 'patientId46', 'patientPW46', 'patient');
INSERT INTO USER VALUES (98, 'patientId47', 'patientPW47', 'patient');
INSERT INTO USER VALUES (99, 'patientId48', 'patientPW48', 'patient');
INSERT INTO USER VALUES (100, 'patientId49', 'patientPW49', 'patient');
INSERT INTO USER VALUES (101, 'patientId50', 'patientPW50', 'patient');
INSERT INTO USER VALUES (102, 'patientId51', 'patientPW51', 'patient');
INSERT INTO USER VALUES (103, 'patientId52', 'patientPW52', 'patient');
INSERT INTO USER VALUES (104, 'patientId53', 'patientPW53', 'patient');
INSERT INTO USER VALUES (105, 'patientId54', 'patientPW54', 'patient');
INSERT INTO USER VALUES (106, 'patientId55', 'patientPW55', 'patient');
INSERT INTO USER VALUES (107, 'patientId56', 'patientPW56', 'patient');
INSERT INTO USER VALUES (108, 'patientId57', 'patientPW57', 'patient');
INSERT INTO USER VALUES (109, 'patientId58', 'patientPW58', 'patient');
INSERT INTO USER VALUES (110, 'patientId59', 'patientPW59', 'patient');
INSERT INTO USER VALUES (111, 'patientId60', 'patientPW60', 'patient');




INSERT INTO MEDICAL_SPECIALTY VALUES(null, 'Cardiology', '032-111-1111');
INSERT INTO MEDICAL_SPECIALTY VALUES(null, 'Orthopedics', '032-111-1112');
INSERT INTO MEDICAL_SPECIALTY VALUES(null, 'Dermatology', '032-111-1113');
INSERT INTO MEDICAL_SPECIALTY VALUES(null, 'Neurology', '032-111-1114');

INSERT INTO INPATIENT VALUES(null, 5, 'Room 101', '2023-11-01 10:00:00', '2023-12-01 15:00:00');
INSERT INTO INPATIENT VALUES(null, 10, 'Room 101', '2023-11-03 10:00:00', '2023-12-03 15:00:00');
INSERT INTO INPATIENT VALUES(null, 15, 'Room 101', '2023-11-05 10:00:00', '2023-12-05 15:00:00');
INSERT INTO INPATIENT VALUES(null, 20, 'Room 102', '2023-11-06 10:00:00', '2023-12-06 15:00:00');
INSERT INTO INPATIENT VALUES(null, 25, 'Room 102', '2023-11-07 10:00:00', '2023-12-07 15:00:00');
INSERT INTO INPATIENT VALUES(null, 30, 'Room 102', '2023-11-11 10:00:00', '2023-12-11 15:00:00');
INSERT INTO INPATIENT VALUES(null, 35, 'Room 103', '2023-11-15 10:00:00', '2023-12-15 15:00:00');
INSERT INTO INPATIENT VALUES(null, 40, 'Room 103', '2023-11-18 10:00:00', '2023-12-18 15:00:00');
INSERT INTO INPATIENT VALUES(null, 45, 'Room 103', '2023-11-20 10:00:00', '2023-12-20 15:00:00');
INSERT INTO INPATIENT VALUES(null, 50, 'Room 103', '2023-11-21 10:00:00', '2023-12-21 15:00:00');

INSERT INTO RESERVATION VALUES(null, '2023-12-20 14:00:00', 1, 1);
INSERT INTO RESERVATION VALUES(null, '2023-12-25 10:00:00', 2, 1);

INSERT INTO EXAMINATION VALUES(null, '2023-04-01 09:00:00', 'Heart checkup', 1, 1);
INSERT INTO EXAMINATION VALUES(null, '2023-05-01 13:30:00', 'X-ray', 2, 1);

INSERT INTO TREATMENT VALUES(null, '2023-06-01 11:00:00', 'Administer medication', 1, 1);
INSERT INTO TREATMENT VALUES(null, '2023-07-01 15:45:00', 'Physical therapy', 1, 1);

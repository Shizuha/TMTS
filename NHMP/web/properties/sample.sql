DROP TABLE EMPMENT;

CREATE TABLE EMPMENT(
  EMPMENT_CODE VARCHAR2(10) PRIMARY KEY,
  EMPMENT_NAME VARCHAR2(10) NOT NULL
);

COMMENT ON TABLE EMPMENT IS '��������';
COMMENT ON COLUMN EMPMENT.EMPMENT_CODE IS '�����ڵ�';
COMMENT ON COLUMN EMPMENT.EMPMENT_NAME IS '���������̸�';

DROP TABLE DEDUCTION;

CREATE TABLE DEDUCTION (
	DEDUCTION_CODE	VARCHAR(15)		PRIMARY KEY,
	DEDUCTION_NO	NUMBER		NOT NULL UNIQUE,
	DEDUCTION_NAME	VARCHAR(100)		NOT NULL,
	DEDUCTION_FORMULA	VARCHAR(1500)		NOT NULL,
	DEDUCTION_ETC	VARCHAR(1000)		NULL
  
);

COMMENT ON TABLE DEDUCTION IS '����';
COMMENT ON COLUMN DEDUCTION.DEDUCTION_CODE IS '�����ڵ�';
COMMENT ON COLUMN DEDUCTION.DEDUCTION_NO IS '������ȣ';
COMMENT ON COLUMN DEDUCTION.DEDUCTION_NAME IS '������';
COMMENT ON COLUMN DEDUCTION.DEDUCTION_FORMULA IS '��������';
COMMENT ON COLUMN DEDUCTION.DEDUCTION_ETC IS '����';


DROP TABLE ALLOWANCE;

CREATE TABLE ALLOWANCE (
	ALLOWANCE_CODE	VARCHAR(15)	CONSTRAINT PK_ALLOWANCE_CODE PRIMARY KEY,
	ALLOWANCE_NO	NUMBER		NOT NULL UNIQUE,
	ALLOWANCE_NAME	VARCHAR(100)		NOT NULL,
	ALLOWANCE_FORMULA	VARCHAR(1500)		NOT NULL,
	ALLOWANCE_ETC	VARCHAR(1000)		NULL


);

COMMENT ON TABLE ALLOWANCE IS '����';
COMMENT ON COLUMN ALLOWANCE.ALLOWANCE_CODE IS '�����ڵ�';
COMMENT ON COLUMN ALLOWANCE.ALLOWANCE_NO IS '�����ȣ';
COMMENT ON COLUMN ALLOWANCE.ALLOWANCE_NAME IS '�����';
COMMENT ON COLUMN ALLOWANCE.ALLOWANCE_FORMULA IS '�������';
COMMENT ON COLUMN ALLOWANCE.ALLOWANCE_ETC IS '����';

INSERT INTO ALLOWANCE 
VALUES('su1', 1, '�����󿩱�', '500000', '���� 4�� �������� ����' );
INSERT INTO ALLOWANCE 
VALUES('su2', 2, '�Ĵ�', '300000', '�Ĵ�� 10�������� ������Դϴ�.' );
INSERT INTO ALLOWANCE 
VALUES('su3', 3, '����������', '250000', '����������� 20�������� ������Դϴ�.(������ ���� ������ ��� �ش�)' );
INSERT INTO ALLOWANCE 
VALUES('su4', 4, '���ٷμ���(5��)', '100000', '5���̻� �ٷ��ڵ鿡�� �ش��ϸ� ���� �ٷμ���� �ߺ� �Ұ���' );
INSERT INTO ALLOWANCE 
VALUES('su5', 5, '���ٷμ���(10��)', '200000', '10���̻� �ٷ��ڵ鿡�� �ش��ϸ� ���� �ٷμ���� �ߺ� �Ұ���' );

--select max(DEDUCTION_NO)+1 from DEDUCTION (��ȣ ��������)

DROP TABLE WARD;

CREATE TABLE WARD (
  WARD_CODE VARCHAR2(8) PRIMARY KEY,
  WARD_NAME VARCHAR2(20) NOT NULL UNIQUE
);

COMMENT ON TABLE WARD IS '����';
COMMENT ON COLUMN WARD.WARD_CODE IS '�����ڵ�';
COMMENT ON COLUMN WARD.WARD_NAME IS '������';

DROP TABLE POSITIONS;

CREATE TABLE POSITIONS (
  POS_CODE VARCHAR2(8) PRIMARY KEY,
  POS_NAME VARCHAR2(20) UNIQUE
);

COMMENT ON TABLE POSITIONS IS '����';
COMMENT ON COLUMN POSITIONS.POS_CODE IS '�����ڵ�';
COMMENT ON COLUMN POSITIONS.POS_NAME IS '���޸�';

DROP TABLE DEPARTMENT;

CREATE TABLE DEPARTMENT (
  DEPT_CODE VARCHAR2(20) PRIMARY KEY,
  DEPT_NAME VARCHAR2(20) UNIQUE
);

COMMENT ON TABLE DEPARTMENT IS '��';
COMMENT ON COLUMN DEPARTMENT.DEPT_CODE IS '�μ��ڵ�';
COMMENT ON COLUMN DEPARTMENT.DEPT_NAME IS '����';

DROP TABLE TEAM;

CREATE TABLE TEAM (
  TEAM_CODE VARCHAR2(8) PRIMARY KEY,
  TEAM_NAME VARCHAR2(20) UNIQUE
);

COMMENT ON TABLE TEAM IS '��';
COMMENT ON COLUMN TEAM.TEAM_CODE IS '���ڵ�';
COMMENT ON COLUMN TEAM.TEAM_NAME IS '����';




DROP TABLE AUTHORITY;

CREATE TABLE AUTHORITY (
	AUTHORITY_CODE	VARCHAR2(15)	 UNIQUE,
	AUTHORITY_NAME	VARCHAR2(50)	 NOT NULL,
	AUTHORITY_ETC	VARCHAR(255)	 NOT NULL
);

COMMENT ON TABLE AUTHORITY IS '����';
COMMENT ON COLUMN AUTHORITY.AUTHORITY_CODE IS '�����ڵ�';
COMMENT ON COLUMN AUTHORITY.AUTHORITY_NAME IS '�����̸�';
COMMENT ON COLUMN AUTHORITY.AUTHORITY_ETC IS '���ѳ���';

INSERT INTO AUTHORITY 
VALUES('G1', '�̰�����', '�̰����ڸ� ������� �ϴ� ����');

DROP TABLE HOLD_OFFICE;

CREATE TABLE HOLD_OFFICE(
  HOD_CODE VARCHAR2(10) CONSTRAINT �����ڵ� PRIMARY KEY,
  HOD_NAME VARCHAR2(10) CONSTRAINT �������� CHECK (HOD_NAME IN ('����', '����', '����'))
);
COMMENT ON COLUMN HOLD_OFFICE.HOD_CODE IS '�����ڵ�';
COMMENT ON COLUMN HOLD_OFFICE.HOD_NAME IS '��������';





DROP TABLE EMPLOYEE;

CREATE TABLE EMPLOYEE (
  EMP_ID VARCHAR2(15) PRIMARY KEY,
	EMP_NAME	VARCHAR2(20)	 NOT NULL UNIQUE,
	HIRE_DATE	DATE	 DEFAULT SYSDATE,
	RSN_DATE	DATE DEFAULT SYSDATE,
	EMP_NO	VARCHAR2(14)	 NOT NULL,
	ADDRESS	VARCHAR2(1000)	 NOT NULL,
	ITNAL_FOR	CHAR(9) CONSTRAINT CHK_ITNALFOR CHECK (ITNAL_FOR IN ('������', '�ܱ���')),
	AD_TEL	VARCHAR2(15),
	PHONE	VARCHAR2(15)	 NOT NULL UNIQUE,
	EMAIL	VARCHAR2(40)	 NOT NULL UNIQUE,
	SALARY NUMBER,
	USERID	VARCHAR2(20)	 NOT NULL UNIQUE,
	USERPWD	VARCHAR2(20)	 NOT NULL UNIQUE,
	EMP_ETC	VARCHAR2(1000),
	EMP_IMG_ORIGINAL_FILENAME	VARCHAR2(30)	,
	EMP_IMG_RENAME_FILENAME	VARCHAR2(30)	,
	GENDER  CHAR(1),
	EMPMENT_CODE VARCHAR2(15) CONSTRAINT FK_EMPMEN_CODE 
  REFERENCES EMPMENT ON DELETE CASCADE,
	DEPT_CODE	VARCHAR2(15) CONSTRAINT FK_DEPT_CODE 
  REFERENCES DEPARTMENT ON DELETE CASCADE,
	TEAM_CODE	VARCHAR2(15) CONSTRAINT FK_TEAM_CODE
  REFERENCES TEAM ON DELETE CASCADE,
	POS_CODE  VARCHAR2(15) CONSTRAINT FK_POS_CODE
  REFERENCES POSITIONS ON DELETE CASCADE,
	DEDUCTION_CODE	VARCHAR(15) CONSTRAINT FK_DEDUCTION_CODE
  REFERENCES DEDUCTION ON DELETE CASCADE,
	ALLOWANCE_CODE	VARCHAR(15) CONSTRAINT FK_ALLOWANCE_CODE
  REFERENCES ALLOWANCE (ALLOWANCE_CODE) ON DELETE CASCADE,
	AUTHORITY_CODE	VARCHAR(15) CONSTRAINT FK_AUTHORITY_CODE
  REFERENCES AUTHORITY(AUTHORITY_CODE) ON DELETE CASCADE,
	WARD_CODE	VARCHAR2(8) CONSTRAINT WARD_CODE
  REFERENCES WARD ON DELETE CASCADE,
  HODE_CODE VARCHAR2(15) CONSTRAINT FK_HOD_CODE  
  REFERENCES HOLD_OFFICE ON DELETE CASCADE,
  
 
  CONSTRAINT CHK_GENDER CHECK (GENDER IN ('M', 'F'))
  
);

COMMENT ON TABLE EMPLOYEE IS '����';
COMMENT ON COLUMN EMPLOYEE.EMP_ID IS '���';
COMMENT ON COLUMN EMPLOYEE.EMP_NAME IS '�̸�';
COMMENT ON COLUMN EMPLOYEE.HIRE_DATE IS '������';
COMMENT ON COLUMN EMPLOYEE.RSN_DATE IS '������';
COMMENT ON COLUMN EMPLOYEE.EMP_NO IS '�ֹι�ȣ';
COMMENT ON COLUMN EMPLOYEE.ADDRESS IS '�ּ�';
COMMENT ON COLUMN EMPLOYEE.ITNAL_FOR IS '��/�ܱ���';
COMMENT ON COLUMN EMPLOYEE.AD_TEL IS '��ȭ��ȣ';
COMMENT ON COLUMN EMPLOYEE.PHONE IS '�޴���';
COMMENT ON COLUMN EMPLOYEE.EMAIL IS '�̸���';
COMMENT ON COLUMN EMPLOYEE.SALARY IS '�⺻��';
COMMENT ON COLUMN EMPLOYEE.USERID IS '���̵�';
COMMENT ON COLUMN EMPLOYEE.USERPWD IS '��й�ȣ';
COMMENT ON COLUMN EMPLOYEE.EMP_ETC IS '��Ÿ����';
COMMENT ON COLUMN EMPLOYEE.EMP_IMG_ORIGINAL_FILENAME IS '��������';
COMMENT ON COLUMN EMPLOYEE.EMP_IMG_RENAME_FILENAME IS '��������';
COMMENT ON COLUMN EMPLOYEE.GENDER IS '����';
COMMENT ON COLUMN EMPLOYEE.EMPMENT_CODE IS '�����ڵ�';
COMMENT ON COLUMN EMPLOYEE.DEPT_CODE IS '�μ��ڵ�';
COMMENT ON COLUMN EMPLOYEE.TEAM_CODE IS '���ڵ�';
COMMENT ON COLUMN EMPLOYEE.POS_CODE IS '�����ڵ�';
COMMENT ON COLUMN EMPLOYEE.DEDUCTION_CODE IS '�����ڵ�';
COMMENT ON COLUMN EMPLOYEE.ALLOWANCE_CODE IS '�����ڵ�';
COMMENT ON COLUMN EMPLOYEE.AUTHORITY_CODE IS '�����ڵ�';
COMMENT ON COLUMN EMPLOYEE.WARD_CODE IS '�����ڵ�';

DROP SEQUENCE SEQ_EMP_ID;

CREATE SEQUENCE SEQ_EMP_ID
START WITH 100
NOMAXVALUE
NOCYCLE
NOCACHE
INCREMENT BY 1;



DROP TABLE EMPSALARY;

CREATE TABLE EMPSALARY(
    EMP_ID VARCHAR2(15) CONSTRAINT UNI_EMP_IDS UNIQUE,--���
    EMENT_INRANCE VARCHAR2(8),--���뺸��
    NAT_PENSION VARCHAR2 (8),--���ο���
   HEAL_INRANCE VARCHAR2(8),--�ǰ�����
   HEAL_RDC NUMBER ,--�ǰ����� �����ۼ�Ʈ%
   OLD_INRANCE VARCHAR2(8),--��������纸��
   OLD_RDC NUMBER, --��������纸�� �����ۼ�Ʈ%
   EAR_INCOME VARCHAR2(8),-- �ٷμҵ���
   EAR_INRANCE NUMBER,--�ٷμҵ��� �����ۼ�Ʈ%
   BSN_INCOME VARCHAR2(8),--����ҵ���
   DAILY_JOB VARCHAR2(8), --�Ͽ���
   ETC_INCOME VARCHAR2(8), --��Ÿ�ҵ���
   EAR_BSN_INCOME VARCHAR2(8),--�ٷ�/����ҵ���
   CONSTRAINT FK_EMP_IDS  FOREIGN KEY(EMP_ID) REFERENCES EMPLOYEE ON DELETE CASCADE
);

COMMENT ON TABLE EMPSALARY IS '�޿�����';
COMMENT ON COLUMN EMPSALARY.EMENT_INRANCE IS '���뺸��';
COMMENT ON COLUMN EMPSALARY.NAT_PENSION IS '���ο���';
COMMENT ON COLUMN EMPSALARY.HEAL_INRANCE IS '�ǰ�����';
COMMENT ON COLUMN EMPSALARY.HEAL_RDC IS '�ǰ����� �����ۼ�Ʈ';
COMMENT ON COLUMN EMPSALARY.OLD_INRANCE IS '��������纸��';
COMMENT ON COLUMN EMPSALARY.OLD_RDC IS '��������纸�� �����ۼ�Ʈ';
COMMENT ON COLUMN EMPSALARY.EAR_INCOME IS '�ٷμҵ���';
COMMENT ON COLUMN EMPSALARY.EAR_INRANCE IS '�ٷμҵ��� �����ۼ�Ʈ';
COMMENT ON COLUMN EMPSALARY.BSN_INCOME IS '����ҵ���';
COMMENT ON COLUMN EMPSALARY.DAILY_JOB IS '�Ͽ���';
COMMENT ON COLUMN EMPSALARY.ETC_INCOME IS '��Ÿ�ҵ���';
COMMENT ON COLUMN EMPSALARY.EAR_BSN_INCOME IS '�ٷ�/����ҵ���';






DROP TABLE DEPENDENTS;

CREATE TABLE DEPENDENTS (
  DPEN_CODE VARCHAR2(20) PRIMARY KEY,
  RSHIP VARCHAR2(20) NOT NULL,
  F_NAME VARCHAR2(20) NOT NULL,
  ITNAL_FOR CHAR(9),
  DIBILITY CHAR(1),
  H_ISC CHAR(1),
  I_TOGETHER CHAR(1),
  M_CHILD CHAR(1),
  DEP_ID VARCHAR2(15),
  
  CONSTRAINT CHK_DEP_ITNAL_FOR CHECK (ITNAL_FOR IN ('������', '�ܱ���')),
  CONSTRAINT CHK_DEP_DIBILITY CHECK (DIBILITY IN ('Y', 'N')),
  CONSTRAINT CHK_DEP_H_ISC CHECK (H_ISC IN ('Y', 'N')),
  CONSTRAINT CHK_DEP_I_TOGETHER CHECK (I_TOGETHER IN ('Y', 'N')),
  CONSTRAINT CHK_DEP_M_CHILD CHECK (M_CHILD IN ('Y', 'N')),
  CONSTRAINTS FK_DEP_ID FOREIGN KEY (DEP_ID)
  REFERENCES EMPLOYEE (EMP_ID) ON DELETE CASCADE
);

COMMENT ON TABLE DEPENDENTS IS '�ξ簡��';
COMMENT ON COLUMN DEPENDENTS.DPEN_CODE IS '�ξ簡���ڵ�';
COMMENT ON COLUMN DEPENDENTS.RSHIP IS '������ ����';
COMMENT ON COLUMN DEPENDENTS.F_NAME IS '����';
COMMENT ON COLUMN DEPENDENTS.ITNAL_FOR IS '��/�ܱ��� ����';
COMMENT ON COLUMN DEPENDENTS.DIBILITY IS '��ֿ���';
COMMENT ON COLUMN DEPENDENTS.H_ISC IS '�ǰ����迩��';
COMMENT ON COLUMN DEPENDENTS.I_TOGETHER IS '���ſ���';
COMMENT ON COLUMN DEPENDENTS.M_CHILD IS '���ڳ�����';
COMMENT ON COLUMN DEPENDENTS.DEP_ID IS '�����ȣ';

DROP SEQUENCE DPEN_SEQ_CODE;

CREATE SEQUENCE DPEN_SEQ_CODE
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE
INCREMENT BY 1;


DROP TABLE EDUCATION;

CREATE TABLE EDUCATION (
  EDU_CODE VARCHAR2(20) PRIMARY KEY,
  ITNAL_FOR CHAR(20),
  AD_DATE VARCHAR2(30),
  GR_DATE VARCHAR2(30),
  SCH_NAME VARCHAR2(20) NOT NULL,
  MAJOR VARCHAR2(20) NOT NULL,
  TAKING VARCHAR2(10) NOT NULL,
  EDU_ID VARCHAR2(25),
  
  CONSTRAINTS FK_EDU_ID FOREIGN KEY (EDU_ID)
  REFERENCES EMPLOYEE (EMP_ID) ON DELETE CASCADE
);

COMMENT ON TABLE EDUCATION IS '�з�����';
COMMENT ON COLUMN EDUCATION.EDU_CODE IS '�з��ڵ�';
COMMENT ON COLUMN EDUCATION.ITNAL_FOR IS '�з� ����';
COMMENT ON COLUMN EDUCATION.AD_DATE IS '���г��';
COMMENT ON COLUMN EDUCATION.GR_DATE IS '�������';
COMMENT ON COLUMN EDUCATION.SCH_NAME IS '�б���';
COMMENT ON COLUMN EDUCATION.MAJOR IS '����';
COMMENT ON COLUMN EDUCATION.TAKING IS '�̼�����';
COMMENT ON COLUMN EDUCATION.EDU_ID IS '���';

DROP SEQUENCE EDU_SEQ_CODE;

CREATE SEQUENCE EDU_SEQ_CODE
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE
INCREMENT BY 1;


DROP TABLE CAREER;

CREATE TABLE CAREER (
  CAR_CODE VARCHAR2(20) PRIMARY KEY,
  CAR_ID VARCHAR2(15),
  COM_NAME VARCHAR2(30) NOT NULL,
  HIRE_DATE VARCHAR2(50) NOT NULL,
  LAST_DATE VARCHAR2(50) NOT NULL,
  WORK_TEAM VARCHAR2(50) NOT NULL,
  LAST_POSITION VARCHAR2(50) NOT NULL,
  RES_BILTIES VARCHAR2(20) NOT NULL,
  LEAVE_REASON VARCHAR2(1000) NOT NULL,
 CONSTRAINTS FK_CAR_ID FOREIGN KEY (CAR_ID)
  REFERENCES EMPLOYEE (EMP_ID) ON DELETE CASCADE
);

COMMENT ON TABLE CAREER IS '��»���';
COMMENT ON COLUMN CAREER.CAR_CODE IS '����ڵ�';
COMMENT ON COLUMN CAREER.CAR_ID IS '���';
COMMENT ON COLUMN CAREER.COM_NAME IS 'ȸ���';
COMMENT ON COLUMN CAREER.HIRE_DATE IS '�Ի�����';
COMMENT ON COLUMN CAREER.LAST_DATE IS '�������';
COMMENT ON COLUMN CAREER.WORK_TEAM IS '�ٹ��Ⱓ';
COMMENT ON COLUMN CAREER.LAST_POSITION IS '��������';
COMMENT ON COLUMN CAREER.RES_BILTIES IS '�������';
COMMENT ON COLUMN CAREER.LEAVE_REASON IS '������';

DROP SEQUENCE CAR_SEQ_CODE;

CREATE SEQUENCE CAR_SEQ_CODE
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE
INCREMENT BY 1;


DROP TABLE PATIENT;

CREATE TABLE PATIENT (
  PAT_NUM NUMBER PRIMARY KEY,
  PAT_NAME VARCHAR(20) NOT NULL UNIQUE,
  PAT_TYPE VARCHAR2(20),
  PAT_ENTDATE DATE DEFAULT SYSDATE,
  PAT_OUTDATE DATE DEFAULT SYSDATE,
  PAT_GENDER CHAR(1),
  PAT_NO CHAR(14) NOT NULL UNIQUE,
  ADDRESS VARCHAR2(100) NOT NULL,
  FAMILY VARCHAR2(20) NOT NULL,
  EMAIL VARCHAR2(30),
  PAT_PHONE VARCHAR2(15) NOT NULL UNIQUE,
  WARD VARCHAR2(30) NOT NULL,
  PAT_DOC VARCHAR2(40) NOT NULL,
  
  CONSTRAINT CHK_PAT_GENDER CHECK (PAT_GENDER IN ('M', 'F'))
);

COMMENT ON TABLE PATIENT IS 'ȯ��';
COMMENT ON COLUMN PATIENT.PAT_NUM IS '���Ϲ�ȣ';
COMMENT ON COLUMN PATIENT.PAT_NAME IS 'ȯ�ڸ�';
COMMENT ON COLUMN PATIENT.PAT_TYPE IS '����';
COMMENT ON COLUMN PATIENT.PAT_ENTDATE IS '�Կ���¥';
COMMENT ON COLUMN PATIENT.PAT_OUTDATE IS '�����¥';
COMMENT ON COLUMN PATIENT.PAT_GENDER IS 'ȯ�ڼ���';
COMMENT ON COLUMN PATIENT.PAT_NO IS '�ֹι�ȣ';
COMMENT ON COLUMN PATIENT.ADDRESS IS '�ּ�';
COMMENT ON COLUMN PATIENT.FAMILY IS '��ȣ�ڸ�';
COMMENT ON COLUMN PATIENT.EMAIL IS '�̸���';
COMMENT ON COLUMN PATIENT.PAT_PHONE IS '��ȭ��ȣ';
COMMENT ON COLUMN PATIENT.WARD IS '����';
COMMENT ON COLUMN PATIENT.PAT_DOC IS '����ǻ�';

DROP SEQUENCE PAT_SEQ;

CREATE SEQUENCE PAT_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE
NOCYCLE;

DROP TABLE MEDICIENRECORD;

CREATE TABLE MEDICIENRECORD (
  MR_NO NUMBER PRIMARY KEY,
  MR_DATE DATE DEFAULT SYSDATE,
  MR_STATE VARCHAR2(1000) NOT NULL,
  MR_NAME VARCHAR2(30) NOT NULL,
  MR_TIME VARCHAR2(20) NOT NULL,
  MR_MANY VARCHAR2(50) NOT NULL,
  MR_COMMENT VARCHAR2(500),
  MR_PAT_NAME VARCHAR2(20),
  MR_EMP_NAME VARCHAR2(20),
  
  CONSTRAINTS FK_MR_PAT_NAME FOREIGN KEY (MR_PAT_NAME)
  REFERENCES PATIENT (PAT_NAME),
  CONSTRAINTS FK_MR_EMP_NAME FOREIGN KEY (MR_EMP_NAME)
  REFERENCES EMPLOYEE (EMP_NAME)
);

COMMENT ON TABLE MEDICIENRECORD IS '��������';
COMMENT ON COLUMN MEDICIENRECORD.MR_NO IS '����������ȣ';
COMMENT ON COLUMN MEDICIENRECORD.MR_DATE IS '��¥';
COMMENT ON COLUMN MEDICIENRECORD.MR_STATE IS '����';
COMMENT ON COLUMN MEDICIENRECORD.MR_NAME IS '�����';
COMMENT ON COLUMN MEDICIENRECORD.MR_TIME IS '����ð�';
COMMENT ON COLUMN MEDICIENRECORD.MR_MANY IS '�뷮';
COMMENT ON COLUMN MEDICIENRECORD.MR_COMMENT IS '���';
COMMENT ON COLUMN MEDICIENRECORD.MR_PAT_NAME IS 'ȯ�ڸ�';
COMMENT ON COLUMN MEDICIENRECORD.MR_EMP_NAME IS '������';

DROP SEQUENCE MR_SEQ;

CREATE SEQUENCE MR_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE
NOCYCLE;

DROP TABLE COUNSELINGLOG;

CREATE TABLE COUNSELINGLOG (
  CL_NO NUMBER PRIMARY KEY,
  CL_TITLE VARCHAR2(500) NOT NULL,
  CL_DATE DATE DEFAULT SYSDATE,
  CL_CONTENTS VARCHAR2(1000) NOT NULL,
  CL_PHONE VARCHAR2(15) NOT NULL,
  CL_COMMENT VARCHAR2(500),
  CL_PAT_NAME VARCHAR2(20),
  CL_EMP_NAME VARCHAR2(20),
  CL_ORIGINAL_FILENAME VARCHAR2(100),
  CL_RENAME_FILENAME VARCHAR2(100),
  
  CONSTRAINTS FK_CL_PAT_NAME FOREIGN KEY (CL_PAT_NAME)
  REFERENCES PATIENT (PAT_NAME),
  CONSTRAINTS FK_CL_EMP_NAME FOREIGN KEY (CL_EMP_NAME)
  REFERENCES EMPLOYEE (EMP_NAME)
);

COMMENT ON TABLE COUNSELINGLOG IS '�������';
COMMENT ON COLUMN COUNSELINGLOG.CL_NO IS '���������ȣ';
COMMENT ON COLUMN COUNSELINGLOG.CL_TITLE IS '����';
COMMENT ON COLUMN COUNSELINGLOG.CL_DATE IS '��¥';
COMMENT ON COLUMN COUNSELINGLOG.CL_CONTENTS IS '����';
COMMENT ON COLUMN COUNSELINGLOG.CL_PHONE IS '����ó';
COMMENT ON COLUMN COUNSELINGLOG.CL_COMMENT IS '���';
COMMENT ON COLUMN COUNSELINGLOG.CL_PAT_NAME IS 'ȯ�ڸ�';
COMMENT ON COLUMN COUNSELINGLOG.CL_EMP_NAME IS '�����';
COMMENT ON COLUMN COUNSELINGLOG.CL_ORIGINAL_FILENAME IS '����÷������';
COMMENT ON COLUMN COUNSELINGLOG.CL_RENAME_FILENAME IS '�����÷������';

DROP SEQUENCE CL_SEQ;

CREATE SEQUENCE CL_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE
NOCYCLE;

--DATAROOM_COUNT �� ����Ʈ�� �߰�

DROP TABLE DATAROOM;

CREATE TABLE DATAROOM (
   DATAROOM_NO   NUMBER      PRIMARY KEY,
   DATAROOM_TITLE   VARCHAR2(1000)   NOT NULL,
   DATAROOM_CONTENT VARCHAR2(4000),
   DATAROOM_DATE DATE   DEFAULT SYSDATE,
   DATAROOM_COUNT   NUMBER   DEFAULT 0,
   DATAROOM_FILE_NAME VARCHAR2(500) ,
   DATAROOM_WRITER   VARCHAR2(20)  NOT NULL,
   
   CONSTRAINTS FK_DATAROOM_WRITER FOREIGN KEY (DATAROOM_WRITER) 
   REFERENCES EMPLOYEE (EMP_NAME)
);

COMMENT ON TABLE DATAROOM IS '�ڷ��';
COMMENT ON COLUMN DATAROOM.DATAROOM_NO IS '�ڷ�� ��ȣ';
COMMENT ON COLUMN DATAROOM.DATAROOM_TITLE IS '�ڷ�� ����';
COMMENT ON COLUMN DATAROOM.DATAROOM_CONTENT IS '�ڷ�� ����';
COMMENT ON COLUMN DATAROOM.DATAROOM_DATE IS '�ڷ�� �ۼ���';
COMMENT ON COLUMN DATAROOM.DATAROOM_COUNT IS '�ڷ�� ��ȸ��';
COMMENT ON COLUMN DATAROOM.DATAROOM_FILE_NAME IS '�ڷ�� ��������';
COMMENT ON COLUMN DATAROOM.DATAROOM_WRITER IS '�ۼ���';


DROP SEQUENCE DATAROOM_SEQ;

CREATE SEQUENCE DATAROOM_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP TABLE CAUTHORITY;

CREATE TABLE CAUTHORITY (
  AUTHORITY_CODE VARCHAR2(15) PRIMARY KEY,
  AUTHORITY_NAME VARCHAR2(300) NOT NULL,
  AUTHORITY_ETC VARCHAR2(4000) NOT NULL,
  AUTHORITY_MENU VARCHAR2(1000) NOT NULL
  
  --CONSTRAINT CHK_AUTHORITY_MENU CHECK (AUTHORITY_MENU IN ('�λ����', '���Ѽ���', 'ȯ�ڰ���', '�޿�����','��������','�ڷ��'))
);

COMMENT ON TABLE CAUTHORITY IS 'Ŭ���� ����';
COMMENT ON COLUMN CAUTHORITY.AUTHORITY_CODE IS '�����ڵ�';
COMMENT ON COLUMN CAUTHORITY.AUTHORITY_NAME IS '�����̸�';
COMMENT ON COLUMN CAUTHORITY.AUTHORITY_ETC IS '����';
COMMENT ON COLUMN CAUTHORITY.AUTHORITY_MENU IS '�޴�����';

INSERT INTO CAUTHORITY 
VALUES('G0', '�̰�����', '�̰�����', 'NULL');


DROP TABLE SERVICE;

CREATE TABLE SERVICE (

  SERVICE_CODE VARCHAR2(15) PRIMARY KEY,
  SERVICE_NAME VARCHAR2(300) NOT NULL,
  SERVICE_ETC VARCHAR2(4000) NOT NULL
  
  --CONSTRAINT CHK_AUTHORITY_MENU CHECK (AUTHORITY_MENU IN ('�λ����', '���Ѽ���', 'ȯ�ڰ���', '�޿�����','��������','�ڷ��'))
);

COMMENT ON TABLE SERVICE IS '���� ����';
COMMENT ON COLUMN SERVICE.SERVICE_CODE IS '�����ڵ�';
COMMENT ON COLUMN SERVICE.SERVICE_NAME IS '�����̸�';
COMMENT ON COLUMN SERVICE.SERVICE_ETC IS '����';

INSERT INTO SERVICE 
VALUES('GS0', '���� �̽�û', '���� �̽�û��');
INSERT INTO SERVICE 
VALUES('GS1', '���� ��û ���', '���� ��û �����');
INSERT INTO SERVICE 
VALUES('GS2', '���� ��û', '���� ��û��');
INSERT INTO SERVICE 
VALUES('GS3', 'basic', '���� ��û��');
INSERT INTO SERVICE 
VALUES('GS4', 'advanced', '���� ��û��');
INSERT INTO SERVICE 
VALUES('GS5', 'premium', '���� ��û��');



DROP TABLE NURSING_HOSPITAL;

CREATE TABLE NURSING_HOSPITAL (
  NH_ID NUMBER PRIMARY KEY,
  NH_NAME VARCHAR2(20) NOT NULL UNIQUE,
  NH_DATE DATE DEFAULT SYSDATE,
  NH_RSN_DATE DATE DEFAULT SYSDATE,
  NH_NO VARCHAR2(20) NOT NULL,
  NH_ADDRESS VARCHAR2(150) NOT NULL,
  NH_ITNAL_FOR CHAR(1),
  NH_AD_TEL VARCHAR2(15),
  NH_PHONE VARCHAR2(15) NOT NULL UNIQUE,
  NH_EMAIL VARCHAR2(40) NOT NULL,
  NH_USERID VARCHAR2(20) NOT NULL UNIQUE,
  NH_USERPWD VARCHAR2(20) NOT NULL,
  NH_ETC VARCHAR2(1000),
  NH_IMG VARCHAR2(30),
  GENDER CHAR(1),
  COMPANY_NAME VARCHAR2(100) NOT NULL,
  COMPANY_NO VARCHAR2(30) NOT NULL,
  NH_SERVICE_CODE VARCHAR2(20)  Default 'GS0',
  NH_AUTHORITY_CODE VARCHAR2(20) Default 'G0',
  NH_SERVICE_HISTORY VARCHAR2(20) DEFAULT 'null',
  
  CONSTRAINT CHK_NH_ITNAL_FOR CHECK (NH_ITNAL_FOR IN ('Y', 'N')),
  CONSTRAINT CHK_NH_GENDER CHECK (GENDER IN ('M', 'F')),
  CONSTRAINTS FK_NH_AUTHORITY_CODE FOREIGN KEY(NH_AUTHORITY_CODE)  REFERENCES CAUTHORITY (AUTHORITY_CODE),
  CONSTRAINTS FK_SERVICE_CODE FOREIGN KEY(NH_SERVICE_CODE) REFERENCES SERVICE (SERVICE_CODE)
);

COMMENT ON TABLE NURSING_HOSPITAL IS '���Կ�纴��';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_ID IS '���';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_NAME IS '�̸�';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_DATE IS '������';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_RSN_DATE IS '������';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_NO IS '�ֹι�ȣ';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_ADDRESS IS '�ּ�';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_ITNAL_FOR IS '��/�ܱ���';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_AD_TEL IS '��ȭ��ȣ';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_PHONE IS '�޴���';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_EMAIL IS '�̸���';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_USERID IS '���̵�';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_USERPWD IS '��й�ȣ';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_ETC IS '��Ÿ����';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_IMG IS '����̹���';
COMMENT ON COLUMN NURSING_HOSPITAL.GENDER IS '����';
COMMENT ON COLUMN NURSING_HOSPITAL.COMPANY_NAME IS 'ȸ���';
COMMENT ON COLUMN NURSING_HOSPITAL.COMPANY_NO IS '����ڵ�Ϲ�ȣ';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_SERVICE_CODE IS '���񽺽�û����';
COMMENT ON COLUMN NURSING_HOSPITAL.NH_AUTHORITY_CODE IS '�����ڵ�';

--�������� ��ġ ����, NOTICE_COUNT   �� ����Ʈ�� �߰�
DROP TABLE NOTICE;

CREATE TABLE NOTICE (
   NOTICE_NO   NUMBER      PRIMARY KEY,
   NOTICE_TITLE   VARCHAR2(1000)   NOT NULL,   
   NOTICE_CONTENT   VARCHAR2(4000),
   NOTICE_COUNT   NUMBER DEFAULT 0,
   NOTICE_DATE   DATE    DEFAULT SYSDATE,
   NOTICE_WRITER VARCHAR2(20) NOT NULL,
   
   CONSTRAINTS FK_NOTICE_WRITER FOREIGN KEY (NOTICE_WRITER) 
   REFERENCES NURSING_HOSPITAL (NH_NAME)
);

COMMENT ON TABLE NOTICE IS '��������'; 
COMMENT ON COLUMN NOTICE.NOTICE_NO IS '�������� ��ȣ';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '�������� ����';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '�������� ����';
COMMENT ON COLUMN NOTICE.NOTICE_COUNT IS '�������� ��ȸ��';
COMMENT ON COLUMN NOTICE.NOTICE_DATE IS '�������� �ۼ���';
COMMENT ON COLUMN NOTICE.NOTICE_WRITER IS '�ۼ���'; 

DROP SEQUENCE NOTICE_SEQ;

CREATE SEQUENCE NOTICE_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;


DROP TABLE QNA;

CREATE TABLE QNA (
  QNA_NO NUMBER PRIMARY KEY,
  QNA_TITLE VARCHAR2(1000) NOT NULL,
  QNA_TYPE VARCHAR2(30),
  QNA_CONTENT VARCHAR2(4000) NOT NULL,
  QNA_COUNT NUMBER,
  QNA_DATE DATE DEFAULT SYSDATE,
  QNA_NH_NAME VARCHAR2(15),
  
  CONSTRAINT CHK_QNA_TYPE CHECK (QNA_TYPE IN ('�̿����', '���񽺰���', '��������', '��Ÿ')),
  CONSTRAINTS FK_NH_NAME FOREIGN KEY (QNA_NH_NAME)
  REFERENCES NURSING_HOSPITAL (NH_NAME)
);

COMMENT ON TABLE QNA IS 'Ŭ����_QNA';
COMMENT ON COLUMN QNA.QNA_NO IS '������ȣ';
COMMENT ON COLUMN QNA.QNA_TITLE IS '����';
COMMENT ON COLUMN QNA.QNA_TYPE IS '����';
COMMENT ON COLUMN QNA.QNA_CONTENT IS '����';
COMMENT ON COLUMN QNA.QNA_COUNT IS '��ȸ��';
COMMENT ON COLUMN QNA.QNA_DATE IS '�ۼ���';
COMMENT ON COLUMN QNA.QNA_NH_NAME IS '�ۼ���';

DROP SEQUENCE SEQ_QNA;

CREATE SEQUENCE SEQ_QNA
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

DROP TABLE COMMENTS;

CREATE TABLE COMMENTS (
  COMMENT_NO NUMBER PRIMARY KEY,
  COMMENT_DATE DATE DEFAULT SYSDATE NOT NULL,
  COMMENT_ETC VARCHAR2(1000) NOT NULL,
  COMMENT_QNA_NO NUMBER,
  COMMENT_NH_NAME VARCHAR2(15),
  
  CONSTRAINTS FK_COMMENT_QNA_NO FOREIGN KEY (COMMENT_QNA_NO)
  REFERENCES QNA (QNA_NO),
  CONSTRAINTS FK_COMMENT_NH_ID FOREIGN KEY (COMMENT_NH_NAME)
  REFERENCES NURSING_HOSPITAL (NH_NAME)
);

COMMENT ON TABLE COMMENTS IS 'Ŭ����_QnA_���';
COMMENT ON COLUMN COMMENTS.COMMENT_NO IS '��� �۹�ȣ';
COMMENT ON COLUMN COMMENTS.COMMENT_DATE IS '�ۼ���¥';
COMMENT ON COLUMN COMMENTS.COMMENT_ETC IS '����';
COMMENT ON COLUMN COMMENTS.COMMENT_QNA_NO IS '���۹�ȣ';
COMMENT ON COLUMN COMMENTS.COMMENT_NH_NAME IS '�ۼ���';

DROP TABLE CNOTICE;

CREATE TABLE CNOTICE (
  NOTICE_NO NUMBER PRIMARY KEY,
  NOTICE_TITLE VARCHAR2(1000) NOT NULL,
  NOTICE_TYPE VARCHAR2(30),
  NOTICE_CONTENT VARCHAR2(4000),
  NOTICE_COUNT NUMBER,
  NOTICE_DATE DATE DEFAULT SYSDATE,
  NOTICE_NH_NAME VARCHAR2(20),
  
  CONSTRAINT CHK_NOTICE_TYPE CHECK (NOTICE_TYPE IN ('��������', '�������', 
                                                                        '�ӽ�����', '�̺�Ʈ', '�˸�')),
  CONSTRAINTS FK_NOTICE_NH_NAME FOREIGN KEY (NOTICE_NH_NAME)
  REFERENCES NURSING_HOSPITAL (NH_NAME)
);

COMMENT ON TABLE CNOTICE IS 'Ŭ���� ��������';
COMMENT ON COLUMN CNOTICE.NOTICE_NO IS '�������׹�ȣ';
COMMENT ON COLUMN CNOTICE.NOTICE_TITLE IS '����';
COMMENT ON COLUMN CNOTICE.NOTICE_TYPE IS '����';
COMMENT ON COLUMN CNOTICE.NOTICE_CONTENT IS '����';
COMMENT ON COLUMN CNOTICE.NOTICE_COUNT IS '��ȸ��';
COMMENT ON COLUMN CNOTICE.NOTICE_DATE IS '�ۼ���';
COMMENT ON COLUMN CNOTICE.NOTICE_NH_NAME IS '�ۼ���';

--Ŭ���� �������� ������
Drop SEQUENCE SEQ_CNOTICE;

CREATE SEQUENCE SEQ_CNOTICE
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE
INCREMENT BY 1;

DROP TABLE CREGISTRATION;

CREATE TABLE CREGISTRATION (
  NH_ID NUMBER PRIMARY KEY,
  FUNCTION_NAME VARCHAR2(500) UNIQUE,
  CREGISTRATION_CHECK CHAR(1),
  
  CONSTRAINT CHK_CREGISTRATION_CHECK CHECK (CREGISTRATION_CHECK IN ('Y','N'))
);

COMMENT ON TABLE CREGISTRATION IS '���񽺽�û';
COMMENT ON COLUMN CREGISTRATION.NH_ID IS '���';
COMMENT ON COLUMN CREGISTRATION.FUNCTION_NAME IS '���';
COMMENT ON COLUMN CREGISTRATION.CREGISTRATION_CHECK IS 'ó������';

--Ķ����
DROP TABLE CALENDAR;

CREATE TABLE CALENDAR (
CAL_NUM NUMBER,
ID_ VARCHAR2(15),
TITLE VARCHAR2(50) NOT NULL,
DESCRIPTION VARCHAR2(1000) NOT NULL,
START_DATE DATE DEFAULT SYSDATE,
END_DATE DATE DEFAULT SYSDATE,
CATE_GORY VARCHAR2(20),
BACKGROUNDCOLOR VARCHAR2(20),
TEXTCOLOR VARCHAR2(20) DEFAULT '#FFFFFF',

CONSTRAINT FK_CALENDAR_ID  FOREIGN KEY(ID_) REFERENCES NURSING_HOSPITAL (NH_USERID)ON DELETE CASCADE,
CONSTRAINT CHK_CATE_GORY CHECK (CATE_GORY IN ('ī�װ���1', 'ī�װ���2', 'ī�װ���3', 'ī�װ���4')));

COMMENT ON TABLE CALENDAR IS 'Ķ����';
COMMENT ON COLUMN CALENDAR.CAL_NUM IS '��ȣ';
COMMENT ON COLUMN CALENDAR.ID_ IS '�����ھ��̵�';
COMMENT ON COLUMN CALENDAR.TITLE IS '����';
COMMENT ON COLUMN CALENDAR.DESCRIPTION IS '����';
COMMENT ON COLUMN CALENDAR.START_DATE IS '��������';
COMMENT ON COLUMN CALENDAR.END_DATE IS '������';
COMMENT ON COLUMN CALENDAR.CATE_GORY IS 'ī�װ���';
COMMENT ON COLUMN CALENDAR.BACKGROUNDCOLOR IS '����';
COMMENT ON COLUMN CALENDAR.TEXTCOLOR IS '���ڻ�';

--Ķ���� ������
Drop SEQUENCE SEQ_CAL;

CREATE SEQUENCE SEQ_CAL
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE
INCREMENT BY 1;

--���⼭���ʹ� ���� �ִ� �� �Դϴ�. employee�� ���� �������� insert�� �ּ���

--���� ����


--���� ����
INSERT INTO DEDUCTION 
VALUES('gong1', 1, '���ο���', '(T01*0.09)*0.5', '���ο��� - �⺻�� * 9% // ����� 4.5% , �ٷ��� 4.5%' );
INSERT INTO DEDUCTION 
VALUES('gong2', 2, '�ǰ�����', '(T01*0.0323)', '�ǰ������ - �⺻��-����� : 6.46% // ����� : 3.23% , �ٷ��� : 3.23%' );
INSERT INTO DEDUCTION 
VALUES('gong3', 3, '����纸��', '(T01*0.0323)*0.0851', '�ǰ������ �ݾ׿� 8.51% // ����� : 50% , �ٹ��� : 50% ' );
INSERT INTO DEDUCTION 
VALUES('gong4', 4, '���뺸��', '(T01*0.008)', '����� : (�������� * 0.8%) + (�������� * 0.25%) , �ٷ��� : �������� * 0.8%' );
--select max(DEDUCTION_NO)+1 from DEDUCTION (��ȣ ��������)


--Ŭ���� ���� ����



INSERT INTO CAUTHORITY 
VALUES('G1', '����', '������', '����');

INSERT INTO CAUTHORITY 
VALUES('G2', '����', '������', '����');

INSERT INTO CAUTHORITY 
VALUES('G3', '�⺻��', 'basic ���', '�λ����,���Ѽ���,ȯ�ڰ���,�޿�����,��������,�ڷ��');
INSERT INTO CAUTHORITY 
VALUES('G4', '������', 'advanced ���', '�λ����,���Ѽ���,�޿�����,��������,�ڷ��');
INSERT INTO CAUTHORITY 
VALUES('G5', '�����̾�', 'premium ���', '�λ����,���Ѽ���,�޿�����,��������,�ڷ��');


-- ���� ����
INSERT INTO WARD
VALUES('BD01', 'KH1����');

INSERT INTO WARD
VALUES('BD02', 'KH2����');

INSERT INTO WARD
VALUES('BD03', 'KH3����');


--������ ����
INSERT INTO NURSING_HOSPITAL 
VALUES(1, '������', DEFAULT, DEFAULT, '000000-0000000', '���ѹα�','Y','010-0000-0000', '010-0000-0000', 
'TMTS@gmail.com','TMTS','TMTS','null','null','M','TMTS','123-12-12345', 'GS2','G1','GS5');
INSERT INTO NURSING_HOSPITAL 
VALUES(2, '������', DEFAULT, DEFAULT, '791010-1234567', '25777����,������ ���ؽ� ����1�� 16-3 �������纴�� ','Y','123-123-1234', '010-1234-4321', 
'naonejang@gmail.com','user01','user01','null','null','M','�������纴��','123-12-12345', 'GS0','G0' ,DEFAULT);

--�� ���� 
INSERT INTO TEAM VALUES('TM1','������ȣ��');
INSERT INTO TEAM VALUES('TM2','�ܷ���ȣ��');
INSERT INTO TEAM VALUES('TM3','������');
INSERT INTO TEAM VALUES('TM4','�ü�������');
INSERT INTO TEAM VALUES('TM5','ȯ����');
INSERT INTO TEAM VALUES('TM6','ȸ����');
INSERT INTO TEAM VALUES('TM7','ȫ����');
INSERT INTO TEAM VALUES('TM8','�λ米����');
INSERT INTO TEAM VALUES('TM9','�����');
INSERT INTO TEAM VALUES('TM10','�ɻ�û����');
INSERT INTO TEAM VALUES('TM11','�ǹ������');
INSERT INTO TEAM VALUES('TM12','�Կ������');
INSERT INTO TEAM VALUES('TM13','��ȭ������');
INSERT INTO TEAM VALUES('TM14','����������');
INSERT INTO TEAM VALUES('TM15','������');
INSERT INTO TEAM VALUES('TM16','����ġ���');
INSERT INTO TEAM VALUES('TM17','��缱��');
INSERT INTO TEAM VALUES('TM18','�ӻ󺴸���');

--������
INSERT INTO DEPARTMENT VALUES('10','�������а�');
INSERT INTO DEPARTMENT VALUES('20','�ܰ�');
INSERT INTO DEPARTMENT VALUES('30','�ѹ��');
INSERT INTO DEPARTMENT VALUES('40','��ȣ��');
INSERT INTO DEPARTMENT VALUES('50','�ѹ���');
INSERT INTO DEPARTMENT VALUES('60','������');

-- ���޻���
INSERT INTO POSITIONS VALUES('PO1','������');
INSERT INTO POSITIONS VALUES('PO2','����');
INSERT INTO POSITIONS VALUES('PO3','���');
INSERT INTO POSITIONS VALUES('PO4','����');
INSERT INTO POSITIONS VALUES('PO5','��ȣ��');
INSERT INTO POSITIONS VALUES('PO6','����ȣ��');
--�����ڵ� ����
INSERT INTO EMPMENT VALUES('EM1','�Ͽ���');
INSERT INTO EMPMENT VALUES('EM2','������');
INSERT INTO EMPMENT VALUES('EM3','������');
INSERT INTO EMPMENT VALUES('EM4','�����');
INSERT INTO EMPMENT VALUES('EM5','�İ���');
INSERT INTO EMPMENT VALUES('EM6','�ӽ���');
INSERT INTO EMPMENT VALUES('EM7','����');

--��������
INSERT INTO HOLD_OFFICE VALUES('HOD1','����');
INSERT INTO HOLD_OFFICE VALUES('HOD2','����');
INSERT INTO HOLD_OFFICE VALUES('HOD3','����');



--���� ����
INSERT INTO EMPLOYEE VALUES(SEQ_EMP_ID.NEXTVAL, 'ȫ�浿', SYSDATE, NULL, '910231-1955513',
'����� ���۱� ����', '�ܱ���', NULL, '010-7644-8787', 'DBH5454@GMAIL.COM',1000000, 
'NHMP_ID1','PASS_PW1', '����', NULL, NULL, 'M', 'EM1', '20','TM1','PO3', 'gong1', 'su1', 'G1', 'BD01','HOD2' );

INSERT INTO EMPLOYEE VALUES(SEQ_EMP_ID.NEXTVAL, '�ڿ���', SYSDATE, NULL, '680211-1936513',
'����� ������ �Ͽ�����', '������', NULL, '010-1126-8153', 'HHH12354@GMAIL.COM',2000000, 
'NHMP_ID2','PASS_PW2', '����', NULL, NULL, 'M', 'EM7', '10','TM2','PO1' , 'gong1', 'su1', 'G1', 'BD01','HOD2' );

INSERT INTO EMPLOYEE VALUES(SEQ_EMP_ID.NEXTVAL, '���ù�', SYSDATE, NULL, '650431-1923513',
'����� ���ı� ������', '������', NULL, '010-1343-1237', 'DBV5222@NAVER.COM', 3000000,
'NHMP_ID3','PASS_PW4', '��������', NULL, NULL, 'M', 'EM6', '40','TM2','PO2', 'gong1', 'su1', 'G1', 'BD01','HOD2'  );

INSERT INTO EMPLOYEE VALUES(SEQ_EMP_ID.NEXTVAL, '������', SYSDATE, NULL, '710911-1235513',
'����� ������ ���浿', '������', NULL, '010-7884-1117', 'DH5674@DAUM.NET',1111111, 
'NHMP_ID4','PASS_PW3', '���Ѵ�', NULL, NULL, 'M', 'EM5', '50','TM18','PO4', 'gong1', 'su1', 'G1', 'BD01','HOD2' );

INSERT INTO EMPLOYEE VALUES(SEQ_EMP_ID.NEXTVAL, '����', SYSDATE, NULL, '610721-1933513',
'����� ����� �����', '������', NULL, '010-7114-3255', 'H88994@GMAIL.COM', 2222222,
'NHMP_ID5','PASS_PW6', '����', NULL, NULL, 'M', 'EM4', '10','TM3', 'PO4', 'gong1', 'su1', 'G1', 'BD01','HOD2' );

INSERT INTO EMPLOYEE VALUES(SEQ_EMP_ID.NEXTVAL, '�����', SYSDATE, NULL, '630231-2451513',
'����� ������ ���', '������', NULL, '010-1264-1187', 'NANA6414@GMAIL.COM', 3333333,
'NHMP_ID6','PASS_PW5', '���Ѵ��Դϴ�.', NULL, NULL, 'F', 'EM3', '20','TM1', 'PO2', 'gong1', 'su1', 'G1', 'BD01','HOD2' );

INSERT INTO EMPLOYEE VALUES(SEQ_EMP_ID.NEXTVAL, '������', SYSDATE, NULL, '510231-2933513',
'��⵵ ���ֽ�', '������', NULL, '010-5544-1187', 'DBTT5114@GMAIL.COM', 1232123,
'NHMP_ID7','PASS_PW7', '��ȭ��� �Դϴ�.', NULL, NULL, 'M', 'EM2', '20','TM1', 'PO1', 'gong1', 'su1', 'G1', 'BD01','HOD2' );

--����⺻�޿����� ����
INSERT INTO EMPSALARY VALUES(100, 'Y', 'Y', 'Y',30, NULL, NULL, NULL, 80, '3.3', NULL, NULL, NULL);
INSERT INTO EMPSALARY VALUES(101, 'Y', 'Y', 'Y',50, NULL, NULL, 'Y', 80, NULL, NULL, NULL, NULL);
INSERT INTO EMPSALARY VALUES(102, 'Y', 'Y', 'Y',60, NULL, NULL, NULL, 80, NULL, NULL, NULL, 'Y');
INSERT INTO EMPSALARY VALUES(103, 'Y', 'Y', 'Y',60, NULL, NULL, NULL, 80, '3.3' , NULL, NULL, NULL);

--�������� ����
INSERT INTO NOTICE VALUES(NOTICE_SEQ.NEXTVAL, 'TMTS �������� �Խ��� �Դϴ�', 
'������ ���� �̿� ��Ź�帳�ϴ�', 0, SYSDATE, '������');


--�ڷ�� ����
INSERT INTO DATAROOM VALUES(DATAROOM_SEQ.NEXTVAL, 'TMTS �ڷ�� �Դϴ�', 
'�ڷ�� ���� �̿� ��Ź�帳�ϴ�', SYSDATE, 0, NULL, 'ȫ�浿');

--ȯ�� ����
INSERT INTO PATIENT VALUES(PAT_SEQ.NEXTVAL, '����ö', '�Կ�', SYSDATE, DEFAULT,
'M', '341106-1122334', '����� ���α� û�ʹ��', '������', 'CGC1106@NAVER.COM', '010-1111-2222',
'KH1����', '����');
INSERT INTO PATIENT VALUES(PAT_SEQ.NEXTVAL, 'Ȳ����', '�Կ�', SYSDATE, DEFAULT,
'M', '261106-1133445', '����� ���α� ��ȭ����', 'Ȳ����', 'HGS1106@NAVER.COM', '010-2222-3333',
'KH2����', '���ù�');
INSERT INTO PATIENT VALUES(PAT_SEQ.NEXTVAL, '���м�', '�Կ�', SYSDATE, DEFAULT,
'M', '270228-1144556', '����� ���α� ��ȭ��', '��ȣ��', 'YHS0228@NAVER.COM', '010-3333-4444',
'KH3����', '�ڿ���');
INSERT INTO PATIENT VALUES(PAT_SEQ.NEXTVAL, '�弼��', '�Կ�', SYSDATE, DEFAULT,
'M', '360927-1155667', '����� ���α� ����', '�弼��', 'JSD0927@NAVER.COM', '010-4444-5555',
'KH1����', '������');
INSERT INTO PATIENT VALUES(PAT_SEQ.NEXTVAL, '���¿�', '�Կ�', SYSDATE, DEFAULT,
'M', '321204-1166778', '����� ���α� ������', '�밡��', 'NTW1204@NAVER.COM', '010-6666-7777',
'KH2����', '�����');
INSERT INTO PATIENT VALUES(PAT_SEQ.NEXTVAL, '����ȯ', '�Կ�', SYSDATE, DEFAULT,
'M', '310118-1177889', '�泲 ��õ�� �����', '����ũ', 'JDH0118@NAVER.COM', '010-7777-8888',
'KH3����', '����');

--������� ����
INSERT INTO COUNSELINGLOG VALUES(CL_SEQ.NEXTVAL, '����ö �������', SYSDATE, 
'���α����� ������ ���ϰ� ��Ÿ����, ���� �������� ����.', '010-1111-2222', '������', '����ö', '����', NULL, NULL);
INSERT INTO COUNSELINGLOG VALUES(CL_SEQ.NEXTVAL, 'Ȳ���� �������', SYSDATE, 
'���� �������� �ִٰ� ȣ���ϸ�, ���� ���� ���������� ����.', '010-1111-2222', '������', 'Ȳ����', '����', NULL, NULL);
INSERT INTO COUNSELINGLOG VALUES(CL_SEQ.NEXTVAL, '���м� �������', SYSDATE, 
'������ ���������� ��������, �Ƿ����� ���� �ǽ��� �ټ� ����.', '010-1111-2222', '������', '���м�', '���ù�', NULL, NULL);
INSERT INTO COUNSELINGLOG VALUES(CL_SEQ.NEXTVAL, '�弼�� �������', SYSDATE, 
'���� �� �ؽ��� ������ ȣ���ϸ�, ���� �� �ٸ� ȯ�ڵ鿡 ���ؼ� �������� ����.', '010-1111-2222', '������', '�弼��', '�ڿ���', NULL, NULL);
INSERT INTO COUNSELINGLOG VALUES(CL_SEQ.NEXTVAL, '���¿� �������', SYSDATE, 
'��ó �ҵ��� ���������� �̼��� ó���� ������ �߻�, ���� �����ʿ�.', '010-1111-2222', '������', '���¿�', '������', NULL, NULL);
INSERT INTO COUNSELINGLOG VALUES(CL_SEQ.NEXTVAL, '����ȯ �������', SYSDATE, 
'���� ���� ������ ���������� �߻��ϰ� ������, �ټ� ���� ���� �����ϰ��� ��.', '010-1111-2222', '������', '����ȯ', '�����', NULL, NULL);

--�������� ����
INSERT INTO MEDICIENRECORD VALUES(MR_SEQ.NEXTVAL, SYSDATE, '���� ������ ���� ����',
'������', '12:15', '100ML', '������', '����ö', '����');
INSERT INTO MEDICIENRECORD VALUES(MR_SEQ.NEXTVAL, SYSDATE, '���� �� �ʿ��� ���纸��',
'������', '12:27', '400ML', '2�ð� ���࿹��', 'Ȳ����', '���ù�');
INSERT INTO MEDICIENRECORD VALUES(MR_SEQ.NEXTVAL, SYSDATE, '���� �� ������������ �߻��ϴ� ������ȭ',
'������', '12:33', '200ML', '����ð� ����', '���м�', '�ڿ���');
INSERT INTO MEDICIENRECORD VALUES(MR_SEQ.NEXTVAL, SYSDATE, '���� ������ ���� ����',
'������', '08:08', '100ML', '������', '�弼��', '������');
INSERT INTO MEDICIENRECORD VALUES(MR_SEQ.NEXTVAL, SYSDATE, '��ó ������ ���� �ҵ� �� ������ȭ',
'����ҿ���', '08:13', '50ML', '������', '���¿�', '�����');
INSERT INTO MEDICIENRECORD VALUES(MR_SEQ.NEXTVAL, SYSDATE, '���� ���� ����',
'������', '08:22', '100ML', '������', '����ȯ', '����');

--Ķ���� ����
INSERT INTO CALENDAR VALUES (seq_cal.nextval, 'TMTS', '�������', '�̷��� ������ �����ϰ� �Ǿ����ϴ�.', SYSDATE, '2019-10-31', 'ī�װ���1', '#D25565', DEFAULT);
INSERT INTO CALENDAR VALUES (seq_cal.nextval, 'TMTS', '�߿�������', '������ �߿��ϴٺ���...', SYSDATE, '2019-10-29', 'ī�װ���2', '#9775fa', DEFAULT);
INSERT INTO CALENDAR VALUES (seq_cal.nextval, 'TMTS', '���̹���ũ 2077', '���̹���ũ�� �𸣽Ŵٱ���?', SYSDATE, '2019-10-28', 'ī�װ���3', '#ffa94d', DEFAULT);
INSERT INTO CALENDAR VALUES (seq_cal.nextval, 'TMTS', '���׳���', '���̹���ũ 2077�� �����Դϴ�.', SYSDATE, '2019-10-27', 'ī�װ���4', '#74c0fc', DEFAULT);

--Ŭ���� �������� ����
INSERT INTO CNOTICE VALUES(SEQ_CNOTICE.NEXTVAL, '���������Դϴ�.', '��������', '�� ��¥���� ���������� ���� �����Դϴ�.', 0, '19-10-24', '������');
INSERT INTO CNOTICE VALUES(SEQ_CNOTICE.NEXTVAL, '��������Դϴ�.', '�������', '�� ��¥���� ��������� ���� �����Դϴ�.', 0, '19-10-25', '������');
INSERT INTO CNOTICE VALUES(SEQ_CNOTICE.NEXTVAL, '�ӽ������Դϴ�.', '�ӽ�����', '�� ��¥���� �ӽ������� ���� �����Դϴ�.', 0, '19-10-26', '������');
INSERT INTO CNOTICE VALUES(SEQ_CNOTICE.NEXTVAL, '�̺�Ʈ�Դϴ�.', '�̺�Ʈ', '�� ��¥�� �̺�Ʈ�� ���� �����Դϴ�.', 0, '19-10-27', '������');
INSERT INTO CNOTICE VALUES(SEQ_CNOTICE.NEXTVAL, '�˸��Դϴ�.', '�˸�', '�� ��¥�� �˸��� ���� �����Դϴ�.', 0, '19-10-28', '������');

--Ŭ���� QNA ����
INSERT INTO QNA VALUES(SEQ_QNA.NEXTVAL, '�̿�����Դϴ�.', '�̿����', '�̷��� �̿��� �ñ��մϴ�.', 0, '19-10-24', '������');
INSERT INTO QNA VALUES(SEQ_QNA.NEXTVAL, '�̿�����Դϴ�.', '���񽺰���', '�̷��� ���񽺰� �ñ��մϴ�.', 0, '19-10-25', '������');
INSERT INTO QNA VALUES(SEQ_QNA.NEXTVAL, '�̿�����Դϴ�.', '��������', '�̷��� ������ �ñ��մϴ�.', 0, '19-10-26', '������');
INSERT INTO QNA VALUES(SEQ_QNA.NEXTVAL, '�̿�����Դϴ�.', '��Ÿ', '�̷��� ��Ÿ�� �ñ��մϴ�.', 0, '19-10-27', '������');
-- �ξ簡�� ����
INSERT INTO DEPENDENTS VALUES(DPEN_SEQ_CODE.NEXTVAL,'��','���浿','������','N','Y','Y','N',100);
INSERT INTO DEPENDENTS VALUES(DPEN_SEQ_CODE.NEXTVAL,'��','�����','������','N','Y','Y','N',100);
INSERT INTO DEPENDENTS VALUES(DPEN_SEQ_CODE.NEXTVAL,'�ڸ�','�����','������','Y','N','Y','N',101);
INSERT INTO DEPENDENTS VALUES(DPEN_SEQ_CODE.NEXTVAL,'����','�����','������','Y','N','Y','N',101);
INSERT INTO DEPENDENTS VALUES(DPEN_SEQ_CODE.NEXTVAL,'��','������','������','N','Y','Y','N',102);
INSERT INTO DEPENDENTS VALUES(DPEN_SEQ_CODE.NEXTVAL,'��','�����','������','N','Y','Y','N',102);
INSERT INTO DEPENDENTS VALUES(DPEN_SEQ_CODE.NEXTVAL,'����','������','������','Y','Y','N','N',103);
INSERT INTO DEPENDENTS VALUES(DPEN_SEQ_CODE.NEXTVAL,'�ڸ�','���ο�','������','Y','Y','N','N',103);
                                                                      
commit;

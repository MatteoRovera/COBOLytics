IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPLOYEE-RECORDS-SYSTEM.
       DATE-COMPILED.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-PC.
       OBJECT-COMPUTER. IBM-PC.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLOYEE-MASTER-FILE
               ASSIGN TO "EMPMAS.DAT"
               ORGANIZATION IS SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-MASTER-STATUS.

           SELECT TRANSACTION-FILE
               ASSIGN TO "TRANS.DAT"
               ORGANIZATION IS SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-TRANS-STATUS.

           SELECT NEW-EMPLOYEE-FILE
               ASSIGN TO "NEWEMP.DAT"
               ORGANIZATION IS SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-NEW-EMP-STATUS.

           SELECT PAYROLL-REPORT-FILE
               ASSIGN TO "PAYROLL.RPT"
               ORGANIZATION IS SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-REPORT-STATUS.

           SELECT ERROR-LOG-FILE
               ASSIGN TO "ERROR.LOG"
               ORGANIZATION IS SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-ERROR-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD  EMPLOYEE-MASTER-FILE
           RECORD CONTAINS 200 CHARACTERS
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
       01  MASTER-RECORD.
           05  MASTER-EMP-ID           PIC X(8).
           05  MASTER-EMP-NAME         PIC X(30).
           05  MASTER-EMP-ADDRESS      PIC X(50).
           05  MASTER-EMP-PHONE        PIC X(12).
           05  MASTER-DEPT-CODE        PIC X(4).
           05  MASTER-JOB-TITLE        PIC X(25).
           05  MASTER-HIRE-DATE.
               10  MASTER-HIRE-YEAR    PIC 9(4).
               10  MASTER-HIRE-MONTH   PIC 9(2).
               10  MASTER-HIRE-DAY     PIC 9(2).
           05  MASTER-SALARY           PIC 9(7)V99.
           05  MASTER-STATUS           PIC X(1).
           05  MASTER-LAST-UPDATE      PIC X(8).
           05  FILLER                  PIC X(51).

       FD  TRANSACTION-FILE
           RECORD CONTAINS 100 CHARACTERS
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
       01  TRANSACTION-RECORD.
           05  TRANS-TYPE              PIC X(1).
               88  ADD-RECORD          VALUE 'A'.
               88  UPDATE-RECORD       VALUE 'U'.
               88  DELETE-RECORD       VALUE 'D'.
           05  TRANS-EMP-ID            PIC X(8).
           05  TRANS-EMP-NAME          PIC X(30).
           05  TRANS-EMP-ADDRESS       PIC X(50).
           05  TRANS-SALARY            PIC 9(7)V99.
           05  FILLER                  PIC X(2).

       FD  NEW-EMPLOYEE-FILE
           RECORD CONTAINS 150 CHARACTERS
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
       01  NEW-EMP-RECORD.
           05  NEW-EMP-ID              PIC X(8).
           05  NEW-EMP-NAME            PIC X(30).
           05  NEW-EMP-ADDRESS         PIC X(50).
           05  NEW-EMP-PHONE           PIC X(12).
           05  NEW-DEPT-CODE           PIC X(4).
           05  NEW-JOB-TITLE           PIC X(25).
           05  NEW-SALARY              PIC 9(7)V99.
           05  FILLER                  PIC X(12).

       FD  PAYROLL-REPORT-FILE
           RECORD CONTAINS 132 CHARACTERS
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
       01  REPORT-LINE                 PIC X(132).

       FD  ERROR-LOG-FILE
           RECORD CONTAINS 80 CHARACTERS
           BLOCK CONTAINS 0 RECORDS
           LABEL RECORDS ARE STANDARD.
       01  ERROR-LINE                  PIC X(80).
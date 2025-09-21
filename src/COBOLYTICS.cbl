           >>SOURCE FORMAT FREE
       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOLYTICS.
       AUTHOR. Matteo Rovera
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO FILENAME
               FILE STATUS IS FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD INPUT-FILE.
       01 INPUT-RECORD     PIC X(99).

       WORKING-STORAGE SECTION.
       01 FILENAME         PIC X(99).
       01 FILE-STATUS      PIC X(2).

       PROCEDURE DIVISION.
       
       DISPLAY "Enter FILENAME: " WITH NO ADVANCING
       ACCEPT FILENAME

       OPEN INPUT INPUT-FILE.

       IF FILE-STATUS = "00" THEN
           DISPLAY "File opened successfully"
           CLOSE INPUT-FILE
       ELSE
           DISPLAY "Error opening file. Status: " FILE-STATUS
       END-IF.

       STOP RUN.

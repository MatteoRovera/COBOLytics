           >>SOURCE FORMAT FREE
       IDENTIFICATION DIVISION.
       PROGRAM-ID. grades.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 Xquit               PIC X(1).
       01 Grade1              PIC 99.
       01 Grade2              PIC 99.
       01 Grade3              PIC 99.
       01 CalcGrade           PIC 999V99.
       01 FinGrade            PIC X.
           88  GradeLetter VALUES 'A', 'B', 'C', 'D', 'F'.

       PROCEDURE DIVISION.
       
       PERFORM CALCULATOR UNTIL Xquit = 'x'           
       STOP RUN.

       CALCULATOR.
           DISPLAY "Enter Grade 1 " WITH NO ADVANCING
           ACCEPT Grade1
           DISPLAY "Enter Grade 2 " WITH NO ADVANCING
           ACCEPT Grade2
           DISPLAY "Enter Grade 3 " WITH NO ADVANCING
           ACCEPT Grade3

           COMPUTE CalcGrade = (Grade1 + Grade2 + Grade3) / 3

           EVALUATE TRUE
               WHEN CalcGrade >= 90
                   SET FinGrade to 'A'
               WHEN CalcGrade >= 80 AND CalcGrade < 90
                   SET FinGrade to 'B'
               WHEN CalcGrade >= 70 AND CalcGrade < 80
                   SET FinGrade to 'C'
               WHEN CalcGrade >= 60 AND CalcGrade < 70
                   SET FinGrade to 'D'
               WHEN OTHER
                   SET FinGrade to 'F'
           END-EVALUATE.

           DISPLAY "Grade Average: " CalcGrade "%"
           DISPLAY "Letter Average: " FinGrade 

           DISPLAY "Press any key to continue or X to quit "
           ACCEPT Xquit.

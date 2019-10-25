data student_score;
input student age1 age2 age3 age4
;
datalines;
1	108	96	110	122
2	103	117	127	133
3	96	107	106	107
4	84	85	92	99
5	118	125	125	116
6	110	107	96	91
7	129	128	123	128
8	90	84	101	113
9	84	104	100	88
10	96	100	103	105
11	105	114	105	112
12	113	117	132	130
;
proc anova data=student_score;
title 'Oneway Repeated Measures ANOVA: students cognitive scores';
class student;
model age4 - age1 =/ nouni;
repeated age 4 (1 2 3 4);
run;

proc glm data=student_score;
title 'Oneway Repeated Measures ANOVA: students cognitive scores';
class student;
model age4 - age1 =/ nouni;
repeated age 4 (1 2 3 4) polynomial / summary printe;
run;

DATA wolves;

LENGTH location $2 wolf $5 sex $1;

INPUT location $ wolf $ sex $ x1-x9;

subject=_n_;

LABEL

X1 = 'palatal length'

X2 = 'postpalatal length'

X3 = 'zygomatic width'

X4 = 'palatal width-1'

X5 = 'palatal width-2'

X6 = 'postg foramina width'

X7 = 'interorbital width'

X8 = 'braincase width'

X9 = 'crown length';

cards;

rm rmm1 m 126 104 141 81.0 31.8 65.7 50.9 44.0 18.2

rm rmm2 m 128 111 151 80.4 33.8 69.8 52.7 43.2 18.5

rm rmm3 m 126 108 152 85.7 34.7 69.1 49.3 45.6 17.9

rm rmm4 m 125 109 141 83.1 34.0 68.0 48.2 43.8 18.4

rm rmm5 m 126 107 143 81.9 34.0 66.1 49.0 42.4 17.9

rm rmm6 m 128 110 143 80.6 33.0 65.0 46.4 40.2 18.2

rm rmf1 f 116 102 131 76.7 31.5 65.0 45.4 39.0 16.8

rm rmf2 f 120 103 130 75.1 30.2 63.8 44.4 41.1 16.9

rm rmf3 f 116 103 125 74.7 31.6 62.4 41.3 44.2 17.0

ar arm1 m 117 99 134 83.4 34.8 68.0 40.7 37.1 17.2

ar arm2 m 115 100 149 81.0 33.1 66.7 47.2 40.5 17.7

ar arm3 m 117 106 142 82.0 32.6 66.0 44.9 38.2 18.2

ar arm4 m 117 101 144 82.4 32.8 67.5 45.3 41.5 19.0

ar arm5 m 117 103 149 82.8 35.1 70.3 48.3 43.7 17.8

ar arm6 m 119 101 143 81.5 34.1 69.1 50.1 41.1 18.7

ar arm7 m 115 102 146 81.4 33.7 66.4 47.7 42.0 18.2

ar arm8 m 117 100 144 81.3 37.2 66.8 41.4 37.6 17.7

ar arm9 m 114 102 141 84.1 31.8 67.8 47.8 37.8 17.2

ar arm10 m 110 94 132 76.9 30.1 62.1 42.0 40.4 18.1

ar arf1 f 112 94 134 79.5 32.1 63.3 44.9 42.7 17.7

ar arf2 f 109 91 133 77.9 30.6 61.9 45.2 41.2 17.1

ar arf3 f 112 99 139 77.2 32.7 67.4 46.9 40.9 18.3

ar arf4 f 112 99 133 78.5 32.5 65.5 44.2 34.1 17.5

ar arf5 f 113 97 146 84.2 35.4 68.7 51.0 43.6 17.2

ar arf6 f 107 97 137 78.1 30.7 61.6 44.9 37.3 16.5

;

run;
proc discrim data=wolves outstat=wolvesstat
wcov pcov method=normal pool=test
distance anova manova listerr crosslisterr;
class location;
var X1 X2 X3 X4 X5 X6 X7 X8 X9;
run;
proc print data=wolvesstat;
title'Output Discrimant Statistics';
run;

// points
p1 = [10, 7.5];
p2 = [10, 4];
p3 = [6, 1.7];

n = 15;

for (i = [0 : 1/n : 1]) 
    translate(p1 * i + p2 * (1-i)) 
        sphere(0.2);


for (i = [p1, p2, p3]) translate(i) color("black") sphere(0.2);


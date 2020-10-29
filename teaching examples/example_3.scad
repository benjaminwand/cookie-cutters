// points
p1 = [5, 7.5];
p2 = [7, 2];
p3 = [1, 1.7];

n = 15;

for (i = [0 : 1/n : 1]) 
    translate(p1 * i + p2 * (1-i)) 
        sphere(0.2);


for (i = [p1, p2, p3]) translate(i) color("black") sphere(0.2);


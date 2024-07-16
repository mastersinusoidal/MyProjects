t = 0:pi/20:10*pi;
y1 = sin(t);
y2 = sin(t+pi/2);

subplot(1,2,1)
curve1 = animatedline('LineWidth', 2);
hold on
plot(t,y1);

subplot(1,2,2) 
curve2 = animatedline('LineWidth', 2);
hold on
plot(t,y2);

for i = 1: length(t)
    addpoints(curve1, t(i), y1(i));
    addpoints(curve2, t(i), y2(i));
    drawnow
end
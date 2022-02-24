close all
figure(1);
circle([0 0],1,1000,'g');
hold on;line([0 0],[-1.5 1.5],'LineWidth',3);
line([-1.5 1.5],[0 0],'LineWidth',3)
plot(-.5,0,'or','MarkerSize',12,'LineWidth',3);
plot(0,0,'or','MarkerSize',12,'LineWidth',3);
plot(-1/5,2/5,'xr','MarkerSize',12,'LineWidth',3);
plot(-1/5,-2/5,'xr','MarkerSize',12,'LineWidth',3);
xlabel('Re\{z\}','FontSize',20)
ylabel('Im\{z\}','FontSize',20)

y_vec = -pi:pi/100:pi;
m_vec = zeros(1,length(y_vec));
p_vec = zeros(1,length(y_vec));
for ii = 1:length(y_vec)
    z1 = [cos(y_vec(ii)) sin(y_vec(ii))]-[-.5 0];
    z2 = [cos(y_vec(ii)) sin(y_vec(ii))]-[0 0];
    p1 = [cos(y_vec(ii)) sin(y_vec(ii))]-[-1/5 2/5];
    p2 = [cos(y_vec(ii)) sin(y_vec(ii))]-[-1/5 -2/5];
    
    m_z1 = norm(z1);
    m_z2 = norm(z2);
    m_p1 = norm(p1);
    m_p2 = norm(p2);
    m_vec(ii) = (m_z1*m_z2)/(m_p1*m_p2);
    
    p_z1 = atan2(z1(2),z1(1));
    p_z2 = atan2(z2(2),z2(1));
    p_p1 = atan2(p1(2),p1(1));
    p_p2 = atan2(p2(2),p2(1));
    p_vec(ii) = (p_z1+p_z2)-(p_p1+p_p2);
end

p_vec(1:14) = p_vec(1:14) + 2*pi;
p_vec(188:end) = p_vec(188:end) - 2*pi;

for ii = 1:length(y_vec)
    figure(1);
    subplot(2,2,[1 3])
    circle([0 0],1,1000,'g');
    hold on;line([0 0],[-1.5 1.5],'LineWidth',3);
    line([-1.5 1.5],[0 0],'LineWidth',3)
    plot(-.5,0,'or','MarkerSize',12,'LineWidth',3);
    plot(0,0,'or','MarkerSize',12,'LineWidth',3);
    plot(-1/5,2/5,'xr','MarkerSize',12,'LineWidth',3);
    plot(-1/5,-2/5,'xr','MarkerSize',12,'LineWidth',3);
    xlabel('Re\{z\}','FontSize',20)
    ylabel('Im\{z\}','FontSize',20)
    arrow([-.5 0],[cos(y_vec(ii)) sin(y_vec(ii))]);
    arrow([0 0],[cos(y_vec(ii)) sin(y_vec(ii))]);
    arrow([-1/5 2/5],[cos(y_vec(ii)) sin(y_vec(ii))]);
    arrow([-1/5 -2/5],[cos(y_vec(ii)) sin(y_vec(ii))]);
    hold off;
    
    figure(1);
    subplot(2,2,2);plot(y_vec(1:ii),m_vec(1:ii),'LineWidth',3);
    xlim([-pi pi]);ylim([min(m_vec) max(m_vec)]);
    xlabel('omega (rad/sec)','FontSize',20)
    title('Magnitude of FT','FontSize',20)
    subplot(2,2,4);plot(y_vec(1:ii),p_vec(1:ii),'LineWidth',3);
    xlim([-pi pi]);ylim([min(p_vec) max(p_vec)]);
    xlabel('omega (rad/sec)','FontSize',20)
    title('Phase of FT','FontSize',20)
    
    pause(.01)
end
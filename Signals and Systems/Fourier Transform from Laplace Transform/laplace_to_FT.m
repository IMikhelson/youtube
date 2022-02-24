figure(1);
line([0 0],[-10 10],'LineWidth',3);
hold on;
line([-3 1],[0 0],'LineWidth',3)
xlim([-3 1]);ylim([-10 10]);
grid on
plot(-2,0,'or','MarkerSize',12,'LineWidth',3);
plot(-1,2,'xr','MarkerSize',12,'LineWidth',3);
plot(-1,-2,'xr','MarkerSize',12,'LineWidth',3);
xlabel('Re\{s\} (sigma)','FontSize',20)
ylabel('Im\{s\} (omega)','FontSize',20)

y_vec = -10:.1:10;
m_vec = zeros(1,length(y_vec));
p_vec = zeros(1,length(y_vec));
for ii = 1:length(y_vec)
    z1 = [0 y_vec(ii)]-[-2 0];
    p1 = [0 y_vec(ii)]-[-1 2];
    p2 = [0 y_vec(ii)]-[-1 -2];
    
    m_z1 = norm(z1);
    m_p1 = norm(p1);
    m_p2 = norm(p2);
    m_vec(ii) = m_z1/(m_p1*m_p2);
    
    p_z1 = atan2(z1(2),z1(1));
    p_p1 = atan2(p1(2),p1(1));
    p_p2 = atan2(p2(2),p2(1));
    p_vec(ii) = p_z1-p_p1-p_p2;
end

for ii = 1:length(y_vec)
    figure(1);
    subplot(2,2,[1,3]);
    plot(-2,0,'or','MarkerSize',12,'LineWidth',3);
    hold on;
    plot(-1,2,'xr','MarkerSize',12,'LineWidth',3);
    plot(-1,-2,'xr','MarkerSize',12,'LineWidth',3);
    line([0 0],[-10 10],'LineWidth',3);
    line([-3 1],[0 0],'LineWidth',3)
    xlim([-3 1]);ylim([-10 10]);
    grid on
    xlabel('Re\{s\} (sigma)','FontSize',20)
    ylabel('Im\{s\} (omega)','FontSize',20)
    
    arrow([-2 0],[0 y_vec(ii)]);
    arrow([-1 2],[0 y_vec(ii)]);
    arrow([-1 -2],[0 y_vec(ii)]);
    hold off;
    
    figure(1);
    subplot(2,2,2);plot(y_vec(1:ii),m_vec(1:ii),'LineWidth',3);
    xlim([-10 10]);ylim([min(m_vec) max(m_vec)]);
    xlabel('omega (rad/sec)','FontSize',20)
    title('Magnitude of FT','FontSize',20)
    subplot(2,2,4);plot(y_vec(1:ii),p_vec(1:ii),'LineWidth',3);
    xlim([-10 10]);ylim([min(p_vec) max(p_vec)]);
    xlabel('omega (rad/sec)','FontSize',20)
    title('Phase of FT','FontSize',20)
    
    pause(.01)
end
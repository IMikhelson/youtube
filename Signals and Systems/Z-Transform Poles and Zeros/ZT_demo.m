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
circle([0 0],norm([1/5 2/5]),1000,'r');

sigma_vec = -2:.02:2;
omega_vec = -2:.02:2;
z_plane = zeros(length(omega_vec),length(sigma_vec));
for ii = 1:length(sigma_vec)
    sigma = sigma_vec(ii);
    for jj = 1:length(omega_vec)
        omega = omega_vec(jj);
        s = sigma + 1i*omega;
        if norm(s)<norm([1/5 2/5])
            H = NaN;
        else
            H = 2/5*(s*(s+1/2))/((s+1/5-2/5*1i)*(s+1/5+2/5*1i));
        end
        z_plane(jj,ii) = abs(H);
    end
end


figure(2);surf(sigma_vec,omega_vec,z_plane);
zlim([0 6])
xlabel('Re\{z\}','FontSize',20)
ylabel('Im\{z\}','FontSize',20)
zlabel('Z-Transform amplitude','FontSize',20)
axis square
figure(1);
line([0 0],[-4 4],'LineWidth',3);
hold on;
line([-3 1],[0 0],'LineWidth',3)
xlim([-3 1]);ylim([-4 4]);
grid on
plot(-2,0,'or','MarkerSize',12,'LineWidth',3);
plot(-1,2,'xr','MarkerSize',12,'LineWidth',3);
plot(-1,-2,'xr','MarkerSize',12,'LineWidth',3);
xlabel('Re\{s\} (sigma)','FontSize',20)
ylabel('Im\{s\} (omega)','FontSize',20)
plot([-1 -1],[-4 4],'r--','LineWidth',3)

sigma_vec = -1:.05:1;
omega_vec = -4:.05:4;
s_plane = zeros(length(omega_vec),length(sigma_vec));
for ii = 1:length(sigma_vec)
    sigma = sigma_vec(ii);
    for jj = 1:length(omega_vec)
        omega = omega_vec(jj);
        s = sigma + 1i*omega;
        H = (s+2)/((s+1-2*1i)*(s+1+2*1i));
        s_plane(jj,ii) = abs(H);
    end
end

sigma_subset = 175:225;
% figure(2);surf(sigma_vec(sigma_subset),omega_vec,s_plane(:,sigma_subset))
figure(2);surf(sigma_vec,omega_vec,s_plane);
zlim([0 6])
xlabel('Re\{s\} (sigma)','FontSize',20)
ylabel('Im\{s\} (omega)','FontSize',20)
zlabel('Laplace Transform amplitude','FontSize',20)

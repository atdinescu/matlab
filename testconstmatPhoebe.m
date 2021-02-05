%% cartilage properties
Ep(1)=1.1;
Ez(1)=1.1;
Vp(1)=0.48;
Vz(1)=0.48;
Gl(1)=1.1;
%% bone properties
Ep(1)=15000;
Ez(1)=15000;
Vp(1)=0.3;
Vz(1)=0.3;
Gl(1)=15000;
%%
for i=1:1
% isotropic material
    
    LU(:,:,i)=[1/Ep(i), -Vp/Ep(i), -Vz/Ez(i);
                -Vp/Ep(i), 1/Ep(i), -Vz/Ez(i);
                -Vz/Ez(i), -Vz/Ez(i), 1/Ez(i)];
    RB(:,:,i)=[2*(1+Vp)/Ep(i),0,0;
                0,2*(1+Vp)/Ep(i),0;
                0,0,2*(1+Vp)/Ep(i)];
    Comp(:,:,i)=[LU(:,:,i), zeros(3,3); zeros(3,3), RB(:,:,i)];
    S(:,:,i)=inv(Comp(:,:,i));
    
end

% for i=1:1
% % orthotropic material
% 
% LU2(:,:,i)=[2/Ep(i), -Vp/Ep(i), -Vz/Ez(i);
%             -Vp/Ep(i), 2/Ep(i), -Vz/Ez(i);
%             -Vz/Ez(i), -Vz/Ez(i), 2/Ez(i)];
% RB2(:,:,i)=[0.5/Gl(i),0,0;
%             0,0.5/Gl(i),0;
%             0,0,(2+Vp)/Ep(i)];
% C2(:,:,i)=[LU2(:,:,i), zeros(3,3); zeros(3,3), RB2(:,:,i)];
% S2(:,:,i)=inv(C2(:,:,i));
% end
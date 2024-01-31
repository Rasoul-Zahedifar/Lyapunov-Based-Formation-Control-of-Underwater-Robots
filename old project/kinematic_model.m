function out4=kinematic_model(in4)

q=in4(1:3);
uu=in4(4:end);

dq=[uu(1)*cos(q(3))-1*uu(2)*sin(q(3));   uu(1)*sin(q(3))+1*uu(2)*cos(q(3)); uu(3)];
out4=dq;


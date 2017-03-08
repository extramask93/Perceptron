%% import structures and save them in more readable form
x1=GR_15.L1(1,:);
y1=GR_15.L1(2,:);
x2=GR_15.L2(1,:);
y2=GR_15.L2(2,:);
plot(x1,y1,'*');
hold on
plot(x2,y2,'o');
%% combine L1 and L2
U1=[x1 x2];
U2=[y1 y2];
input=[U1;U2];
%% zeros ones decomposition
% where L1 are ones and L2 are zeros
zera=zeros(1,size(x2,2));
jedynki=ones(1,size(x1,2));
%% combine
target=[jedynki, zera];
%% create perceptron
net=newp(input,target); % create new perceptron, with
% default[omiited here] values(HARDLIM,LEARMP)
net.trainParam.epochs=100; % max epochs count <=100
net=train(net,input,target);
Z=getwb(net); % get network weights and bias(bias,u1,u2)
%% prosta
iks=[-10:1:10]; % x vector for line plotting puprose
igr=(Z(2).* iks + Z(1))./(-Z(3)); % calculate y for each given x coordinate
plot(iks,igr); % plot the line

sim_result = sim(net,input);
tf = isequal(sim_result,target);
disp('Czy wyjœcie sieci jest zgodne z zalo¿eniami? 1 - tak   0 - nie');
disp(tf);


%ʱ���ѹ� 216.508322 �롣
function [] = DynamicWindowApproachSample()  
   
% close all;  
% clear all;  
   
disp('Dynamic Window Approach sample program start!!')  
  
% x1=[0 0 0 0 0]';% ������1�ĳ���״̬[x(m),y(m),yaw(Rad),v(m/s),w(rad/s)]
x2=[2 0 0 0 0]';% ������2�ĳ���״̬[x(m),y(m),yaw(Rad),v(m/s),w(rad/s)]
x3=[4 2 0 0 0]';% ������3�ĳ���״̬[x(m),y(m),yaw(Rad),v(m/s),w(rad/s)]
x4=[0 0 0 2 0]';% ������4�ĳ���״̬[x(m),y(m),yaw(Rad),v(m/s),w(rad/s)]
% x5=[-6 0 0 0 0]';% ������5�ĳ���״̬[x(m),y(m),yaw(Rad),v(m/s),w(rad/s)]
% goal1=[3,0, 0,2];% Ŀ���1λ�� [x(m),y(m),yaw,v]  
goal2=[8,0, 0,2];% Ŀ���2λ�� [x(m),y(m)]
goal3=[8,2,0,2];% Ŀ���2λ�� [x(m),y(m)]
goal4=[10,3.75,0,6];% Ŀ���2λ�� [x(m),y(m)]
% goal5=[-5,1];% Ŀ���2λ�� [x(m),y(m)]
% �ϰ���λ���б� [x(m) y(m)]  
% obstacle=[0 2;  
%           4 2;  
%           4 4;  
%           5 4;  
%           5 5;  
%           5 6;  
%           5 9  
%           8 8  
%           8 9  
%           7 9];  
%����״̬���� 
obstacle=[10 10];  
obstacleR=0.1;% ��ͻ�ж��õ��ϰ���뾶  
global dt; dt=0.1;% ʱ��[s]  
  
% �������˶�ѧģ��  
% ����ٶ�m/s],�����ת�ٶ�[rad/s],���ٶ�[m/ss],��ת���ٶ�[rad/ss],  
% �ٶȷֱ���[m/s],ת�ٷֱ���[rad/s]]  
Kinematic=[5.0,toRadian(20.0),0.5,toRadian(50.0),0.01,toRadian(1)];  
% ���ۺ������� [heading,dist,velocity,predictDT]  
evalParam=[12,0.2,0.1,3.0];  
area=[0 45 0 4];% ģ������Χ [xmin xmax ymin ymax]  
  
% ģ��ʵ��Ľ��  
result.x1=[];
result.x2=[];
result.x3=[];
result.x4=[];
result.x5=[];
tic;  
% movcount=0;  
% Main loop  
for i=1:5000  
    t1=clock;
    % ������1DWA��������  
%     [u,traj]=DynamicWindowApproach(x1,Kinematic,goal1,evalParam,obstacle,obstacleR); 
%     x1=f(x1,u);% ������1�ƶ�����һ��ʱ��   
    [u,traj]=DynamicWindowApproach(x2,Kinematic,goal2,evalParam,obstacle,obstacleR);
     x2=f(x2,u);% ������2�ƶ�����һ��ʱ��  
  [u3,traj]=DynamicWindowApproach(x3,Kinematic,goal3,evalParam,obstacle,obstacleR);
     x3=f(x3,u3);% ������3�ƶ�����һ��ʱ��    
      [u,traj]=DynamicWindowApproach(x4,Kinematic,goal4,evalParam,obstacle,obstacleR);
     x4=f(x4,u);% ������4�ƶ�����һ��ʱ��  
%     [u,traj]=DynamicWindowApproach(x5,Kinematic,goal5,evalParam,obstacle,obstacleR);
%      x5=f(x5,u);% ������5�ƶ�����һ��ʱ��     
    % ģ�����ı���  
%     result.x1=[result.x1; x1'];  
    result.x2=[result.x2; x2'];
   result.x3=[result.x3; x3'];
    result.x4=[result.x4; x4'];
%    result.x5=[result.x5; x5'];
    % �Ƿ񵽴�Ŀ�ĵ�  
    if  norm(x2(1:4)-goal2')<0.5&& norm(x3(1:4)-goal3')<0.5&& norm(x4(1:4)-goal4')<0.5
        disp('Arrive Goal!!');break;  
    end   
    %====Animation====  
    hold off;  
    ArrowLength=0.5;%   
    % ������  
%     quiver(x1(1),x1(2),ArrowLength*cos(x1(3)),ArrowLength*sin(x1(3)),'ok');hold on; 
%     plot(result.x1(:,1),result.x1(:,2),'-b');hold on;  
%     plot(goal1(1),goal1(2),'*r');hold on;  
%     quiver(x2(1),x2(2),ArrowLength*cos(x2(3)),ArrowLength*sin(x2(3)),'ok');hold on;
%      plot(result.x2(:,1),result.x2(:,2),'-b');hold on;  
% %     plot(goal2(1),goal2(2),'*r');hold on;  
%     quiver(x3(1),x3(2),ArrowLength*cos(x3(3)),ArrowLength*sin(x3(3)),'ok');hold on;
%        plot(result.x3(:,1),result.x3(:,2),'-b');hold on;  
%     plot(goal3(1),goal3(2),'*r');hold on;  
    quiver(x4(1),x4(2),ArrowLength*cos(x4(3)),ArrowLength*sin(x4(3)),'ok');hold on;
       plot(result.x4(:,1),result.x4(:,2),'-b');hold on;  
%     plot(goal4(1),goal4(2),'*r');hold on;  
%     quiver(x5(1),x5(2),ArrowLength*cos(x5(3)),ArrowLength*sin(x5(3)),'ok');hold on;
%       plot(result.x5(:,1),result.x5(:,2),'-b');hold on;  
%     plot(goal5(1),goal5(2),'*r');hold on;  
    plot(obstacle(:,1),obstacle(:,2),'*k');hold on;  
    % ̽���켣  
    if ~isempty(traj)  
        for it=1:length(traj(:,1))/5  
            ind=1+(it-1)*5;  
            plot(traj(ind,:),traj(ind+1,:),'-g');hold on;  
        end  
    end  
    axis(area);  
    grid on;  
    drawnow;  
    %movcount=movcount+1;  
    %mov(movcount) = getframe(gcf);%   
end  
t1=clock;
estime(t2,t1)
toc  
%movie2avi(mov,'movie.avi');  
   
  
function [u,trajDB]=DynamicWindowApproach(x,model,goal,evalParam,ob,R)  
  
% Dynamic Window [vmin,vmax,wmin,wmax]  
Vr=CalcDynamicWindow(x,model);  
  
% ���ۺ����ļ���  
[evalDB,trajDB]=Evaluation(x,Vr,goal,ob,R,model,evalParam);  
  
if isempty(evalDB)  
    disp('no path to goal!!');  
    u=[0;0];return;  
end  
  
% �����ۺ�������  
evalDB=NormalizeEval(evalDB);  
  
% �������ۺ����ļ���  
feval=[];  
for id=1:length(evalDB(:,1))  
    feval=[feval;evalParam(1:3)*evalDB(id,3:5)'];  
end  
evalDB=[evalDB feval];  
  
[maxv,ind]=max(feval);% �������ۺ���  
u=evalDB(ind,1:2)';%   

function [evalDB,trajDB]=Evaluation(x,Vr,goal,ob,R,model,evalParam)  
%   
evalDB=[];  
trajDB=[];  
for vt=Vr(1):model(5):Vr(2)  
    for ot=Vr(3):model(6):Vr(4)  
        % �켣�Ʋ�; �õ� xt: ��������ǰ�˶����Ԥ��λ��; traj: ��ǰʱ�� �� Ԥ��ʱ��֮��Ĺ켣  
        [xt,traj]=GenerateTrajectory(x,vt,ot,evalParam(4),model);  %evalParam(4),ǰ��ģ��ʱ��;  
        % �����ۺ����ļ���  
        heading=CalcHeadingEval(xt,goal);  
        dist=CalcDistEval(xt,ob,R);  
        vel=abs(vt);  
        % �ƶ�����ļ���  
        stopDist=CalcBreakingDist(vel,model);  
        if dist>stopDist %   
            evalDB=[evalDB;[vt ot heading dist vel]];  
            trajDB=[trajDB;traj];  
        end  
    end  
end  
  
function EvalDB=NormalizeEval(EvalDB)  
% ���ۺ�������  
if sum(EvalDB(:,3))~=0  
    EvalDB(:,3)=EvalDB(:,3)/sum(EvalDB(:,3));  
end  
if sum(EvalDB(:,4))~=0  
    EvalDB(:,4)=EvalDB(:,4)/sum(EvalDB(:,4));  
end  
if sum(EvalDB(:,5))~=0  
    EvalDB(:,5)=EvalDB(:,5)/sum(EvalDB(:,5));  
end  
  
function [x,traj]=GenerateTrajectory(x,vt,ot,evaldt,model)  
% �켣���ɺ���  
% evaldt��ǰ��ģ��ʱ��; vt��ot��ǰ�ٶȺͽ��ٶ�;   
global dt;  
time=0;  
u=[vt;ot];% ����ֵ  
traj=x;% �����˹켣  
while time<=evaldt  
    time=time+dt;% ʱ�����  
    x=f(x,u);% �˶�����  
    traj=[traj x];  
end  
  
function stopDist=CalcBreakingDist(vel,model)  
% �����˶�ѧģ�ͼ����ƶ�����,����ƶ����벢û�п�����ת�ٶȣ�����ȷ�ɣ�����  
global dt;  
stopDist=0;  
while vel>0  
    stopDist=stopDist+vel*dt;% �ƶ�����ļ���  
    vel=vel-model(3)*dt;%   
end  
  
function dist=CalcDistEval(x,ob,R)  
% �ϰ���������ۺ���  
  
dist=100;  
for io=1:length(ob(:,1))  
    disttmp=norm(ob(io,:)-x(1:2)')-R;%
    if dist>disttmp% ���ϰ�����С�ľ���  
        dist=disttmp;  
    end  
end  
  
% �ϰ�����������޶�һ�����ֵ��������趨��һ��һ���켣û���ϰ����̫ռ����  
if dist>=2*R  
    dist=2*R;  
end  
  
function heading=CalcHeadingEval(x,goal)  
% heading�����ۺ�������  
  
theta=toDegree(x(3));% �����˳���  
goalTheta=toDegree(atan2(goal(2)-x(2),goal(1)-x(1)));% Ŀ���ķ�λ  
  
if goalTheta>theta  
    targetTheta=goalTheta-theta;% [deg]  
else  
    targetTheta=theta-goalTheta;% [deg]  
end  
  
heading=180-targetTheta;  
  
function Vr=CalcDynamicWindow(x,model)  
%  
global dt;  
% �����ٶȵ������С��Χ  
Vs=[0 model(1) -model(2) model(2)];  
  
% ���ݵ�ǰ�ٶ��Լ����ٶ����Ƽ���Ķ�̬����  
Vd=[x(4)-model(3)*dt x(4)+model(3)*dt x(5)-model(4)*dt x(5)+model(4)*dt];  
  
% ���յ�Dynamic Window  
Vtmp=[Vs;Vd];  
Vr=[max(Vtmp(:,1)) min(Vtmp(:,2)) max(Vtmp(:,3)) min(Vtmp(:,4))];  
  
function x = f(x, u)  
% Motion Model  
% u = [vt; wt];��ǰʱ�̵��ٶȡ����ٶ�  
global dt;  
   
F = [1 0 0 0 0  
     0 1 0 0 0  
     0 0 1 0 0  
     0 0 0 0 0  
     0 0 0 0 0];  
   
B = [dt*cos(x(3)) 0  
    dt*sin(x(3)) 0  
    0 dt  
    1 0  
    0 1];  
  
x= F*x+B*u;  
  
function radian = toRadian(degree)  
% degree to radian  
radian = degree/180*pi;  
  
function degree = toDegree(radian)  
% radian to degree  
degree = radian/pi*180; 
%Project By Omri Weiss
%I.D 308248657
%% Code Order&Remarks
% Order: Data Reading and Variables -> Cases for implementing sections -> Functions used for those sections
% Functions for each section are marked with comments in Begin&End
% Each Function is marked with comments in Begin&End
% Most of the code contain comments in Begin&End
%%


function Project

Number = 6;
% 0     - Display Essentials
% 1     - Section 1
% 12    - Section 1 on other Data Sample
% 2     - Section 2
% 3     - Section 3
% 4     - Section 4
% 5     - Section 5
% 6     - Section 6



info =h5read('20140126-134055-Base.h5','/SI-001007/Calibrated/Accelerometers');

info_other =h5read('20140305-112324-Fast.h5','/SI-001007/Calibrated/Accelerometers');


%Reading Acceleration Axises

HeightAccel= info(1,:);
WidthAccel= info(2,:);
LengthAccel= info(3,:);

WidthAccel_Other= info_other(2,:);

%Reading Acceleration Axises

%ts_width = timeseries(info(2,:), 1:37713, 'name', 'Position')



%Getting width acceleration data size
[rows,cols]= size(WidthAccel);
%Getting width acceleration data size


%Getting Steps
Step1= WidthAccel(:,1:7680);
Step1_Other= WidthAccel_Other(:,1:7680);
%Step1 = timeseries(info(2,:), 1:7680,'name', 'Step1');

Step2= WidthAccel(:,7681:15360);
Step2_Other= WidthAccel_Other(:,7681:15360);
%Step2 = timeseries(info(2,:), 1:7680,'name', 'Step2');

Step3= WidthAccel(:,15361:23040);
Step3_Other= WidthAccel_Other(:,15361:23040);
%Step3 = timeseries(info(2,:), 1:7680,'name', 'Step3');

Step4= WidthAccel(:,23041:30720);
Step4_Other= WidthAccel_Other(:,23041:30720);
%Step4 = timeseries(info(2,:), 1:7680,'name', 'Step4');

Step5= WidthAccel(:,30721:37713);
Step5_Other= WidthAccel_Other(:,30721:32373);
%Step5 = timeseries(info(2,:), 1:7680,'name', 'Step5');

%Getting Steps

Width_ft = fft(WidthAccel);
%Fourier transformation for Samples
signal=fftshift(Width_ft);
%Shifting the axis to 0 before filtering 






%%Cases
switch Number
    
    case 0
        
               
        
        
        figure('Name','3 Axses of Accelerometer');
        
               
        subplot(311);
        plot(HeightAccel);
        title('Height Acceleration')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(312);
        plot(WidthAccel);
        title('Width Acceleration')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');


        subplot(313);
        plot(LengthAccel);
        title('Length Acceleration')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        plot(WidthAccel_Other);
        title('Acceleration By Width Axis')
        xlabel('Time (Seconds)');
        ylabel('Acceleration(m/s^2)');       
        


    
    case 1  


        %Displaying width acceleration
        scrsz = get(0,'ScreenSize');
        figure('Position',[1 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2], 'Name','All the steps')
        %figure('Name','All the steps');
        plot(WidthAccel);
        title('Acceleration By Width Axis')
        xlabel('Time (Seconds)');
        ylabel('Acceleration(m/s^2)');

        %movegui('All the steps', west)
        %Displaying width acceleration

        %Displaying width acceleration By steps
        figure('Position',[scrsz(3)/2 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2], 'Name','Division of the movement into steps');


        subplot(511);
        plot(Step1);
        title('First Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(512);
        plot(Step2);
        title('Second Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(513);
        plot(Step3);
        title('Third Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(514);
        plot(Step4);
        title('Fourth Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');


        subplot(515);
        plot(Step5);
        title('Fifth Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        %Displaying width acceleration By steps



    case 12  

        %Displaying width acceleration
        scrsz = get(0,'ScreenSize');
        figure('Position',[1 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2], 'Name','All the steps')
        %figure('Name','All the steps');
        plot(WidthAccel_Other);
        title('Acceleration By Width Axis')
        xlabel('Time (Seconds)');
        ylabel('Acceleration(m/s^2)');

        

        %Displaying width acceleration By steps
        figure('Position',[scrsz(3)/2 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2], 'Name','Division of the movement into steps');


        subplot(511);
        plot(Step1_Other);
        title('First Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(512);
        plot(Step2_Other);
        title('Second Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(513);
        plot(Step3_Other);
        title('Third Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(514);
        plot(Step4_Other);
        title('Fourth Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');


        subplot(515);
        plot(Step5_Other);
        title('Fifth Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        %Displaying width acceleration By steps


    case 2
        
        c=3;             
         
        [w1,f1] = frequencyVector(1:7680,Step1);        
        Step1_Filtered = myHPF(w1, Step1, c)         
        
        [w2,f2] = frequencyVector(1:7680,Step2);        
        Step2_Filtered = myHPF(w2, Step2, c) 
        
        [w3,f3] = frequencyVector(1:7680,Step3); 
        Step3_Filtered = myHPF(w3, Step3, c) 
        
        [w4,f4] = frequencyVector(1:7680,Step4);
        Step4_Filtered = myHPF(w4, Step4, c) 
        
        [w5,f5] = frequencyVector(1:7680,Step5);
        Step5_Filtered = myHPF(w5, Step5, c) 
        
       
        scrsz = get(0,'ScreenSize');
         %Displaying Unfiltered Steps
        figure('Position',[1 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2], 'Name','Steps Unfiltered')
        
        
        subplot(511);
        plot(Step1);
        title('First Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(512);
        plot(Step2);
        title('Second Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(513);
        plot(Step3);
        title('Third Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(514);
        plot(Step4);
        title('Fourth Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');


        subplot(515);
        plot(Step5);
        title('Fifth Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        
        text(4,60,texlabel('Steps UnFiltered'));
        %Displaying Unfiltered Steps


        %Displaying Filtered Steps
        figure('Position',[scrsz(3)/2 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2], 'Name','Steps Filtered');
        

        subplot(511);
        plot(Step1_Filtered);
        title('First Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(512);
        plot(Step2_Filtered);
        title('Second Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(513);
        plot(Step3_Filtered);
        title('Third Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(514);
        plot(Step4_Filtered);
        title('Fourth Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');


        subplot(515);
        plot(Step5_Filtered);
        title('Fifth Step')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        text(4,60 ,texlabel('Steps Filtered'));
        
        %Displaying Filtered Steps
        
        
    case 3
        
        n = 4;        
        str = 'symmetric';
        
        
        Axis1_Filtered = myMedFilt(HeightAccel, n, str);
        Axis2_Filtered = myMedFilt(WidthAccel, n, str);
        Axis3_Filtered = myMedFilt(LengthAccel, n, str);
        
        scrsz = get(0,'ScreenSize');
         %Displaying Unfiltered Steps
        figure('Position',[1 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2], 'Name','3 Axses Before Median Signal Calc')
        
        subplot(311);
        plot(HeightAccel);
        title('Height Acceleration')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(312);
        plot(WidthAccel);
        title('Width Acceleration')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');


        subplot(313);
        plot(LengthAccel);
        title('Length Acceleration')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        plot(WidthAccel_Other);
        title('Acceleration By Width Axis')
        xlabel('Time (Seconds)');
        ylabel('Acceleration(m/s^2)');  
        
        
        figure('Position',[scrsz(3)/2 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2], 'Name','3 Axses After Median Signal Calc');
        
        subplot(311);
        plot(Axis1_Filtered);
        title('Height Acceleration')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(312);
        plot(Axis2_Filtered);
        title('Width Acceleration')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');


        subplot(313);
        plot(Axis3_Filtered);
        title('Length Acceleration')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        plot(WidthAccel_Other);
        title('Acceleration By Width Axis')
        xlabel('Time (Seconds)');
        ylabel('Acceleration(m/s^2)');  
        
        
    case 4
        
        n = 4;        
        str = 'symmetric';
        
        Axis1_Prc1 = prctile( myMedFilt(HeightAccel, n, str), 10);
        Axis1_Prc2 = prctile( myMedFilt(HeightAccel, n, str), 90);
        
        Axis2_Prc1 = prctile( myMedFilt(WidthAccel, n, str), 10);
        Axis2_Prc2 = prctile( myMedFilt(WidthAccel, n, str), 90);
        
        
        Axis3_Prc1 = prctile( myMedFilt(LengthAccel, n, str), 10);
        Axis3_Prc2 = prctile( myMedFilt(LengthAccel, n, str), 90);
        
        
        disp('Height Acceleration Precentile 10:');
        disp(Axis1_Prc1);
        disp('Height Acceleration Precentile 90:');
        disp(Axis1_Prc2);
        disp('Width Acceleration Precentile 10:');
        disp(Axis2_Prc1);
        disp('Width Acceleration Precentile 90:');
        disp(Axis2_Prc2);
        disp('Length Acceleration Precentile 10:');
        disp(Axis3_Prc1);
        disp('Length Acceleration Precentile 90:');
        disp(Axis3_Prc2);
        
        %{ 
        %Alternative
        Axis1_Prc1 = prctile(HeightAccel, 10);
        Axis1_Prc2 = prctile(HeightAccel, 90);
        
        Axis2_Prc1 = prctile(WidthAccel, 10);
        Axis2_Prc2 = prctile(WidthAccel, 90);
        
        
        Axis3_Prc1 = prctile(LengthAccel, 10);
        Axis3_Prc2 = prctile(LengthAccel, 90);
        
        %}
        
        
        
    case 5
        
        %Calculate Median& Median-Precentiles
        n = 4;        
        str = 'symmetric'; 
        
        Axis1_Filtered= myMedFilt(HeightAccel, n, str); 
        Axis1_Prc1 = prctile( myMedFilt(HeightAccel, n, str), 10);
        Axis1_Prc2 = prctile( myMedFilt(HeightAccel, n, str), 90);
        Axis1_Prc=[Axis1_Prc1,Axis1_Prc2];
        
        Axis2_Filtered= myMedFilt(WidthAccel, n, str);
        Axis2_Prc1 = prctile( myMedFilt(WidthAccel, n, str), 10);
        Axis2_Prc2 = prctile( myMedFilt(WidthAccel, n, str), 90);
        Axis2_Prc=[Axis2_Prc1,Axis2_Prc2];
        
        Axis3_Filtered=myMedFilt(LengthAccel, n, str);
        Axis3_Prc1 = prctile( myMedFilt(LengthAccel, n, str), 10);
        Axis3_Prc2 = prctile( myMedFilt(LengthAccel, n, str), 90);
        Axis3_Prc=[Axis3_Prc1,Axis3_Prc2];       
        %Calculate Median& Median-Precentiles
        
        
        %Interpolation
        Axis1_interp= interp1( myMedFilt(HeightAccel, n, str), Axis1_Prc);
        Axis2_interp= interp1( myMedFilt(WidthAccel, n, str), Axis2_Prc);
        Axis3_interp= interp1( myMedFilt(LengthAccel, n, str), Axis3_Prc);
        %Interpolation
        
        %{ 
        %Test1
        Axis1_interp= interp1(HeightAccel,Axis1_Filtered,Axis1_Prc1)
        Axis1_interp2= interp1(HeightAccel,Axis1_Filtered,Axis1_Prc2)
        
        Axis2_interp= interp1(WidthAccel,Axis2_Filtered,Axis2_Prc);
        Axis2_interp2= interp1(WidthAccel,Axis2_Filtered,Axis2_Prc2)
        
        Axis3_interp= interp1(LengthAccel,Axis3_Filtered,Axis3_Prc);
        Axis3_interp2= interp1(LengthAccel,Axis3_Filtered,Axis3_Prc2)
        %Test1
        %} 
        
        %{
        %Test2
        figure('Name','Interpolation of 3 Axises');
        
        subplot(311)
        plot(Axis1_interp);
        
        subplot(312)
        plot(Axis2_interp);
        
        subplot(313)
        plot(Axis2_interp); 
        %Test2
        %}
        
        disp(Axis1_interp);
        disp(Axis2_interp);
        disp(Axis3_interp);
        
    case 6
        
        %Calculate Median& Median-Precentiles
        n = 4;        
        str = 'symmetric'; 
        
        Axis1_Filtered= myMedFilt(HeightAccel, n, str); 
        Axis1_Prc1 = prctile( myMedFilt(HeightAccel, n, str), 10);
        Axis1_Prc2 = prctile( myMedFilt(HeightAccel, n, str), 90);
        Axis1_Prc=[Axis1_Prc1,Axis1_Prc2];
        
        Axis2_Filtered= myMedFilt(WidthAccel, n, str);
        Axis2_Prc1 = prctile( myMedFilt(WidthAccel, n, str), 10);
        Axis2_Prc2 = prctile( myMedFilt(WidthAccel, n, str), 90);
        Axis2_Prc=[Axis2_Prc1,Axis2_Prc2];
        
        Axis3_Filtered=myMedFilt(LengthAccel, n, str);
        Axis3_Prc1 = prctile( myMedFilt(LengthAccel, n, str), 10);
        Axis3_Prc2 = prctile( myMedFilt(LengthAccel, n, str), 90);
        Axis3_Prc=[Axis3_Prc1,Axis3_Prc2];       
        %Calculate Median& Median-Precentiles
        
        %Plot
        figure('Name','3 Axses Median Filter& Perecentiles')
        
        subplot(311)
        plot(Axis1_Filtered);
        hold on
        plot(Axis1_Prc,'r*')
        title('Height Acceleration')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Data', 'Perecentiles 10&90')
        
        
        subplot(312)
        plot(Axis2_Filtered);
        hold on
        plot(Axis2_Prc,'r*')
        title('Width Acceleration')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Data', 'Perecentiles 10&90')
        
        
        subplot(313)
        plot(Axis3_Filtered);
        hold on
        plot(Axis3_Prc,'r*') 
        title('Length Acceleration')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Data', 'Perecentiles 10&90')
        
        %Plot
        
        
end




%%

end








%%
%---Functions Used in Step 1


function [w,f] = frequencyVector(t,s)

L = length(t);
if mod(length(t),2)
    x = linspace(-L/2, L/2, L);
else
    x = linspace(-L/2 - 1, L/2, L);
end
f = x / (L * median(diff(t)));
w = 2*pi*f;
end


function Spectral= mySpectralPeriodCalc(Signal,f)
[pks,locs] = findpeaks(abs(Signal));
[ Secondloc ]= second_max(pks,locs);
Spectral= 1/abs(f(Secondloc));
end


function [ Secondloc ]= second_max(pks,locs)
[~,index] = max(pks(pks<max(pks)));
Secondloc= locs(index);
end

%---Functions Used in Step 1


%---Functions Used in Step 2

function sig = myLPF(w, sig, c)

f = fftshift(fft(sig));

inds = find(w < -c | w > c);
f(inds) = 0;

sig = real(ifft(ifftshift(f)));

end

function sig = myHPF(w, sig, c)

f = fftshift(fft(sig));

inds = find(w > -c & w < c);
f(inds) = 0;

sig = real(ifft(ifftshift(f)));

end

function sig = myBPF(w, sig, cl, ch)

sig = myLPF(w, sig, ch);
sig = myHPF(w, sig, cl);

end

function sig = myBSF(w, sig, cl, ch)

f = fftshift(fft(sig));

indsL = find(w < -cl | w > cl);
indsH = find(w > -ch & w < ch);
f(intersect(indsL,indsH)) = 0;

sig = real(ifft(ifftshift(f)));

end


%---Functions Used in Step 2


%---Functions Used in Step 3
function filteredSignal = myMedFilt(sig, n, str)

if nargin == 2
    str = 'symmetric';
end

switch str
    case 'leftToRight'
        
        paddedSig = [sig, ones(1,2*n+1)*sig(end)];
        for k = 1:length(sig)
            f1(k) = median(paddedSig(k:k+2*n));
        end
        filteredSignal = f1;
        
    case 'rightToLeft'
        
        f2 = myMedFilt(sig(end:-1:1), n, 'leftToRight');
        filteredSignal = f2(end:-1:1);
        
    case 'symmetric'
        
        paddedSig = [ones(1,n)*sig(1), sig, ones(1,n)*sig(end)];

        for k = 1:length(sig)
            f3(k) = median(paddedSig(k:k+2*n));
        end
        
        filteredSignal = f3;
        
    otherwise
        filteredSignal = myMedFilt(sig, n, 'symmetric');
end

end

%---Functions Used in Step 3





%---Functions Used in Step 4
function new_sig = myPercentiles(sig, p)

new_sig=sig;
%f = fftshift(fft(sig));

inds = find(sig < -p | sig > p);
new_sig(inds) = 0;

end

%---Functions Used in Step 4
%%














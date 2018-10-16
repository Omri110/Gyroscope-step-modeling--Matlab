%Project By Omri Weiss
%I.D 308248657
%% Code Order&Remarks
% Order: Data Reading and Variables -> Cases for implementing sections -> Functions used for those sections
% Functions for each section are marked with comments in Begin&End
% Each Function is marked with comments in Begin&End
% Most of the code contain comments in Begin&End
%%


function Project

Number = 1;
% 0     - Display Essentials
% 1     - Section 1
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




%Width_ft = fft(WidthAccel);
%Fourier transformation for Samples
%signal=fftshift(Width_ft);
%Shifting the axis to 0 before filtering 



%%Cases
switch Number
    
    case 0
        
               
        
        %{
        figure('Name','Samples of Steps for Width Accel');
        
         
        subplot(311);
        plot(WidthAccel(:,1100:1800));
        title('Sample 1100-1800')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        subplot(312);
        plot(WidthAccel(:,1800:2500));
        title('Sample 1800-2500')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');


        subplot(313);
        plot(WidthAccel(:,3200:3900));
        title('Sample 3200-3900')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
           
        
        
        
          figure('Name','Samples of Steps for Length Accel');
        
         
        subplot(311);
        plot(LengthAccel(:,1100:1800));
        title('Sample 1100-1800')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        subplot(312);
        plot(LengthAccel(:,1800:2500));
        title('Sample 1800-2500')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');


        subplot(313);
        plot(LengthAccel(:,3200:3900));
        title('Sample 3200-3900')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        %}
        
        
        
        %{
        figure('Name','Sample of a step in Width Acceleration');
        plot(WidthAccel(:,1100:1250));
        
        figure('Name','Sample of a step in Length Acceleration');
        plot(LengthAccel(:,1840:2140));
        
        
        %}
        
        
        
        figure('Name','Sample of a few steps in Width Acceleration');
        plot(WidthAccel(:,800:1250));
        
         figure('Name','Sample of a few steps in Width Acceleration');
        plot(WidthAccel(:,1500:3000));
        
        
        figure('Name','Sample of a few steps in Length Acceleration');
        plot(LengthAccel(:,900:1700));
        
        figure('Name','Sample of a few steps in Length Acceleration');
        plot(LengthAccel(:,1840:2440));
        
        

    
    case 1  
        %Getting Steps
        [Seperated,counterSteps]= SeperateSteps(WidthAccel)


        Step1= Seperated(1,:);

        Step2= Seperated(2,:);

        Step3= Seperated(3,:);

        Step4= Seperated(4,:);

        Step5= Seperated(5,:);
        %Getting Steps
        


        %Displaying width acceleration
        scrsz = get(0,'ScreenSize');
        figure('Position',[1 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2], 'Name','All the movement')
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





    case 2
        
        c=3;             
         %{
        [w1,f1] = frequencyVector(1:7680,Step1);        
        Step1_Filtered = myHPF(w1, Step1, c) 
        %}
        
        [Seperated,counterSteps]= SeperateSteps(WidthAccel)
        
        [RealSeperated,RealcounterSteps]= RemoveAbnormal(Seperated)
               
        
        Step1= RealSeperated(1,:);

        Step2= RealSeperated(2,:);

        Step3= RealSeperated(3,:);

        Step4= RealSeperated(4,:);

        Step5= RealSeperated(5,:);
        
       
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
        
        [Seperated,counterSteps]= SeperateSteps(WidthAccel)
        
        [RealSeperated,RealcounterSteps]= RemoveAbnormal(Seperated)
               
        
        Step1_Filtered= myMedFilt(RealSeperated(1,:), n, str); 

        Step2_Filtered= myMedFilt(RealSeperated(2,:), n, str); 

        Step3_Filtered= myMedFilt(RealSeperated(3,:), n, str); 
        
        Step4_Filtered= myMedFilt(RealSeperated(4,:), n, str); 

        Step5_Filtered= myMedFilt(RealSeperated(5,:), n, str); 
        
        
        %Axis1_Filtered = 
        %Axis1_Filtered= medfilt1(HeightAccel,3);
        
        %Axis2_Filtered = myMedFilt(WidthAccel, n, str);
        %Axis2_Filtered= medfilt1(WidthAccel,3);
        
        %Axis3_Filtered = myMedFilt(LengthAccel, n, str);
        %Axis3_Filtered =medfilt1(LengthAccel,3);
        
        
        
        figure('Position',[scrsz(3)/2 scrsz(4)/2 scrsz(3)/2 scrsz(4)/2], 'Name','Steps After Median Signal Calc');
        
        subplot(511);
        plot(Step1_Filtered);
        title('Step 1')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');

        subplot(512);
        plot(Step2_Filtered);
        title('Step 2')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');


        subplot(513);
        plot(Step3_Filtered);
        title('Step 3')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        
        
        subplot(514);
        plot(Step4_Filtered);
        title('Step 4')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');        
        
        
        subplot(515);
        plot(Step5_Filtered);
        title('Step 5')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        
        
        
    case 4
        
        
        [Seperated,counterSteps]= SeperateSteps(WidthAccel)
        
        [RealSeperated,RealcounterSteps]= RemoveAbnormal(Seperated)
               
        
        Step1_Prc1= prctile( RealSeperated(1,:), 10); 
        Step1_Prc2= prctile( RealSeperated(1,:), 90);
        
        Step2_Prc1= prctile( RealSeperated(2,:), 10); 
        Step2_Prc2= prctile( RealSeperated(2,:), 90);
        
        
        Step3_Prc1= prctile( RealSeperated(3,:), 10); 
        Step3_Prc2= prctile( RealSeperated(3,:), 90);
        

     
        
        
        disp('Step 1 Precentile 10:');
        disp(Step1_Prc1);
        disp('Step 1 Precentile 90:');
        disp(Step1_Prc2);
        disp('Step 2 Precentile 10:');
        disp(Step2_Prc1);
        disp('Step 2 Precentile 90:');
        disp(Step2_Prc2);
        disp('Step 3 Precentile 10:');
        disp(Step3_Prc1);
        disp('Step 3 Precentile 90:');
        disp(Step3_Prc1);

        
        
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
        plot(Axis1_Prc1,'r*')
        plot(Axis1_Prc2,'g*')
        title('Height Acceleration')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Data', 'Perecentile 10', 'Perecentile 90')
        
        
        subplot(312)
        plot(Axis2_Filtered);
        hold on
        plot(Axis2_Prc1,'r*')
        plot(Axis2_Prc2,'g*')
        title('Width Acceleration')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Data', 'Perecentile 10', 'Perecentile 90')
        
        
        subplot(313)
        plot(Axis3_Filtered);
        hold on
        plot(Axis3_Prc1,'r*')
        plot(Axis3_Prc2,'g*') 
        title('Length Acceleration')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Data', 'Perecentile 10', 'Perecentile 90')
        
        %Plot
        
        
end




%%

end








%%
%---Functions Used in Step 1


function [Seperated,counterSteps]= SeperateSteps(signal)
    %temp=zeros(length(signal));
    isStep=true;
    counterSteps=0;
    StepArray= zeros(500,191)
    %StepArray= zeros(length(signal));
    %500 steps max, each step is 190 length max
    
    for i= 1:length(signal)
        
        if(-2< signal(i) && signal(i)< 2)
            
            for j= i:60
                %check all the 60 next places is data to analyze the begining of a normal step
                if (signal(j)<-3  || signal(j)> 3)%-> means it's not the begining of a mornal step
                    isStep=false;
                end
            end
            
            if(isStep == true)
                counterSteps= counterSteps+1;
                StepArray(counterSteps,:)= signal(i:i+190)
                i=i+190;
            end
            
        end
        
        isStep= true;%intiallize default again to true value to check next time
        
                
    end%end for, all analyzed steps inserted to 'Seperated' matrix
    
    Seperated= StepArray;


end

%---Functions Used in Step 1


%---Functions Used in Step 2

function [RealSeperated,RealcounterSteps]= RemoveAbnormal(Seperated)
    %temp=zeros(length(signal));
    isStep=true;
    RealcounterSteps=0;
    RealcounterSteps= zeros(size(Seperated))
    tempMax=0;
    %StepArray= zeros(length(signal));
    %500 steps max, each step is 190 length max
    
    for i= 1:500
        
        tempMax= max(StepArray(i,:))
        if (tempMax<17  || tempMax> 23)%maximum of each step is around 17-23 range
            isStep=false;
        end
        
        if(isStep == true)
                RealcounterSteps= RealcounterSteps+1;
                RealcounterSteps(RealcounterSteps,:)= Seperated(i,:);     %-> inserting the real step to the new matrix          
        end  
        
        isStep= true;%intiallize default again to true value to check next time
        
                
    end%end for, all analyzed steps inserted to 'Seperated' matrix
    



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














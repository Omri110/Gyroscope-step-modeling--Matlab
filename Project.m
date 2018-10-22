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
        [StepArray,counterSteps]= SeperateSteps(WidthAccel);

        counter=1;
        while counter< 500
            if(StepArray(counter,1) ~= 0)
                Step1= StepArray(counter,:);
                break;
                
            else
                counter= counter+1;
                continue;
            end
        end

        Step2= StepArray(counter+1,:);

        Step3= StepArray(counter+2,:);

        Step4= StepArray(counter+3,:);

        Step5= StepArray(counter+4,:);        
        
        Step6= StepArray(counter+5,:);
        
        Step7= StepArray(counter+6,:);
        
        Step8= StepArray(counter+7,:);
        
        Step9= StepArray(counter+8,:);
        
        %Getting Steps
        
        %Plotting Steps
        
        figure('Name','Steps');
        subplot(311);
        plot(Step1);
        title('Step 1')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        subplot(312);
        plot(Step2);
        title('Step 2')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        subplot(313);
        plot(Step3);
        title('Step 3')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        figure('Name','Steps');
        subplot(311);
        plot(Step4);
        title('Step 4')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        subplot(312);
        plot(Step5);
        title('Step 5')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        subplot(313);
        plot(Step6);
        title('Step 6')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        
        figure('Name','Steps');
        subplot(311);
        plot(Step7);
        title('Step 7')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        subplot(312);
        plot(Step8);
        title('Step 8')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        subplot(313);
        plot(Step9);
        title('Step 9')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');       
        
        %Plotting Steps
        
        
        fprintf('%d Steps counted in signal.\n',counterSteps);
        



    case 2
        
        
        [Seperated,counterSteps]= SeperateSteps(WidthAccel)
        
        [RealSeperated,RealcounterSteps,AbnormalSteps,FalsecounterSteps]= RemoveAbnormal(Seperated)
               
        
        Step1= RealSeperated(1,:);

        Step2= RealSeperated(2,:);

        Step3= RealSeperated(3,:);

        Step4= RealSeperated(4,:);

        Step5= RealSeperated(5,:);
        
        Step6= RealSeperated(5,:);
        
        Step7= RealSeperated(5,:);
        
        Step8= RealSeperated(5,:);
        
        Step9= RealSeperated(5,:);       
              


        %Plotting Filtered Steps
               
        figure('Name','Steps');
        subplot(311);
        plot(Step1);
        title('Step 1')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        subplot(312);
        plot(Step2);
        title('Step 2')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        subplot(313);
        plot(Step3);
        title('Step 3')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        figure('Name','Steps');
        subplot(311);
        plot(Step4);
        title('Step 4')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        subplot(312);
        plot(Step5);
        title('Step 5')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        subplot(313);
        plot(Step6);
        title('Step 6')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        
        figure('Name','Steps');
        subplot(311);
        plot(Step7);
        title('Step 7')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        subplot(312);
        plot(Step8);
        title('Step 8')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        
        subplot(313);
        plot(Step9);
        title('Step 9')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');       
        
        %Plotting Filtered Steps
        
        
        fprintf('%d Real Steps counted in signal.\n',RealcounterSteps);
        fprintf('%d AbNormal Steps counted in signal.\n',FalsecounterSteps);
        
        
    case 3
        
       [Seperated,counterSteps]= SeperateSteps(WidthAccel)
        
       [RealSeperated,RealcounterSteps,AbnormalSteps,FalsecounterSteps]= RemoveAbnormal(Seperated)
               
        
        Step1= RealSeperated(1,:);
        Step2= RealSeperated(2,:);
        Step3= RealSeperated(3,:);
        Step4= RealSeperated(4,:);
        Step5= RealSeperated(5,:);        
        Step6= RealSeperated(6,:);        
        Step7= RealSeperated(7,:);        
        Step8= RealSeperated(8,:);        
        Step9= RealSeperated(9,:);  
               
        
        Step1_Filtered= medfilt1(Step1); 
        Step2_Filtered= medfilt1(Step2); 
        Step3_Filtered= medfilt1(Step3); 
        Step4_Filtered= medfilt1(Step4); 
        Step5_Filtered= medfilt1(Step5); 
        Step6_Filtered= medfilt1(Step6); 
        Step7_Filtered= medfilt1(Step7); 
        Step8_Filtered= medfilt1(Step8); 
        Step9_Filtered= medfilt1(Step9); 
        
        
%Plotting Steps

        
        figure('Name','Steps');
        subplot(311);
        plot(Step1);
        hold on
        plot(Step1_Filtered);
        title('Step 1')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Filtered')
        
        subplot(312);
        plot(Step2);
        hold on
        plot(Step2_Filtered);
        title('Step 2')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Filtered')
        
        subplot(313);
        plot(Step3);
        hold on
        plot(Step3_Filtered);
        title('Step 3')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Filtered')
        
        figure('Name','Steps');
        subplot(311);
        plot(Step4);
        hold on
        plot(Step4_Filtered);
        title('Step 4')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Filtered')
        
        subplot(312);
        plot(Step5);
        hold on
        plot(Step5_Filtered);
        title('Step 5')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Filtered')
        
        subplot(313);
        plot(Step6);
        hold on
        plot(Step6_Filtered);
        title('Step 6')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Filtered')
        
        
        figure('Name','Steps');
        subplot(311);
        plot(Step7);
        hold on
        plot(Step7_Filtered);
        title('Step 7')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Filtered')
        
        subplot(312);
        plot(Step8);
        hold on
        plot(Step8_Filtered);
        title('Step 8')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Filtered')
        
        subplot(313);
        plot(Step9);
        hold on
        plot(Step9_Filtered);
        title('Step 9')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)'); 
        legend('Original','Filtered')
        
        %Plotting Steps
        
        
    case 4
        
        [Seperated,counterSteps]= SeperateSteps(WidthAccel)
        
       [RealSeperated,RealcounterSteps,AbnormalSteps,FalsecounterSteps]= RemoveAbnormal(Seperated)
        
        Step1= RealSeperated(1,:);
        Step2= RealSeperated(2,:);
        Step3= RealSeperated(3,:);
        Step4= RealSeperated(4,:);
        Step5= RealSeperated(5,:);        
        Step6= RealSeperated(6,:);        
        Step7= RealSeperated(7,:);        
        Step8= RealSeperated(8,:);        
        Step9= RealSeperated(9,:);  
               
       Step1_prc10 = Step1(Step1<prctile(Step1,10));          
       Step1_prc90 = Step1(Step1<prctile(Step1,90));
       
       Step2_prc10 = Step2(Step2<prctile(Step2,10));          
       Step2_prc90 = Step2(Step2<prctile(Step2,90));
       
       Step3_prc10 = Step3(Step3<prctile(Step3,10));          
       Step3_prc90 = Step3(Step3<prctile(Step3,90));
       
       Step4_prc10 = Step4(Step4<prctile(Step4,10));          
       Step4_prc90 = Step4(Step4<prctile(Step4,90));
       
       Step5_prc10 = Step5(Step5<prctile(Step5,10));          
       Step5_prc90 = Step5(Step5<prctile(Step5,90));
       
       Step6_prc10 = Step6(Step6<prctile(Step6,10));          
       Step6_prc90 = Step6(Step6<prctile(Step6,90));
       
       Step7_prc10 = Step7(Step7<prctile(Step7,10));          
       Step7_prc90 = Step7(Step7<prctile(Step7,90));
       
       Step8_prc10 = Step8(Step8<prctile(Step8,10));          
       Step8_prc90 = Step8(Step8<prctile(Step8,90));
       
       Step9_prc10 = Step9(Step9<prctile(Step9,10));          
       Step9_prc90 = Step9(Step9<prctile(Step9,90));
       
             
%Plotting Steps

        
        figure('Name','Steps Percentiles 10&90');
        subplot(311);
        plot(Step1);
        hold on
        plot(Step1_prc10);
        plot(Step1_prc90);
        title('Step 1')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90' )
        
        subplot(312);
        plot(Step2);
        hold on
        plot(Step2_prc10);
        plot(Step2_prc90);
        title('Step 2')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90' )
        
        subplot(313);
        plot(Step3);
        hold on
        plot(Step3_prc10);
        plot(Step3_prc90);
        title('Step 3')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90' )
        
        figure('Name','Steps Percentiles 10&90');
        subplot(311);
        plot(Step4);
        hold on
        plot(Step4_prc10);
        plot(Step4_prc90);
        title('Step 4')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90' )
        
        subplot(312);
        plot(Step5);
        hold on
        plot(Step5_prc10);
        plot(Step5_prc90);
        title('Step 5')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90' )
        
        subplot(313);
        plot(Step6);
        hold on
        plot(Step6_prc10);
        plot(Step6_prc90);
        title('Step 6')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90' )
        
        
        figure('Name','Steps Percentiles 10&90');
        subplot(311);
        plot(Step7);
        hold on
        plot(Step7_prc10);
        plot(Step7_prc90);
        title('Step 7')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90' )
        
        subplot(312);
        plot(Step8);
        hold on
        plot(Step8_prc10);
        plot(Step8_prc90);
        title('Step 8')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90' )
        
        subplot(313);
        plot(Step9);
        hold on
        plot(Step9_prc10);
        plot(Step9_prc90);
        title('Step 9')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90' )
        
        %Plotting Steps
        

        
        

        
    case 5
        
        [Seperated,counterSteps]= SeperateSteps(WidthAccel)
        
       [RealSeperated,RealcounterSteps,AbnormalSteps,FalsecounterSteps]= RemoveAbnormal(Seperated)
               
        
        Step1= RealSeperated(1,:);
        Step2= RealSeperated(2,:);
        Step3= RealSeperated(3,:);
        Step4= RealSeperated(4,:);
        Step5= RealSeperated(5,:);        
        Step6= RealSeperated(6,:);        
        Step7= RealSeperated(7,:);        
        Step8= RealSeperated(8,:);        
        Step9= RealSeperated(9,:);  
               
        
        Step1_Filtered= medfilt1(Step1); 
        Step2_Filtered= medfilt1(Step2); 
        Step3_Filtered= medfilt1(Step3); 
        Step4_Filtered= medfilt1(Step4); 
        Step5_Filtered= medfilt1(Step5); 
        Step6_Filtered= medfilt1(Step6); 
        Step7_Filtered= medfilt1(Step7); 
        Step8_Filtered= medfilt1(Step8); 
        Step9_Filtered= medfilt1(Step9); 
        
        fprintf('Before Interpolation :\n',find_size(Step1_Filtered));        
        fprintf('%d Is the size of Step1.\n',find_size(Step1_Filtered));
        fprintf('%d Is the size of Step2.\n',find_size(Step2_Filtered));
        fprintf('%d Is the size of Step3.\n',find_size(Step3_Filtered));
        fprintf('%d Is the size of Step4.\n',find_size(Step4_Filtered));
        fprintf('%d Is the size of Step5.\n',find_size(Step5_Filtered));
        fprintf('%d Is the size of Step6.\n',find_size(Step6_Filtered));
        fprintf('%d Is the size of Step7.\n',find_size(Step7_Filtered));
        fprintf('%d Is the size of Step8.\n',find_size(Step8_Filtered));
        fprintf('%d Is the size of Step9.\n',find_size(Step9_Filtered));
        
        
        %Interpolation
        size_step1= find_size(Step1_Filtered);
        size_step2= find_size(Step2_Filtered);
        size_step3= find_size(Step3_Filtered);
        
        Step1_interp= interp1( 1:size_step1, Step1_Filtered(1:size_step1), size_step1/180);
        Step2_interp= interp1( 1:size_step2, Step2_Filtered(1:size_step2), size_step2/180);
        Step3_interp= interp1( 1:size_step3, Step3_Filtered(1:size_step3), size_step3/180);       
        %Interpolation
        
        
        figure('Name','Interpolation of steps 1,2,3');
        subplot(311);
        plot(Step1);
        hold on
        plot(Step1_interp);
        title('Step 1')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Interpolated')
        
        subplot(312);
        plot(Step2);
        hold on
        plot(Step2_interp);
        title('Step 2')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Interpolated')
        
        subplot(313);
        plot(Step3);
        hold on
        plot(Step3_interp);
        title('Step 3')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Interpolated')
        
        
        
    case 6
       [Seperated,counterSteps]= SeperateSteps(WidthAccel)
        
       [RealSeperated,RealcounterSteps,AbnormalSteps,FalsecounterSteps]= RemoveAbnormal(Seperated)
        
        Step1= RealSeperated(1,:);
        Step2= RealSeperated(2,:);
        Step3= RealSeperated(3,:);
        Step4= RealSeperated(4,:);
        Step5= RealSeperated(5,:);        
        Step6= RealSeperated(6,:);        
        Step7= RealSeperated(7,:);        
        Step8= RealSeperated(8,:);        
        Step9= RealSeperated(9,:); 
        
         
        Step1_Filtered= medfilt1(Step1); 
        Step2_Filtered= medfilt1(Step2); 
        Step3_Filtered= medfilt1(Step3); 
        Step4_Filtered= medfilt1(Step4); 
        Step5_Filtered= medfilt1(Step5); 
        Step6_Filtered= medfilt1(Step6); 
        Step7_Filtered= medfilt1(Step7); 
        Step8_Filtered= medfilt1(Step8); 
        Step9_Filtered= medfilt1(Step9); 
               
       Step1_prc10 = Step1(Step1<prctile(Step1,10));          
       Step1_prc90 = Step1(Step1<prctile(Step1,90));
       
       Step2_prc10 = Step2(Step2<prctile(Step2,10));          
       Step2_prc90 = Step2(Step2<prctile(Step2,90));
       
       Step3_prc10 = Step3(Step3<prctile(Step3,10));          
       Step3_prc90 = Step3(Step3<prctile(Step3,90));
       
       Step4_prc10 = Step4(Step4<prctile(Step4,10));          
       Step4_prc90 = Step4(Step4<prctile(Step4,90));
       
       Step5_prc10 = Step5(Step5<prctile(Step5,10));          
       Step5_prc90 = Step5(Step5<prctile(Step5,90));
       
       Step6_prc10 = Step6(Step6<prctile(Step6,10));          
       Step6_prc90 = Step6(Step6<prctile(Step6,90));
       
       Step7_prc10 = Step7(Step7<prctile(Step7,10));          
       Step7_prc90 = Step7(Step7<prctile(Step7,90));
       
       Step8_prc10 = Step8(Step8<prctile(Step8,10));          
       Step8_prc90 = Step8(Step8<prctile(Step8,90));
       
       Step9_prc10 = Step9(Step9<prctile(Step9,10));          
       Step9_prc90 = Step9(Step9<prctile(Step9,90));
       
             
%Plotting Steps

        
        figure('Name','Steps Percentiles 10&90& Median');
        subplot(311);
        plot(Step1);
        hold on
        plot(Step1_prc10);
        plot(Step1_prc90);
        plot(Step1_Filtered);
        title('Step 1')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90','Median Pattern' )
        
        subplot(312);
        plot(Step2);
        hold on
        plot(Step2_prc10);
        plot(Step2_prc90);
        plot(Step2_Filtered);
        title('Step 2')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90','Median Pattern' )
        
        subplot(313);
        plot(Step3);
        hold on
        plot(Step3_prc10);
        plot(Step3_prc90);
        plot(Step3_Filtered);
        title('Step 3')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90','Median Pattern' )
        
        figure('Name','Steps Percentiles 10&90& Median');
        subplot(311);
        plot(Step4);
        hold on
        plot(Step4_prc10);
        plot(Step4_prc90);
        plot(Step4_Filtered);
        title('Step 4')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
       legend('Original','Percentile 10','Percentile 90','Median Pattern' )
        
        subplot(312);
        plot(Step5);
        hold on
        plot(Step5_prc10);
        plot(Step5_prc90);
        plot(Step5_Filtered);
        title('Step 5')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90','Median Pattern' )
        
        subplot(313);
        plot(Step6);
        hold on
        plot(Step6_prc10);
        plot(Step6_prc90);
        plot(Step6_Filtered);
        title('Step 6')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90','Median Pattern' )
        
        
        figure('Name','Steps Percentiles 10&90& Median');
        subplot(311);
        plot(Step7);
        hold on
        plot(Step7_prc10);
        plot(Step7_prc90);
        plot(Step7_Filtered);
        title('Step 7')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90','Median Pattern' )
        
        subplot(312);
        plot(Step8);
        hold on
        plot(Step8_prc10);
        plot(Step8_prc90);
        plot(Step8_Filtered);
        title('Step 8')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90','Median Pattern' )
        
        subplot(313);
        plot(Step9);
        hold on
        plot(Step9_prc10);
        plot(Step9_prc90);
        plot(Step9_Filtered);
        title('Step 9')
        xlabel('Time (MilliSeconds)');
        ylabel('Acceleration(m/s^2)');
        legend('Original','Percentile 10','Percentile 90','Median Pattern' )
        
        %Plotting Steps
        
        
        
end




%%

end








%%
%---Functions Used in Step 1


function [StepArray,counterSteps]= SeperateSteps(signal)
    
    isStep=false;
    counterSteps=1;
    TempArray= zeros(61);
    %Used to check the begining of the pattern
    Second_TempArray= zeros(101);
    %Used to make sure that the begining of the signal is not too long
    StepArray= zeros(500,221)

    
    i=1;
    while i<(length(signal)-220)

        TempArray= signal(i:i+60);
        Second_TempArray= signal(i:i+100);
        
        if(-3< min(TempArray) && max(TempArray)< 3 && max(Second_TempArray) > 3 )           
           counterSteps= counterSteps+1;
           StepArray(counterSteps,:)= signal(i:i+220);
           i=i+220;
           
           %isStep=true;
        else
               i=i+1;               
        end        
            
            
     end%end while, all analyzed steps inserted to 'StepArray' matrix
        


end

%---Functions Used in Step 1


%---Functions Used in Step 2

function [RealSeperated,RealcounterSteps,AbnormalSteps,FalsecounterSteps]= RemoveAbnormal(Seperated)
    
    AbnormalSteps = zeros(size(Seperated) );
    FalsecounterSteps=0;
    RealcounterSteps=0;
    RealSeperated= zeros(size(Seperated)) ;
    
    
    for i= 1:500
        
                
        if (max(Seperated(i,:)) <17  || min(Seperated(i,:) ) > -20 )%maximum of each step is around 17-23 range, minimum lower than -20
            FalsecounterSteps= FalsecounterSteps+1;
            AbnormalSteps(FalsecounterSteps,:)= Seperated(i,:);
            
        else
        RealcounterSteps= RealcounterSteps+1;
        RealSeperated(RealcounterSteps,:)= Seperated(i,:);
        
        end
        
                
    end%end for, all analyzed steps inserted to 'Seperated' matrix
    



end


%---Functions Used in Step 2

%---Functions Used in Step 3

%---Functions Used in Step 4

%---Functions Used in Step 5
function size= find_size(Step)

TempArray= zeros(41);
i=1;
while i<( length(Step) )
    
    TempArray= Step(i:i+40);
    if(i > 60 && min(TempArray) > -3 && max(TempArray)< 3 )
        size= i;
        break;
    %Finding the index where the step ends, means it's on the last
    %horizontal line part
    
    else
        i=i+1;
    
    end
end

end


%---Functions Used in Step 5


%%














%Get real Data
real = csvread("real.csv");
%Get Imaginary Data
img = csvread("img.csv");

%Combining Data to form a+bi
data=complex(real,img);

%Mapping the signal in range(-pi,pi)
figure(1)
plot(linspace(-pi,pi,length(data)),fftshift(abs(data)))
ylabel("Magnitude")
xlabel("radians")
title('Shifted Signal')
saveas(gcf,'C:\Users\syed\3D Objects\project\origional\magnitude.png')

%Creating wave file
ft=ifft(data);
filename = 'C:\Users\syed\3D Objects\project\origional\noisy_signal_3.wav';
audiowrite(filename,ft,44100);
clear y Fs


%Plotting phase
figure(2)
freqz(data)
title('Frequency response as magnitude')
xlabel('Frequency');
ylabel('angle');
saveas(gcf,'C:\Users\syed\3D Objects\project\origional\phase.png')






%implementing a low pass filter
    
    fs=44100
    cutoff=fs/length(data)
    lowpasssignal = lowpass(ft,cutoff);
    
    %Creating wave file
    filename = 'C:\Users\syed\3D Objects\project\Filtered\lowpass\filtered_speech_3.wav';
    audiowrite(filename,lowpasssignal,44100);
    clear y Fs
    
    %Plotting Frequency Response as Magnitude
    figure(3)
    plot(abs(lowpasssignal),'r-')
    title('Frequency response as magnitude of high pass filtered signal')
    xlabel('Time');
    ylabel('Magnitude');
    saveas(gcf,'C:\Users\syed\3D Objects\project\Filtered\lowpass\magnitude.png')
    
    %Plotting phase
    figure(4)
    
    freqz(lowpasssignal)
    title('Frequency response as phase of low pass signal')
    xlabel('Frequency');
    ylabel('angle');
    saveas(gcf,'C:\Users\syed\3D Objects\project\Filtered\lowpass\phase.png')



     
    
%implementing a high pass filter

    cutoff=fs/length(data)
    highpasssignal = highpass(ft,cutoff);
    
    %Creating wave file
    filename = 'C:\Users\syed\3D Objects\project\Other filters\highpass\highpassSignal.wav';
    audiowrite(filename,highpasssignal,44100);
    clear y Fs
    
    %Plotting Frequency Response as Magnitude
    figure(5)
    plot(abs(highpasssignal),'r-')
    title('Frequency response as magnitude of high pass filtered signal')
    xlabel('Time');
    ylabel('Magnitude');
    saveas(gcf,'C:\Users\syed\3D Objects\project\Other filters\highpass\magnitude.png')
    
    %Plotting phase
    figure(6)
    
    freqz(highpasssignal)
    title('Frequency response as phase of high pass signal')
    xlabel('Frequency');
    ylabel('angle');
    saveas(gcf,'C:\Users\syed\3D Objects\project\Other filters\highpass\phase.png')



    


%implementing a band stop filter
    
    fs=44100
    cutofflow=fs/length(data)   
    fnyq=fs/2
    cutoffhigh=fnyq-2
    bandstopsignal = bandstop(ft,[cutofflow,cutoffhigh],44100);
    
    %Creating wave file
    filename = 'C:\Users\syed\3D Objects\project\Other filters\bandstop\bandstopSignal.wav';
    audiowrite(filename,bandstopsignal,44100);
    clear y Fs
    
    %Plotting Frequency Response as Magnitude
    figure(7)
    plot(abs(bandstopsignal),'r-')
    title('Frequency response as magnitude of bandstop filtered signal')
    xlabel('Time');
    ylabel('Magnitude');
    saveas(gcf,'C:\Users\syed\3D Objects\project\Other filters\bandstop\magnitude.png')
    
    %Plotting phase
    figure(8)
    %fto=log(ft);
    freqz(bandstopsignal)
    title('Frequency response as phase of bandstop signal')
    xlabel('Time');
    ylabel('angle');
    saveas(gcf,'C:\Users\syed\3D Objects\project\Other filters\bandstop\phase.png')
    



    
    
%implementing a band pass filter
    
    fs=44100
    bandpasssignal = bandpass(ft,[600,1000],fs);
    
    %Creating wave file
    filename = 'C:\Users\syed\3D Objects\project\Other filters\bandpass\bandpassSignal.wav';
    audiowrite(filename,bandpasssignal,44100);
    clear y Fs
    
    %Plotting Frequency Response as Magnitude
    figure(9)
    plot(abs(bandpasssignal),'r-')
    title('Frequency response as magnitude of bandpass filtered signal')
    xlabel('Frequency');
    ylabel('Magnitude');
    saveas(gcf,'C:\Users\syed\3D Objects\project\Other filters\bandpass\magnitude.png')
    
    %Plotting phase
    figure(10)
    %fto=log(ft);
    freqz(bandstopsignal)
    title('Frequency response as phase of bandpass signal')
    xlabel('Frequency');
    ylabel('angle');
    saveas(gcf,'C:\Users\syed\3D Objects\project\Other filters\bandpass\phase.png')

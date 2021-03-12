import java.lang.Thread;
clc
close all



%%Leyendo archivos de audio con la palabra "Juan" para comprarar
[Juan0,J0fs] = audioread('Juanito.wav');
[Juan1,J1fs] = audioread('Juanito1.wav');
[Juan2,J2fs] = audioread('Juanito2.wav');
[Juan3,J3fs] = audioread('Juanito3.wav');
[Juan4,J4fs] = audioread('Juanito4.wav');
[Juan5,J5fs] = audioread('Juanito5.wav');
[Juan6,J6fs] = audioread('Juanito6.wav');
[Juan7,J7fs] = audioread('Juanito7.wav');
[Juan8,J8fs] = audioread('Juanito8.wav');
[Juan9,J9fs] = audioread('Juanito9.wav');
[Juan10,J10fs] = audioread('Juanito10.wav');
[Juan11,J11fs] = audioread('Juanito11.wav');
[Juan12,J12fs] = audioread('Juanito12.wav');
[Juan13,J13fs] = audioread('Juanito13.wav');
[Juan14,J14fs] = audioread('Juanito14.wav');
[Juan15,J15fs] = audioread('Juanito15.wav');
[Juan16,J16fs] = audioread('Juanito16.wav');
[Juan17,J17fs] = audioread('Juanito17.wav');

Juan_mono = sum(Juan0,2);
Juan_mono=normalizar(Juan_mono);
Juan1_mono = sum(Juan1,2);
Juan1_mono=normalizar(Juan1_mono);
Juan2_mono = sum(Juan2,2);
Juan2_mono=normalizar(Juan2_mono);
Juan3_mono = sum(Juan3,2);
Juan3_mono=normalizar(Juan3_mono);
Juan4_mono = sum(Juan4,2);
Juan4_mono=normalizar(Juan4_mono);
Juan5_mono = sum(Juan5,2);
Juan5_mono=normalizar(Juan5_mono);
Juan6_mono = sum(Juan6,2);
Juan6_mono=normalizar(Juan6_mono);
Juan7_mono = sum(Juan7,2);
Juan7_mono=normalizar(Juan7_mono);
Juan8_mono = sum(Juan8,2);
Juan8_mono=normalizar(Juan8_mono);
Juan9_mono = sum(Juan9,2);
Juan9_mono=normalizar(Juan9_mono);
Juan10_mono = sum(Juan10,2);
Juan10_mono=normalizar(Juan10_mono);
Juan11_mono = sum(Juan11,2);
Juan11_mono=normalizar(Juan11_mono);
Juan12_mono = sum(Juan12,2);
Juan12_mono=normalizar(Juan12_mono);
Juan13_mono = sum(Juan13,2);
Juan13_mono=normalizar(Juan13_mono);
Juan14_mono = sum(Juan14,2);
Juan14_mono=normalizar(Juan14_mono);
Juan15_mono = sum(Juan15,2);
Juan15_mono=normalizar(Juan15_mono);
Juan16_mono = sum(Juan16,2);
Juan16_mono=normalizar(Juan16_mono);
Juan17_mono = sum(Juan17,2);
Juan17_mono=normalizar(Juan17_mono);


%%se obtiene informacion del audio "juan salvador gaviota" se separa en los
%%sapmples y se obtiene numero de canales, se crea el t



info = audioinfo('juan_salvador_gaviota.mp3');%%se obtiene iformaciond el audio "juan salvador gaviota"
fs= info.SampleRate;
disp(info)
numOfSamples=(info.TotalSamples); %%se separa en los sapmples 
nChannels=(info.NumChannels);%%y se obtiene numero de canales
curSample=1;
Block_Size =25000;%%tamaño para el bloque de influencia
%%inicializa las variables para el display en consola
val = 0;
ref=80;
total =1;
lastJuan = [[0,0]]; %%se crea arreglo para almacenar cada juan contado
while(curSample<=numOfSamples)
    clc;
    disp(lastJuan); %%imprime el juan actual 
    disp(fs)
    N1=curSample;
    N2=curSample+Block_Size-1;
    disp('Leyendo :v')
    disp(N1/fs);
    disp(val);
    disp(total-1);
    if(N2>numOfSamples)
        N2=numOfSamples;
    end
    blockdata = audioread('juan_salvador_gaviota.mp3', [N1,N2]); %Crea el bloque donde se almacena "juan salvador gaviota"
    
    subplot(2,1,1);  %%Muestreo
    plot(blockdata);
    ylim([-1 1]);
    
    blockdata_mono = sum(blockdata,2);
    blockdata_mono = normalizar(blockdata_mono);
    
    val0=normalValueCor(blockdata_mono,Juan_mono);
    val1=normalValueCor(blockdata_mono,Juan1_mono); %% Correlación entre los audios de "Juan" y el audiolibro en dicho bloque.
    val2=normalValueCor(blockdata_mono,Juan2_mono);
    val3=normalValueCor(blockdata_mono,Juan3_mono);
    val4=normalValueCor(blockdata_mono,Juan4_mono);
    val5=normalValueCor(blockdata_mono,Juan5_mono);
    val6=normalValueCor(blockdata_mono,Juan6_mono);
    val7=normalValueCor(blockdata_mono,Juan7_mono);
    val8=normalValueCor(blockdata_mono,Juan8_mono);
    val9=normalValueCor(blockdata_mono,Juan9_mono);
    val10=normalValueCor(blockdata_mono,Juan10_mono);
    val11=normalValueCor(blockdata_mono,Juan11_mono);
    val12=normalValueCor(blockdata_mono,Juan12_mono);
    val13=normalValueCor(blockdata_mono,Juan13_mono);
    val14=normalValueCor(blockdata_mono,Juan14_mono);
    val15=normalValueCor(blockdata_mono,Juan15_mono);
    val16=normalValueCor(blockdata_mono,Juan16_mono);
    val17=normalValueCor(blockdata_mono,Juan17_mono);
    
  val = max([val0,val1,val2,val3,val4,val5,val6,val7,val8,val9,val10,val11,val12,val13,val14,val15,val16,val17]);
   if((val>ref)&&(((N1/fs)-lastJuan(total,1))>Block_Size/fs || N1<Block_Size))  %%Si se encuentra similitud en alguna parte del bloque se aumenta en +1 el ultimo Juan contado
       lastJuan(total+1,1) = N1/fs;
       lastJuan(total+1,2) = val;
       sound(blockdata,fs);
       total = total +1;  %%Total de Juanes encontrados
   end           
    subplot(2,1,2);  %se imprime
    plot(blockdata_mono);
    ylim([-1 1]);
    curSample=curSample+(Block_Size/2);    %si no se deja el desplazamiento en la octaba parte del bloque no detecta ni el primer Juan
    drawnow;
end






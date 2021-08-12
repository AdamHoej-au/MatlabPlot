# Så'rn plotter du Waveforms data i Matlab..

## Waveforms
Eksporter din data!
![image](https://user-images.githubusercontent.com/56192310/93198691-ac17ba00-f74d-11ea-815f-23f1764edf2b.png)

Tjek dine settings! (Kun flueben v. ```Headers``` og ```Labels```)
![image](https://user-images.githubusercontent.com/56192310/93177561-4ae2ed00-f733-11ea-8da1-c6a0edc0bd00.png)

Datasættet fra Waveforms skal lige ændres fra
```matlab
Time (s)	PWM (V)	Motor (V)
-0.008240000000000001	0.00152587890625	1.7510986328125
-0.0082375	0.03173828125	1.75140380859375
```
til 
```matlab
%Time (s)	PWM (V)	Motor (V)
-0.008240000000000001	0.00152587890625	1.7510986328125
-0.0082375	0.03173828125	1.75140380859375
```
Første linje udkommenteres altså med et ```%````.

## MatLab!
```matlab
scope = load('DataFile.txt');

ChA = [scope(:, 1), scope(:, 2)]; % Kanal 1
ChB = [scope(:, 1), scope(:, 3)]; % Kanal 2
```


Her indstilles de parametre der gælder for plottet..
```matlab
%%% Indstillinger...
f0 = 1e3 %% Hvilken frekvens kigger vi på? IKKE samplerate!!!!
t0 = 1/f0 %% Perioden af den
periods = 4; %% Hvor mange perioder vil du se ? 
%%%%
```


Herefter kan figuren plottes..
```matlab
figure(101);
clf;
plot(ChA(:, 1), ChA(:, 2));
hold on
plot(ChB(:, 1), ChB(:, 2));
hold off
xlabel('Tid [s]');
ylabel('[V]');
xlim([0 t0*periods])
% xlim([0 1e-3]) % Brug denne for visning fra [0:1] ms 
legend('Kanal 1','Kanal 2')
grid
print('filnavn','-depsc') % Gem som en EPS fil.. (God til LaTex)
```



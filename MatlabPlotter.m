scope = load('DataFile.txt');

ChA = [scope(:, 1), scope(:, 2)]; % V1 + noise
ChB = [scope(:, 1), scope(:, 3)]; % V1 + noise



%%% Indstillinger...
f0 = 1e3 %% Hvilken frekvens kigger vi på? IKKE samplerate!!!!
t0 = 1/f0 %% Perioden af den
periods = 4; %% Hvor mange perioder vil du se ? 
%%%%

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
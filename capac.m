%Parallel plate Capacitance of a microplastics water sample
%Created for parameric study by John Sebastian

%Save code as capac.m

function C = capac(c,d,l,np)
%use the same unit to specify all lengths
% c = characteristic dimension of microplastics in the system
% d = distance between electrode plates
% l = length of electrode 
% np = number of microplastics in the space (should be less than (l x d)/c

% EXAMPLE CALL: capac(0.5,1.5,15,5000)


% c = characteristic dimension of microplastics in the system
%c = 0.25 mm (example)

%dimensions of electrode plate
% l = length of electrode
%l = 75 mm, equal to the length of std microscopic slide used in the proto
t = c; %into the plane - kept equal to the characteristic dimension

% total distance between electrode plates (including the dielectric
% lining on electrode surface)

%d = 1.5 mm, the thickness of double sided tape used as spacer in the proto

% discretisation of sample space between the plates

n = round(l/c);
m = round(d/c);

F = zeros(m,n);


% number of microplastics of size c x c in the space
%np = 100 - sweep from zero to numel(F)

% max_np = l*d/c.^2;
% if np > max_np
%     warn = ["np should be less than", num2str(max_np)];
%     f = warndlg(warn);
% end


% Indexing random points as locations of microplastics

index = randperm(numel(F),np);

% adding locations to the discrete space F
F(index)=1;
%imwrite(F,[num2str(np),'.png'])
imshow(F);


%% Capacitor values

epsilon = 8.854e-12; %C/Vm
k_w = 70; %dielectric constant of water
k_p = 3; %dielectric constant of plastic

%dielectric film on the metal electrode
t_film = 0.1; %thickness of film as multiples of c
d_film = 2.27; %dielectric constant of film material

% Some d values(Source: Wiki)
% rubber = 7;
% mica  = 4.5
% Teflon (PTFE) = 2.1
% Polyimide = 3.4
% Polystyrene = 2.5
% Neoprene = 6.7
% Pyrex (glass) = 4.7
% Polypropylene = 2.27
%Series summation

count_p = sum(F);
inv_eq = ((2*t_film./d_film)+(count_p)./k_p) + ((size(F,1)-count_p)./k_w);
c_eq = epsilon*t./inv_eq;
    
% Parallel Computation

C = sum(c_eq);

    
    
    
    


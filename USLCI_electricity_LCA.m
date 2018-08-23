%% Examplary life cycle CO2 assessment of electricity generation in the US
% Paul Wolfram
% August 23, 2018
% Adapted from H. Scott Matthews and Vikas Khanna, http://www.lcatextbook.com/

clc
clear 
load('USLCI_clean.mat')

% The following variables are part of the structure LCI:
% LCI.A     Unit process matrix
% LCI.S     Unit elementary flows


%% Find the electricity process and the CO2 emissions vector
a = strmatch('Electricity, bituminous coal', meta.ALabs(:,2))
                                                    % Find process beginning with 'Electricity, bituminous coal'
b = strmatch('Carbon dioxide, fossil', meta.SLabs(:,2))
                                                    % Find elementary flows beginning with 'Carbon dioxide, fossil'

                                                    
%% Create a final demand vector
y = zeros((size(LCI.A,1)),1);                       % Create a column vector of reference flows (all zeros for now)
y(a,1) = 3.6;                                       % Reference flow is 1 kWh (3.6 MJ) of bituminous coal electricity


%% Life cycle CO2 analysis
clc
L = inv(eye(size(LCI.A)) - LCI.A);                  % Leontief inverse
S_CO2 = LCI.S(b,:);                                 % Row vectors for the fossil CO2 flow  
LCIA_el_coal = sum(S_CO2) * L * y;                  % Note the equivalence to how you calculate a CF

process_name = meta.ALabs(a,2);
fprintf('"%s" causes life-cycle CO2 impacts of %.3f kg CO2e/kWh.\n', process_name{1}, LCIA_el_coal);
                                                    % Print answer


%% Comapre to California's electricity mix
a = strmatch('Electricity, at eGrid, CAMX', meta.ALabs(:,2));
                                                    % Find reference flow beginning with 'Electricity, bituminous'
y = zeros((size(LCI.A,1)),1);                       % Create a column vector of reference flows (all zeros for now)
y(a,1) = 3.6;                                       % Reference flow is 1 kWh (3.6 MJ) of electricity in California
LCIA_el_CA = sum(S_CO2) * L * y;                    

process_name = meta.ALabs(a,2);
fprintf('"%s" causes life-cycle CO2 impacts of %.3f kg CO2e/kWh.\n', process_name{1}, LCIA_el_CA);
                                                    % Print answer

%% Compare to Eastern grid
a = 396;
                                                    % Find reference flow beginning with 'Electricity, bituminous'
y = zeros((size(LCI.A,1)),1);                       % Create a column vector of reference flows (all zeros for now)
y(a,1) = 3.6;                                       % Reference flow is 1 kWh (3.6 MJ) of electricity in California
LCIA_el_CA = sum(S_CO2) * L * y;                    

process_name = meta.ALabs(a,2);
fprintf('"%s" causes life-cycle CO2 impacts of %.3f kg CO2e/kWh.\n', process_name{1}, LCIA_el_CA);
                                                    % Print answer

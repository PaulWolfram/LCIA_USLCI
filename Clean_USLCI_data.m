%% Cleaning USLCI data
clc
clear 
load('USLCI.mat')

LCI = struct()
LCI.A = norm_Atech_raw                             % Unit process matrix
LCI.S = env_factors_norm                           % Elementary flows

meta = struct()
meta.ALabs = US_LCI_Processes                       % Unit process labels
meta.SLabs = US_LCI_EnvFactor                       % Elementary flows labels
meta.SHeads = US_LCI_Processes_EnvFactors_Header    % Elementary flows label headers

clear ans co2fossil co2out co2outcols env_factors env_factors_norm funct_units funct_units_env funct_units_mat Leco norm_Atech_raw out US_LCI_EnvFactor US_LCI_Processes US_LCI_Processes_EnvFactors_Header USLCI_Atech_raw y

save('USLCI_clean.mat')
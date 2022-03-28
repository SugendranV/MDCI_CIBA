open_system 'BCM_C1A_CombiSwitch_9';

opts = sldvoptions;
opts.Mode = 'TestGeneration';
opts.ModelCoverageObjectives = 'MCDC';
opts.SaveHarnessModel = 'on';
opts.SaveReport = 'on';
opts.MaxProcessTime = 300;

[ status, files ] = sldvrun('BCM_C1A_CombiSwitch_9', opts, true);
close_system('BCM_C1A_CombiSwitch_9',0);

load_system 'BCM_C1A_CombiSwitch_9';
load_system 'BCM_C1A_CombiSwitch_9/CombiSwitch';

open_system 'BCM_C1A_CombiSwitch_9';
[ outData, initialCov ] = sldvruntest('BCM_C1A_CombiSwitch_9', files.DataFile, [], true);
cvhtml('Initial coverage',initialCov);
close_system('BCM_C1A_CombiSwitch_9',0);

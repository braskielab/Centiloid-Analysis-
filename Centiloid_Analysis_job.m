%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 4252 $)
%-----------------------------------------------------------------------
%addpath('/ifshome/ematsiye/spm8')

subjects = [8484 9439 9973 9998 8159 8229 8230 8030 8031 8239 8280 7929 8209 8433]; % Replace with a list of all of the subjects you wish to analyze

user = getenv('USER');

for subject=subjects
   fprintf('\nWorking on');
   fprintf(' %d',subject);

subject = num2str(subject, '%04d');

spm_jobman('initcfg')

matlabbatch{1}.cfg_basicio.cfg_named_file.name = 'MRI';
matlabbatch{1}.cfg_basicio.cfg_named_file.files = {{['/Volumes/faculty/mbraskie/HABLE/PET/amyloidpet/code/Centiloid_Analysis/' subject '/' subject '_N4.nii']}};
matlabbatch{2}.spm.spatial.coreg.estimate.ref = {['/Users/' user '/Documents/MATLAB/spm8-maint/canonical/avg152T1.nii,1']};
%matlabbatch{2}.spm.spatial.coreg.estimate.ref = {['/ifshome/ematsiye/spm8/canonical/avg152T1.nii,1']};
matlabbatch{2}.spm.spatial.coreg.estimate.source(1) = cfg_dep;
matlabbatch{2}.spm.spatial.coreg.estimate.source(1).tname = 'Source Image';
matlabbatch{2}.spm.spatial.coreg.estimate.source(1).tgt_spec{1}(1).name = 'class';
matlabbatch{2}.spm.spatial.coreg.estimate.source(1).tgt_spec{1}(1).value = 'cfg_files';
matlabbatch{2}.spm.spatial.coreg.estimate.source(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{2}.spm.spatial.coreg.estimate.source(1).tgt_spec{1}(2).value = 'e';
matlabbatch{2}.spm.spatial.coreg.estimate.source(1).sname = 'Named File Selector: MRI(1) - Files';
matlabbatch{2}.spm.spatial.coreg.estimate.source(1).src_exbranch = substruct('.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{2}.spm.spatial.coreg.estimate.source(1).src_output = substruct('.','files', '{}',{1});
matlabbatch{2}.spm.spatial.coreg.estimate.other = {''};
matlabbatch{2}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
matlabbatch{2}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
matlabbatch{2}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{2}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
matlabbatch{3}.cfg_basicio.cfg_named_file.name = 'PET';
matlabbatch{3}.cfg_basicio.cfg_named_file.files = {{['/Volumes/faculty/mbraskie/HABLE/PET/amyloidpet/code/Centiloid_Analysis/' subject '/' subject '_PET_BL.nii']}};
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1) = cfg_dep;
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).tname = 'Reference Image';
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).tgt_spec{1}(1).value = 'image';
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).tgt_spec{1}(2).value = 'e';
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).sname = 'Coregister: Estimate: Coregistered Images';
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{4}.spm.spatial.coreg.estimate.ref(1).src_output = substruct('.','cfiles');
matlabbatch{4}.spm.spatial.coreg.estimate.source(1) = cfg_dep;
matlabbatch{4}.spm.spatial.coreg.estimate.source(1).tname = 'Source Image';
matlabbatch{4}.spm.spatial.coreg.estimate.source(1).tgt_spec{1}(1).name = 'class';
matlabbatch{4}.spm.spatial.coreg.estimate.source(1).tgt_spec{1}(1).value = 'cfg_files';
matlabbatch{4}.spm.spatial.coreg.estimate.source(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{4}.spm.spatial.coreg.estimate.source(1).tgt_spec{1}(2).value = 'e';
matlabbatch{4}.spm.spatial.coreg.estimate.source(1).sname = 'Named File Selector: PET(1) - Files';
matlabbatch{4}.spm.spatial.coreg.estimate.source(1).src_exbranch = substruct('.','val', '{}',{3}, '.','val', '{}',{1});
matlabbatch{4}.spm.spatial.coreg.estimate.source(1).src_output = substruct('.','files', '{}',{1});
matlabbatch{4}.spm.spatial.coreg.estimate.other = {''};
matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
matlabbatch{5}.spm.spatial.preproc.data(1) = cfg_dep;
matlabbatch{5}.spm.spatial.preproc.data(1).tname = 'Data';
matlabbatch{5}.spm.spatial.preproc.data(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{5}.spm.spatial.preproc.data(1).tgt_spec{1}(1).value = 'image';
matlabbatch{5}.spm.spatial.preproc.data(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{5}.spm.spatial.preproc.data(1).tgt_spec{1}(2).value = 'e';
matlabbatch{5}.spm.spatial.preproc.data(1).sname = 'Coregister: Estimate: Coregistered Images';
matlabbatch{5}.spm.spatial.preproc.data(1).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{5}.spm.spatial.preproc.data(1).src_output = substruct('.','cfiles');
matlabbatch{5}.spm.spatial.preproc.output.GM = [0 0 0];
matlabbatch{5}.spm.spatial.preproc.output.WM = [0 0 0];
matlabbatch{5}.spm.spatial.preproc.output.CSF = [0 0 0];
matlabbatch{5}.spm.spatial.preproc.output.biascor = 0;
matlabbatch{5}.spm.spatial.preproc.output.cleanup = 0;
matlabbatch{5}.spm.spatial.preproc.opts.tpm = {
                                               ['/Users/' user '/Documents/MATLAB/spm8-maint/tpm/grey.nii']
                                               ['/Users/' user '/Documents/MATLAB/spm8-maint/tpm/white.nii']
                                               ['/Users/' user '/Documents/MATLAB/spm8-maint/tpm/csf.nii']
                                               };
matlabbatch{5}.spm.spatial.preproc.opts.ngaus = [2
                                                 2
                                                 2
                                                 4];
matlabbatch{5}.spm.spatial.preproc.opts.regtype = 'mni';
matlabbatch{5}.spm.spatial.preproc.opts.warpreg = 1;
matlabbatch{5}.spm.spatial.preproc.opts.warpco = 25;
matlabbatch{5}.spm.spatial.preproc.opts.biasreg = 0.0001;
matlabbatch{5}.spm.spatial.preproc.opts.biasfwhm = 60;
matlabbatch{5}.spm.spatial.preproc.opts.samp = 3;
matlabbatch{5}.spm.spatial.preproc.opts.msk = {''};
matlabbatch{6}.spm.spatial.normalise.write.subj.matname(1) = cfg_dep;
matlabbatch{6}.spm.spatial.normalise.write.subj.matname(1).tname = 'Parameter File';
matlabbatch{6}.spm.spatial.normalise.write.subj.matname(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{6}.spm.spatial.normalise.write.subj.matname(1).tgt_spec{1}(1).value = 'mat';
matlabbatch{6}.spm.spatial.normalise.write.subj.matname(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{6}.spm.spatial.normalise.write.subj.matname(1).tgt_spec{1}(2).value = 'e';
matlabbatch{6}.spm.spatial.normalise.write.subj.matname(1).sname = 'Segment: Norm Params Subj->MNI';
matlabbatch{6}.spm.spatial.normalise.write.subj.matname(1).src_exbranch = substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{6}.spm.spatial.normalise.write.subj.matname(1).src_output = substruct('()',{1}, '.','snfile', '()',{':'});
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep;
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(1).tname = 'Images to Write';
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(1).tgt_spec{1}(1).name = 'filter';
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(1).tgt_spec{1}(1).value = 'image';
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(1).tgt_spec{1}(2).name = 'strtype';
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(1).tgt_spec{1}(2).value = 'e';
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(1).sname = 'Coregister: Estimate: Coregistered Images';
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(1).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(1).src_output = substruct('.','cfiles');
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(2) = cfg_dep;
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(2).tname = 'Images to Write';
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(2).tgt_spec{1}(1).name = 'filter';
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(2).tgt_spec{1}(1).value = 'image';
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(2).tgt_spec{1}(2).name = 'strtype';
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(2).tgt_spec{1}(2).value = 'e';
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(2).sname = 'Coregister: Estimate: Coregistered Images';
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(2).src_exbranch = substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{6}.spm.spatial.normalise.write.subj.resample(2).src_output = substruct('.','cfiles');
matlabbatch{6}.spm.spatial.normalise.write.roptions.preserve = 0;
matlabbatch{6}.spm.spatial.normalise.write.roptions.bb = [NaN NaN NaN
                                                          NaN NaN NaN];
matlabbatch{6}.spm.spatial.normalise.write.roptions.vox = [2 2 2];
matlabbatch{6}.spm.spatial.normalise.write.roptions.interp = 1;
matlabbatch{6}.spm.spatial.normalise.write.roptions.wrap = [0 0 0];
matlabbatch{6}.spm.spatial.normalise.write.roptions.prefix = 'Normalized_';

spm_jobman('run', matlabbatch);
end

## Analysis of SARS-CoV-2 RBD antibodies encoded by IGHV2-5/IGLV2-14: ddG calculation

### Dependencies
* [pdb-tools](http://www.bonvinlab.org/pdb-tools/)
* [PyMOL](https://pymol.org/2/)
* [Rosetta](https://www.rosettacommons.org/software/license-and-download)

### Dependencies installation
* For pdb-tools: ``pip install pdb-tools``
* For PyMOL: follow instructions on [PyMOL](https://pymol.org/2/) website. A license is required.
* For Rosetta: follow instructions on [Rosetta](https://www.rosettacommons.org/software/license-and-download) website. An academic or commercial license is required.

### Steps to calculate ddG

#### Renumber pdb file

1. Download PDB file of LY-CoV1404 bound to SARS-CoV-2 S RBD (PDB ID: [7MMO](https://www.rcsb.org/structure/7MMO)).

2. Remove PCA, NAG, solvent, chain B, chain D, chain E, and chain F using PyMOL.

3. Save the molecule as a PDB file and write CONECT bonds.

4. Renumber the amino acid residues using pdb_reres.py in pdb-tools: ``python3 pdb_reres.py LY-CoV1404.pdb > LY-CoV1404_renum.pdb``.

#### Perform fast relax

1. Make a folder for relax: ``mkdir relax``. Move LY-CoV1404_renum.pdb into this folder.

2. Make a constraint file:
``nohup ~/rosetta/main/source/bin/minimize_with_cst.static.linuxgccrelease -s LY-CoV1404_renum.pdb -in:file:fullatom -ignore_unrecognized_res -fa_max_dis 9.0 -database ~/rosetta/main/database/ -ddg::harmonic_ca_tether 0.5 -score:weights ~/rosetta/main/database/scoring/weights/pre_talaris_2013_standard.wts -restore_pre_talaris_2013_behavior -ddg::constraint_weight 1.0 -ddg::out_pdb_prefix min_cst_0.5 -ddg::sc_min_only false -score:patch ~/rosetta/main/database/scoring/weights/score12.wts_patch > mincst.log 2>&1 </dev/null &``

3. Convert the constraint file to a cst file:
``bash ~/rosetta/main/source/src/apps/public/ddg/convert_to_cst_file.sh ./mincst.log > ./Constraint.cst``

4. Relax the structure:
``nohup ~/rosetta/main/source/bin/relax.static.linuxgccrelease -database ~/rosetta/main/database/ -in:file:s LY-CoV1404_renum.pdb -in:file:fullatom -relax:fast -constraints:cst_file Constraint.cst -relax:ramp_constraints false -nstruct 30 2>&1 </dev/null &``

5. Note the lowest scoring pose based on score.sc, which is LY-CoV1404_renum_0009.pdb in our run.

#### Perform ddG calculation
1. Make a folder for ddG calculation: ``mkdir ddG_calc``. Move the file corresponding to the lowest scoring pose from relax to ddG_calc. Rename the file
``mv LY-CoV1404_renum_0009.pdb LY-CoV1404_relaxed.pdb``

2. Ensure that the residue file to mutate (D54N.resfile) and the script for ddG calculation (mutation_script.xml) are in the ddG_calc folder.

3. Calculate ddG:
``nohup ~/rosetta/main/source/bin/rosetta_scripts.static.linuxgccrelease -parser:protocol mutation_script.xml -s LY-CoV1404_relaxed.pdb -ignore_unrecognized_res -nstruct 100 2>&1 </dev/null &``

4. Note the lowest scoring pose based on score.sc, which is LY-CoV1404_relaxed_0073.pdb in our run. Write down the corresponding dG_mut and dG_WT values. ddG is calculated by subtracting dG_WT from dG_mut, i.e. ddG = dG_mut - dG_WT.

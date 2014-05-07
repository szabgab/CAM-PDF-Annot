use 5.010000;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'CAM::PDF::Annot',
    VERSION_FROM      => 'lib/CAM/PDF/Annot.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/CAM/PDF/Annot.pm', # retrieve abstract from module
       AUTHOR         => 'DONATOAZ <donatoaz@gmail.com>') : ()),
	clean => {FILES => 't/merged_pdf.pdf t/merged_multi_pdf.pdf'},
);

# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl CAM-PDF-Annot.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 9;
BEGIN { use_ok('CAM::PDF::Annot') };

# testing for a single page doc

ok($pdf1 = CAM::PDF::Annot->new( 't\pdf1.pdf' ), 'Open PDF 1 test');
ok($pdf2 = CAM::PDF::Annot->new( 't\pdf2.pdf' ), 'Open PDF 2 test');
ok( &testAppend, 'Appending annot test'	);
eval { $pdf2->cleanoutput( 't\merged_pdf.pdf' ) };
ok($pdf3 = CAM::PDF::Annot->new( 't\merged_pdf.pdf' ), 'Opening merged file test');

# testing for multipage now

ok($pdf1 = CAM::PDF::Annot->new( 't\pdf1multi.pdf' ), 'Open PDF 1 MULTIPAGE test');
ok($pdf2 = CAM::PDF::Annot->new( 't\pdf2multi.pdf' ), 'Open PDF 2 MULTIPAGE test');
ok( &testAppend, 'Appending MULTIPAGE annot test'	);
eval { $pdf2->cleanoutput( 't\merged_multi_pdf.pdf' ) };
ok($pdf3 = CAM::PDF::Annot->new( 't\merged_multi_pdf.pdf' ), 'Opening merged MULTIPAGE file test');

undef $pdf1;
undef $pdf2;
undef $pdf3;

sub testAppend {
	eval {
		for my $page ( 1 .. $pdf1->numPages() ) {
			my %refs;
			for my $annotRef ( @{$pdf1->getAnnotations( $page )} ) {
				$pdf2->appendAnnotation( $page, $pdf1, $annotRef, \%refs );
			}
		}
	};
	return 0 if ( $@ );
	1;
}

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.


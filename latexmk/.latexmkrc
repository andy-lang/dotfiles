# always in continuous make mode
$preview_continuous_mode = 1;
# always compile to a PDF
$pdf_mode = 1;

# run with Zathura if it's installed. Otherwise use whatever the system default is
if ( system("which", "zathura") == 0 ) {
	$pdf_previewer = "start zathura %S";
}

# latexmk configuration to build HPMOR -*- mode: perl -*-

@default_files = (
  'hpmor',
  'hpmor-1', 'hpmor-2', 'hpmor-3', 'hpmor-4', 'hpmor-5', 'hpmor-6',
  'hpmor-dust-jacket-1', 'hpmor-dust-jacket-2', 'hpmor-dust-jacket-3',
  'hpmor-dust-jacket-4', 'hpmor-dust-jacket-5', 'hpmor-dust-jacket-6',
 );

# Install git hooks for gitinfo2 if not already installed
my $hooks_dir = '.git/hooks';
if (-d $hooks_dir) {
  my $checkout = "$hooks_dir/post-checkout";
  if (!-e $checkout) {
    use File::Copy;
    copy('post-checkout', $checkout) or die "Could not copy `$checkout' to `$hooks_dir'\n";
    system 'chmod', '+x', $checkout;
    symlink 'post-checkout', "$hooks_dir/post-commit" or die 'Could not create symlink';
    symlink 'post-checkout', "$hooks_dir/post-merge" or die 'Could not create symlink';
  }
}

# Use XeLaTeX (equivalent to command-line -xelatex option)
$pdflatex = 'xelatex %O %S';
$pdflatex = "xelatex %O \"\\PassOptionsToPackage{$options}{hp-book}\\input{%S}\"" if $options;
my $basedir = ".";
if (defined($chapter) || defined($chapterfile)) {
  if (defined($chapter)) {
    die "Not in chapters/ directory" if !-d "../$hooks_dir";
    $basedir = "..";
    $ENV{TEXINPUTS} = ".:$basedir:";
    $chapterfile = 'hpmor-chapter-' . sprintf('%03d', $chapter);
  } else {
    $chapter = 1;
  }
  $pdflatex = "xelatex -jobname=$chapterfile %O \"\\RequirePackage[pdf]{hp-book}\\begin{document}\\setcounter{chapter}{" . ($chapter - 1) . "}\\input{$chapterfile}\\end{document}\"" if $chapter;
}
$pdf_mode = 1;
$postscript_mode = $dvi_mode = 0;

# Make our fonts available to TeX
$ENV{TEXFONTS} = "$basedir/fonts//:";

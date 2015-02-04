#!/usr/bin/perl
while (<>) {
    $text .= $_;
}

$text =~ s%&#8239;%%g;
$text =~ s%<em><br></em>%<br>%gi;
$text =~ s%</em>(\s+)<em>%\1%gi;
$text =~ s%</em><em>([^<]*?)</em><em>%\\underline{\1}%gi;
$text =~ s%<span style='text-decoration:underline;'>(.*?)</span>%\\underline{\1}%gi;
$text =~ s%</em><em>%%gi;
$text =~ s%<br>\s*</p>%</p>%gi;
$text =~ s% </em>%</em> %gi;
$text =~ s%<em>(.*?)</em>%\\emph{\1}%gi;
$text =~ s%</p>\s*<hr.*?>\s*<p>%\n\\sbreak\n%gis;
$text =~ s%</p><p>%\n\n%gi;
$text =~ s%M(r|rs|s)\. %M\1.~%g;
$text =~ s%<br>%\\\\\n%gi;
$text =~ s%</p><p (.*?)>%\n\n*** FIXME: \1 ***\n%gi;
$text =~ s% - %---%g;
$text =~ s% -([^-])%---\1%g;
$text =~ s%([^-])- %\1---%g;
$text =~ s%\.\.\.%{\\ldots}%gi;
$text =~ s%<div id="chapter-title">%%;
$text =~ s%</p></div>%%;

print $text;

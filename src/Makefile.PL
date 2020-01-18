
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "utilities to write and check a MANIFEST file",
  "AUTHOR" => "Andreas Koenig <andreas.koenig\@anima.de>, Michael G Schwern <schwern\@pobox.com>, Randy Kobes <r.kobes\@uwinnipeg.ca>, The Perl 5 Porters",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "ExtUtils-Manifest",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "ExtUtils::Manifest",
  "PREREQ_PM" => {
    "File::Basename" => 0,
    "File::Spec" => "0.8"
  },
  "VERSION" => "1.61",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

$WriteMakefileArgs{INSTALLDIRS} = 'perl'
    if $] >= 5.009005 && $] <= 5.011000;

WriteMakefile(%WriteMakefileArgs);




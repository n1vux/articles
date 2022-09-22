#! perl  
# -C sets utf8 , must be at runtime

use v5.36;
use experimental 'for_list' , 'try' ;# , 'defer', 'isa';

use XML::Twig;
use DateTime::Format::HTTP;
use Data::Dump qw/pp/;


my $twig=XML::Twig->new();    # create the twig
## $twig->parsefile( 'doc.xml'); # build it
## my_process( $twig);           # use twig methods to process it 
## $twig->print;                 # output the twig
$twig->parsefile( 'bpark-pod-rss.xml'); # build it

my $root=$twig->root;
my $rss=$root->first_child( 'rss' );
my $channel=$rss->first_child( 'channel' );
die unless $channel;
my @Episode_elts = $channel->children( 'item' );
die unless @Episode_elts;

# ID Prefix to use
#              P    RE to match and extract number 
my %Prefix = ( X => qr/^Extra - E(?<nn>\d+)/,
               E => qr/^E(?<nn>\d+)/,
               T => qr/^Teaser (?<nn>\d+)/,
               I => qr/Intelligence Insight No. (?<nn>\d+)/,
               S => undef,
           );
my $specials_id=0;
 
sub dt($string){ 
    my $time = DateTime::Format::HTTP->parse_datetime($string); # convert ASCII date to machine time
    return $time;
}

sub dt_key($eps){
    try {
        return dt($eps->first_child('pubDate')->text());
    }
    catch($exc){
        warn "caught $exc";
        return 0;
    }
};

# Keepers
my %Keywords;  # H{key} of A of eps keys
my %Episodes;  # H{Enn} of H {key|title|hashes|url|dt}

foreach my $ep (sort {dt_key($a) cmp dt_key($b)} @Episode_elts)
  { 
      my $title_elt = $ep->first_child( 'title');
      # say $title_elt->text;
      my $title= $title_elt->text;
      my $Eps;
      for my ($prefix, $re) (%Prefix){
          next unless defined $re;
          if ($title =~ $re){
                $Eps= sprintf "%s%03d", $prefix, $+{nn};
                last;
          }
      } # end Prefixes
      # if no match, it's an un-numbered SPecial
      $Eps= sprintf "%s%03d", 'SP', ++$specials_id
            unless defined $Eps; 
      # say "$Eps : title : $title ";
      # say "$Eps : url : ", $ep->first_child('link')->text;
      my $link =  $ep->first_child('link')->text;
        # my $date_string=$ep->first_child('pubDate')->text;
        # my $date = dt($date_string);
        # say "$Eps: $title $date_string ($date)";
      my $description = $ep->first_child('description')->text();
      my $nn=0;
      my @Hashtags;
      while ($description =~ m{ ( [#] \w+ ) }xg){
          my $hashtag = $1;
          next if $hashtag =~ m{ ^[#] (?: BPark | Blec?tchleyPark | bparkpodcast|tnmoc) }ix and $Eps !~ /^[ST]P?00[1-3]/ ;
          $nn++;
          # say "$Eps : keyword : $hashtag" 
          push @Hashtags, $hashtag;
      }
      if (! $nn) {
          warn "No hashtags for $Eps"; #  unless $nn;
          push @Hashtags, '##NoTags##';
      }

    push $Keywords{$_}->@*, $Eps 
            for @Hashtags; 
    $Episodes{$Eps} = {key=>$Eps, title=>$title, hashes=>\@Hashtags, url=>$link, date=>dt_key($ep)->iso8601, };
 
 
  }          # end Episodes

  # say pp \%Keywords;
  # say pp \@Episodes;
  #
  # Emit MarkDown
say <<__EOF__;
% A keyword index for Bletchly Park Podcasts
% Bill Ricker
% September, 2022

# Explanation

A [Discussion on Twitter with the Pod Producer M.C.Fontaine](https://twitter.com/VirtualColossus/status/1572294343091683328) 
and another fan (`\@VirtualColossus`) raised the issue that the Pod could use 
a Keyword index. So I've prototyped one.

See [How](./how.html) for discussion of how this was
made, known limitations, possible extensions. 
And [Source Code](https://github.com/n1vux/articles/Cryptology/BletchleyParkPod/)
for way too much info.

# Hashtags in Episode Descriptions

__EOF__

for my ($k) (sort keys %Keywords){
    my @Eps = $Keywords{$k}->@*;
    say sprintf "## %s", $k;
    say sprintf "* [%s\t%s\t`%s`](%s)",$_->{key}, $_->{title}, $_->{date}, $_->{url}  for map {$Episodes{$_}} sort @Eps;
    say "";

}

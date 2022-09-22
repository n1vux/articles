% Making Keyword Index to Bletchley Park Podcast
% Bill Ricker
% September, 2022

## Why


A [Discussion on Twitter with the Pod Producer M.C.Fontaine](https://twitter.com/VirtualColossus/status/1572294343091683328) 
and another fan (`\@VirtualColossus`) raised the issue that the Pod could use 
a Keyword index. So I've [prototyped one](./BPP-Keywords.html).


## Fetch the data and pretty-print it

`wget https://audioboom.com/channels/451365.rss`

`xml_grep --root rss --pretty_print indented 451365.rss  > bpark-pod-rss.xml`

## Analyze elements used

Structure is 

```
rss/channel/
   title,description,link, atom:, itunes:, audioboom:, pubDate,language, image/..., copyright
   
rss/channel/item/
    title,description,enclosure,guid,link,pubDate
    media:content,rights
    itunes:image,duration,explicit,episodeType
    dc:creator
    
```

The Audioboom episode page XPath spec is `item/link`; MP3 file is directly linked by both `enclosure` and `media/content[url]` (same content).

Mix of RSS XML and embedded HTML in description etc; observed `<tags>` are:

```
ack '<(\w+)[ >]' --output '$1' bpark-pod-rss.xml | sort | uniq -c > element-counts.lst
      4 a
    279 br
      1 channel
      1 copyright
    244 description
    997 div
     22 em
    243 enclosure
    243 guid
      1 image
    243 item
      1 language
      2 li
    245 link
   1094 p
    244 pubDate
      1 rss
      1 strong
    245 title
      2 ul
      1 url
      1 xml_grep

```

Additional diagnostic:

`xml_grep --root item/title --text_only bpark-pod-rss.xml | sort -o titles.lst`

Aside from titles starting E99, there are `Extra - E99` and `Intelligence Insight No. 013` `Teaser 3` series and a number of specials that will need short ids created (which non-series we'll call "Specials" or `SP999` for now).

## Descriptions

The `<description>` element contains embedded `CDATA` HTML, that uses `<div> <br> &entity; <p> `
and even `<em> <strong> <ul><li> <a>` of which only `<a>` will have attributes.

Most descriptions include `#hashtags` for keywords, including in all but the earliest teasers and one non-numbered episode (which i call Specials).

A first cut could just connect `<title>` to each hashtag `#keyword` in `<description>`.



## Solution 1: Hashtags as only keywords 

`keywords.pl`

Reads the saved RSS XML, emits Markdown for Keywords: Episodes, with links to AudioBoom episode page.

```
$ perl -C keywords.pl > BPP-Keywords.md  # reads bpark-pod-rss.xml 
No hashtags for SP001 at keywords.pl line 87.
No hashtags for SP002 at keywords.pl line 87.
No hashtags for E105 at keywords.pl line 87.

$  bash -x ./make BPP-Keywords.html
+ fn=BPP-Keywords.html
+ shift
+ echo BPP-Keywords
BPP-Keywords
+ pandoc -o BPP-Keywords.html --css pandoc.css -s --toc --toc-depth=2 -f markdown BPP-Keywords.md
```

Since most episodes have keywords in addition to `#BletchleyPark` and the like, those universal tags are only saved if applied to a Teaser or non-series Special.

## Deferred

* Detect duplicate listings in RSS/XML (e.g. EX006 Extra - E06) and suppress one of them.
* Extract additional proper-noun keywords from Title and Description (e.g. `BBC`  `Alan Turing` `Dermot Turing` `Mavis Baty` and detecting Enigma, Lorenze, Hagelin, Dollis-Hill when not hash-tagged). But de-duplicate these against hashtags e.g. `#AlanTuring`.
* Generate a neater table of contents by adjusting CSS or something.
* Consider a Tag Cloud whereby font-size denotes number of episodes for a keyword.
* Combine tags with the same spelling?

## References

* [wget](https://linux.die.net/man/1/wget) Command-line HTTP client to fetch file(s) etc
* [ack](https://beyondgrep.com) a text-search tool specifically for code; not unlike `grep --perl-regexp`
* [xml_grep](https://metacpan.org/dist/XML-Twig/view/tools/xml_grep/xml_grep) find parts of an XML file using XPath specifications, which is included with
* [XML::Twig](https://metacpan.org/pod/XML::Twig) a Perl module for accessing an XML DOM (Document Object Model) via XPath specs.
* [Pandoc](https://pandoc.org/) a tool to convert document formats, using an extended/universal MarkDown as common format
% Mastodon, or The Birdapp Migration 


## Why

I think we know why.

As the bluebird app turns emerald green

## Where to? The Fediverse ! 

Choice is good? 

Alas having had ONE place for academics, activists, and journalist to find eachother was useful.

![The many branches of the Fediverse](./Fediverse.png){ height=50% width=50% }
[CC BY-NC Per Axborm](https://social.xbm.se/@axbom/109275520716021795)

### What is the Fediverse ? 

The Fedirated Universe (Fediverse) is every server that publishes and subscribes via W3C recommended **ActivityPub** decentralized social networking protocol, playing nicely with others.

<https://fediverse.party/> lists 10 major federated (non-centralized) social apps, with info pages for each

Except as noted the following Fediverse projects are microblogging and were started 2014-2018.

* diaspora (**Macro**blogging; supports Markdown; 2010)
* Friendica (**Macro**blogging; 2010)
* GNU Social (2010; first microblogging)
* Hubzilla (**Macro**blogging; channelized?)
* **Mastodon**
* Misskey
* PeerTube (**Video**)
* Pleroma (lightweight microblogging, so Twitterish but less?)
* Pixelfed (**Image**)
* Funkwhale (**Audio**)

which omits forks, old-school precursors, private gardens, & minor players that appear on charts and lists.

### Connections in the Fediverse 

![connections](./socials.dot-fdp.png){ height=50% width=50% }

Key

* <span style="color:lightgreen">Microblogging</span>
* <span style="color:cyan">Macroblogging</span>
* <span style="color:red">Media Streaming/Sharing</span>

### Other "choices" ?

Mostly just like Twitter, Non-Federated & Centralized, but with additional problems; but a few are Non-Federated &/or Centralized in some sense.

* **Private-Label Social**  
  There is (are?) [firm(s)](https://www.disciplemedia.com/) selling turn-key Social Media phone+web apps that will provide a walled-garden community for the sponsor's palls. At remarkably low rates since the app is merely branded for each client.  
  Likely invitation-only or sponsor's mailing list / website only.
  _That reminds me i need to check the Beta ..._


* **Alt-Right choices** (without fact-checking)  
  (which private gardens might be purchased from above vendor(s)?)


    * "Truth" Social
    * Parler
    * Rumble ? _never heard of it but it's listed_
    * Newsmax _news app's comment section, or do they have a full social walled garden?_  

* **Old School**

    * antique bboards/forums - Web 1.0 ports of Dialup Bulletin Boards (usually obsolete PHP code) e.g. `/.`, `reddit`, `4chan` etc, various Forums packages
    * IRC still exists ! ( _even tho newer AIM, G-chat gateway, etc have shut down_ )  
      IRC is **decentralized** - lots of servers - but theyre **not** Federated; so while FLOSS and standards-coforming for no lock-in, moving hosts is painful, as we found out when an old reliable FLOSS-friendly host got sold.
    * Slack (commercial multimedia chat for corps; some FLOSS project use it instead of dogfooding FLOSS because they have Slack at day-job, it just works (same as the MacBook Air), _etc_ )
    * USEnet mostly doesn't exist anymore (_and the history is hard to find_) but a few of the old news groups live yet! Somewhat Federated & decentralized, but with Google Groups defacto Center, less so than in the good old days.
    * Mailing lists ( _like our NatickFoss discussion list_ ) - since there are list-servers other than Google, **decentralized**, and if you forward to another list, somewhat **federated** ! But very old school in handling of media attachments.
    * Blogs with RSS and automatic track-back links. **Federated & decentralized**.
    * WebRings - **Federated & decentralized**!

* **Counter.Social (CoSo)**  
  Overtly political Twitter-alternative, run by an anonymous, career Grey-hat hacktivist.  
  _Anitifa? Anarcho-Socialist? Unclear, but not GQP. Radically anti-troll._

    * "No trolls. No abuse. No Ads. No fake news. No foreign ifluence ops." 
    * "Deepfake Detector. Botsentinel. Identity Breach Alerts. Factlayer."
    * Private groups are supposedly E2E encrypted, which is tricky.
    * Originally a clone/fork of Mastodon; an (A)GPL compliant fork, but not federated because history.
    * Blocks countries considered by hacker-in-chief to be opposed to democratic West.
    * Supports VR Goggles as well as Browser and Mobiles! ( _So is Meta before Meta™ is Meta_ ?)
    * ( _Does it try to detect VPN from blocked countries?_ )
    * _The promises and claims sound good technologically, one can debate the absolutist blocking of countries that run professional trolls as wise or over-reactive; but IDK who is running it, any other decentralization is indistiguishable from single Corp Edge, just can't see what if any Corp, so interesting but wait and see for me. Also, not being decentralized/federated, is hit harder in Migration._ [TheJester's view of history](https://countersocial.documize.com/s/c30dhakp0nhtab60utag/countersocial-blog); [history&interview by a CoSo users](https://directorblue.blogspot.com/2018/10/the-anti-social-networkwhat-is.html).


## Mastodon Microblogging : TOOT to the Fediverse

<https://fediverse.party/en/mastodon/>

**Mastodon** is the current center of the Federated Multi-Verse (Fediverse) per above graph from Fediverse Party data.

### Not exactly what you're expecting?

Instead of Tweeting, we **Toot**; instead of `#Twitterstorians`, there are `#Histodonts`; there is no Verified ✓ . Unless you buy a server, there's usually no charge, just a **tip jar**.

Instead of an edge-cloud with eventual-consistency distributed DB run by one mega corp, Fediverse is scaled by having many collaborating instances under separate management that collaborite, each scaling according to own daily output & input, and funds available.

Each instance server can _but is not required to_ exchange content with (most) others, Mastodon or fork or other compatible project (see chart).

Each instance sets it's **own content policy, moderation policy, privacy policy**, open enrollment or invite only, etc., and picks which nodes it trusts to federate with.  

(E.g. [mastodon.radio](https://mastodon.radio) does NOT accept federation with nodes that have too loose a policy registered or fail to enforce their policy, e.g.,  [masthead.social](https://masthead.social), which is nominally for journalists, policy says **NoSpam**, but is actually just unmoderated spam.)


* Tutorial Video <https://youtu.be/mrsiej2dpBY>
* [brief Mastodon guide for social media worriers](https://axbom.com/mastodon-guide/)


### Picking a "Mastodon server" (host node)

* [The Importance of Choosing the Correct Mastodon Instance](https://carlchenet.com/the-importance-of-choosing-the-correct-mastodon-instance/)
* [Choosing a Mastodon instance and why i joined Social.coop](https://agaric.gitlab.io/raw-notes/notes/2020-07-26-choosing-a-mastodon-instance-and-why-i-joined-social-coop/)
* [Mastodon choice wizard](https://instances.social/), can check out registered nodes (by appending instance name e.g. <https://instances.social/fosstodon.org>)
* <https://joinmastodon.org/servers>
* (One could reasonably pick a server of one of the non-Mastodon but compatible kinds. I can't give hints on that.)

Many are named `Mastodon.${TLD}` but not all; can be whatever someone wants. 
(If not masto- or -don something, it may be a clone or an API compatible as opposed to a Mastodon instance _per se_ , or they had a better pun.)

* [Mastodon.social](https://Mastodon.social) the original and default node; bilingual German and English; _getting hammered by new refugees._
* [Mastodon.xyz](https://Mastodon.xyz)(invite only temp.) [mstdn.social](https://mstdn.social) [mastodon.online](https://mastodon.online) alt generics
* [fosstodon.org](https://fosstodon.org)(waitlist), [social.linux.pizza](https://social.linux.pizza)(waitlisted) - FOSS/FLOSS
* [social.coop](https://social.coop) strong code of conduct, activism centered, see article link above. 
* [Mastodon.Art](https://Mastodon.Art) [Mastodon.Radio](https://Mastodon.Radio) [scicomm.xyz](https://scicomm.xyz) [glammr.us](https://glammr.us) (museums galleries archives) [tenforward.social](https://tenforward.social) [tabletop.social](https://tabletop.social) ... special interest communities
* have your own!! Turnkey hosting at usual suspects' DigitalOcean, Exoscale, _etc_ standard rates; or recommended specialist managed hosting with <https://masto.host/> (from $6/mon, throughput limited not fixed # of accounts) and <https://federation.spacebear.ee> (as recommended by FediTips).
* You can have accounts on more than one to compartmentalize your social life (similar to having Alt accounts on TW, FB, but with natural-branding by hosts' themes)

Alas the published indices don't currently show any US-based regional servers.

And a lot of natural birds of a feather communities aren't yet represented, but likely will pop up during the migration period.  _I don't feel like putting up the cash to start one, but we could chip in to have our own server!_


### Notes

* Mastodon DMs are not encrypted, and instead of being readable only by any Twitter DevOps who cares to gain privilege (or comply with a government order/request), are readable by sender & recipient's node admins, whomever they are.   A DM is just a Post or Reply with Visibility reset from default (likely World **🌎**) to Private (**🖂**), addresee(s) only. Arguably even worse substitute for secure messaging than Twitter DM.
* Follow `@feditips@mstdn.social` for how-to tips
* You can move between instances later, <https://docs.joinmastodon.org/user/moving/>.
you can move followers **and follows** with you, but posts won’t.

### Additional 

#### Content Warnings 

For things that some folks would rather not see or forward, use a Content Warning.
This is more built-in in Mastodon & ActivityPub; it was just a convention in TW&FB.


#### POSEE

**Publish (on your) Own Site, Syndicate Elsewhere** or perhaps Everywhere.

Don't have your created content locked into a host that may vanish or claim ownership.

Use Mastodon and the other social media to spread awareness and have discussions, but keep the actual content yours.

If using free services to host your content, be sure to keep another copy elsewhere for safety !! Backup all the things.

<https://indieweb.org/POSSE>

(_I'm using GitHub Pages for this content. Which you might think is giving _them_ content, but the original copy is on my harddrive and checked into a Git repository that they have a copy of ... and i can replicate to any other webserver or repository i want, it won't go away if M$ closes GH. But aslong as GitHub.io exists, RSS or SocialMedia links to here will be good; and if it vanishes, this can reappear elsewhere._)


#### RSS

> FediFollows @FediFollows@mastodon.online

> RSS fans!

> You can get RSS feeds of any specific tag in 
<https://fedi.directory> by adding `/feed/` to the end of the tag's URL.

> For example the tag for "Gardening" is at the URL:
<https://fedi.directory/tag/gardening/>  

> ...so if you wanted to use RSS to track all new gardening accounts, the feed would be:
<https://fedi.directory/tag/gardening/feed/>
> When new accounts are added to tags you follow like this, they will appear in your RSS feed.  
> #RSS #Fediverse #Mastodon


#### Verification 

> Fedi.Tips @feditips@mstdn.social

> There are no "verified" badges on here. If you see someone using a symbol like :verified: it's just a custom emoji that means absolutely nothing.  
> However, there are still ways you can verify your identity on here. For example we know that the European Commission's official account is @EU_Commission  
> Here's an article going through how to verify your account on Mastodon and the Fediverse:  
> <https://fedi.tips/how-to-use-mastodon-and-the-fediverse-advanced-tips/>  
>  #HowDoIVerifyMyAccount
> There's no charge on here for verifying, and anyone can do it.

#### Replies Etiquette

> Per Axbom @axbom@social.xbm.se

> An etiquette tidbit I just learned from @HunterZ

> When you write threads, you can set the visibility of all the reply posts to "Unlisted". This way all the non-initial posts won't flood user timelines in reverse chronological order (and interspersed between others' toots), which can confuse. People will just see the initial post and upon clicking that see the whole thread.

> I will try to remember this. But I will obviously also forget at times.

> #FediTips


### Applications

* Basic Mastodon **web** interface (default on most instance nodes) looks like TweetDeck in Dark mode: it has Columns. You can monitor `#NatickFoss` or `@algot@mastodon.art` in a column.
    * [Pinafore.social](https://Pinafore.social) - alt web interface
    * [Halcyon.social](https://Halcyon.social) - alt web interface
* There are a couple choices in iOS **Apple App** Store and **Android Google Play** Store, which get different reviews from different people. They look more like Twitter Android, but differ how Local vs Federated feeds are navigated to. Both have requested Notifications permission only (if turned on). I presume will request access Pictures (& files?) if i try to post a picture from it?
    * **Tusky** (Android) [@tusky@mastodon.social](https://mastodon.social/tusky)
    * **Mastodon** (official Android client) - has a small index of major thematic nodes in Start page.
    * if you run both on same device, eventually either disable/remove one or turn off notifications on one!!
    * Similar choices for **iOS**, i haven't tested.

## -30-

**Q&A** and more **Demo** 

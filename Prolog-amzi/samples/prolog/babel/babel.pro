%----------------------------------------------------਍─ 䈀䄀䈀䔀䰀⸀倀刀伀 ⴀ 䴀甀氀琀椀氀愀渀最甀愀最攀 琀爀愀渀猀氀愀琀椀漀渀ഀഀ
%਍─ 䄀渀 䄀洀稀椀℀ 椀渀挀⸀ 搀攀洀漀渀猀琀爀愀琀椀漀渀 瀀爀漀最爀愀洀⸀ ⠀眀眀眀⸀愀洀稀椀⸀挀漀洀⤀ഀഀ
% This program can be freely used and modified, although਍─ 愀挀欀渀漀眀氀攀搀最洀攀渀琀 椀猀 愀瀀瀀爀攀挀椀愀琀攀搀⸀ഀഀ
%਍─ഀഀ
% Babel illustrates some basic ideas of machine਍─ 琀爀愀渀猀氀愀琀椀漀渀⸀  䤀琀 琀愀欀攀猀 愀渀 椀渀瀀甀琀 猀攀渀琀攀渀挀攀 椀渀 愀渀礀ഀഀ
% of the supported languages, and then outputs what਍─ 椀琀 戀攀氀椀攀瘀攀猀 琀栀攀 ✀洀攀愀渀椀渀最✀ 漀昀 琀栀攀 猀攀渀琀攀渀挀攀 椀猀⸀  䤀琀ഀഀ
% then uses that meaning to generate translations in਍─ 琀栀攀 漀琀栀攀爀 猀甀瀀瀀漀爀琀攀搀 氀愀渀最甀愀最攀猀⸀  ⠀一漀琀 愀氀氀 氀愀渀最甀愀最攀猀ഀഀ
% will support all meanings.)਍─ഀഀ
% It uses Prolog's Definite Clause Grammar (DCG) rules਍─ 琀漀 搀攀昀椀渀攀 琀栀攀 爀攀氀愀琀椀漀渀猀栀椀瀀 戀攀琀眀攀攀渀 猀攀渀琀攀渀挀攀猀 愀渀搀ഀഀ
% meanings.  Sentences are represented as lists of਍─ 眀漀爀搀猀 愀渀搀 瀀甀渀挀琀甀愀琀椀漀渀 洀愀爀欀猀⸀  攀砀⸀ 嬀✀吀栀椀猀✀Ⰰ 椀猀Ⰰ 愀Ⰰഀഀ
% book, '. '].  Meanings are represented by Prolog਍─ 猀琀爀甀挀琀甀爀攀猀⸀  攀砀⸀ 椀搀攀渀琀椀琀礀⠀琀栀椀猀Ⰰ戀漀漀欀⤀⸀ഀഀ
%਍─ 䈀攀挀愀甀猀攀 倀爀漀氀漀最 爀甀氀攀猀Ⰰ 椀渀挀氀甀搀椀渀最 䐀䌀䜀 爀甀氀攀猀Ⰰ 挀愀渀 戀攀ഀഀ
% used in multiple ways, the same grammar rules can਍─ 戀攀 甀猀攀搀 琀漀 戀漀琀栀 琀爀愀渀猀氀愀琀攀 愀 猀攀渀琀攀渀挀攀 椀渀琀漀 愀 洀攀愀渀椀渀最Ⰰഀഀ
% and a meaning into a sentence.  This is the essence਍─ 漀昀 䈀愀戀攀氀⸀ഀഀ
%਍─ 䈀愀戀攀氀 爀攀愀搀猀 愀 猀攀渀琀攀渀挀攀 愀渀搀 琀栀攀渀 椀渀瀀甀琀猀 椀琀 琀漀 攀愀挀栀ഀഀ
% language's rule for 'sentence'.  When it finds one਍─ 琀栀愀琀 猀甀挀挀攀猀昀甀氀氀礀 最攀渀攀爀愀琀攀猀 愀 ✀洀攀愀渀椀渀最✀Ⰰ 椀琀 琀栀攀渀ഀഀ
% takes that 'meaning' and inputs it to each language's਍─ ✀猀攀渀琀攀渀挀攀✀ 爀甀氀攀猀 愀最愀椀渀Ⰰ 琀栀椀猀 琀椀洀攀 最攀渀攀爀愀琀椀渀最ഀഀ
% sentences.  There might be multiple meanings to਍─ 愀 猀攀渀琀攀渀挀攀Ⰰ 愀渀搀 洀甀氀琀椀瀀氀攀 猀攀渀琀攀渀挀攀猀 昀漀爀 愀 洀攀愀渀椀渀最⸀ഀഀ
%਍─ 吀漀 甀猀攀 椀琀Ⰰ 挀漀渀猀甀氀琀⠀戀愀戀攀氀⤀ 愀渀搀 攀渀琀攀爀 ✀最漀✀ 愀琀 琀栀攀ഀഀ
% '>' prompt.  Enter a sentence.  When you are done਍─ 攀渀琀攀爀 焀甀椀琀⸀  䰀漀漀欀 愀琀 琀栀攀 最爀愀洀洀愀爀 爀甀氀攀猀 愀渀搀 瘀漀挀愀戀甀氀愀爀礀ഀഀ
% to see what types of sentences will work, as Babel਍─ 栀愀猀 愀 瘀攀爀礀 氀椀洀椀琀攀搀 瘀漀挀愀戀甀氀愀爀礀 愀渀搀 欀渀漀眀氀攀搀最攀 漀昀 猀攀渀琀攀渀挀攀ഀഀ
% types.਍─ഀഀ
% Some examples: This is a book.  This is a red book.਍─ 吀栀愀琀 椀猀 愀 戀氀愀挀欀 戀漀砀⸀  䤀猀 琀栀椀猀 愀 戀椀最 戀氀愀挀欀 戀漀漀欀㼀ഀഀ
%਍─ 吀栀攀爀攀 愀爀攀 猀攀瀀愀爀愀琀攀 昀椀氀攀猀 昀漀爀 愀 渀甀洀戀攀爀 漀昀 氀愀渀最甀愀最攀猀Ⰰഀഀ
% each with some limited knowledge of sentences and਍─ 眀漀爀搀猀⸀  䤀昀 礀漀甀 攀砀瀀愀渀搀 愀渀礀 漀昀 琀栀攀猀攀 攀砀愀洀瀀氀攀猀Ⰰ 瀀氀攀愀猀攀ഀഀ
% let us know.਍─ഀഀ
% Note - This program was inspired by the addition of਍─ 唀渀椀挀漀搀攀 猀甀瀀瀀漀爀琀 椀渀 䄀洀稀椀℀ 倀爀漀氀漀最 愀渀搀 漀渀攀 猀攀洀攀猀琀攀爀 漀昀ഀഀ
% beginning Japanese taken by the author.  The sample਍─ 猀攀渀琀攀渀挀攀猀 愀爀攀 戀愀猀攀搀 漀渀 ✀䌀漀氀氀漀焀甀椀愀氀 䨀愀瀀愀渀攀猀攀✀ 戀礀ഀഀ
% Noboru Inamoto.਍ഀഀ
main :-਍  最漀⸀ഀഀ
਍氀愀渀最甀愀最攀猀⠀嬀樀愀瀀愀渀攀猀攀Ⰰ 攀渀最氀椀猀栀Ⰰ 氀愀琀椀渀Ⰰ 最攀爀洀愀渀Ⰰ 猀瀀愀渀椀猀栀崀⤀⸀ഀഀ
਍最漀 㨀ⴀഀഀ
  repeat,਍  渀氀Ⰰ 眀爀椀琀攀⠀␀匀攀渀琀攀渀挀攀㨀 ␀⤀Ⰰഀഀ
  read_string(S),਍  琀爀愀渀⠀匀⤀Ⰰഀഀ
  S = $$.਍ഀഀ
tran(S) :-਍  猀琀爀椀渀最开琀漀欀攀渀猀⠀匀Ⰰ 吀漀欀攀渀猀⤀Ⰰഀഀ
  get_meaning(Tokens, Meaning, Lang1),਍  渀氀Ⰰ 眀爀椀琀攀⠀䰀愀渀最㄀⤀Ⰰ 眀爀椀琀攀⠀␀㨀 ␀⤀Ⰰഀഀ
  write(Meaning), nl, nl,਍  最攀琀开琀爀愀渀猀氀愀琀椀漀渀猀⠀䰀愀渀最㄀Ⰰ 䴀攀愀渀椀渀最Ⰰ 䰀愀渀最㈀Ⰰ 匀攀渀琀攀渀挀攀⤀Ⰰഀഀ
  write(Lang2), write($: $),਍  眀爀椀琀攀开猀攀渀琀攀渀挀攀⠀䰀愀渀最㈀Ⰰ 匀攀渀琀攀渀挀攀⤀Ⰰ 渀氀Ⰰഀഀ
  fail.਍琀爀愀渀⠀开⤀⸀ഀഀ
਍最攀琀开琀爀愀渀猀氀愀琀椀漀渀猀⠀䰀愀渀最㄀Ⰰ 䴀攀愀渀椀渀最Ⰰ 䰀愀渀最㈀Ⰰ 匀攀渀琀攀渀挀攀⤀ 㨀ⴀഀഀ
  languages(Langs),਍  爀攀洀漀瘀攀⠀䰀愀渀最㄀Ⰰ 䰀愀渀最猀Ⰰ 吀爀愀渀䰀愀渀最猀⤀Ⰰഀഀ
  member(Lang2, TranLangs),਍  猀攀渀琀攀渀挀攀⠀䰀愀渀最㈀Ⰰ 䴀攀愀渀椀渀最Ⰰ 匀攀渀琀攀渀挀攀⤀⸀ഀഀ
਍最攀琀开洀攀愀渀椀渀最⠀吀漀欀攀渀猀Ⰰ 䴀攀愀渀椀渀最Ⰰ 䰀愀渀最甀愀最攀⤀ 㨀ⴀഀഀ
  languages(Langs),਍  洀攀洀戀攀爀⠀䰀愀渀最甀愀最攀Ⰰ 䰀愀渀最猀⤀Ⰰഀഀ
  sentence(Language, Meaning, Tokens).਍ഀഀ
sentence(japanese, M, Ts) :-਍  樀猀攀渀琀攀渀挀攀⠀䴀Ⰰ 吀猀Ⰰ 嬀崀⤀⸀ഀഀ
sentence(english, M, Ts) :-਍  攀猀攀渀琀攀渀挀攀⠀䴀Ⰰ 吀猀Ⰰ 嬀崀⤀⸀ഀഀ
sentence(latin, M, Ts) :-਍  氀猀攀渀琀攀渀挀攀⠀䴀Ⰰ 吀猀Ⰰ 嬀崀⤀⸀ഀഀ
sentence(german, M, Ts) :-਍  最猀攀渀琀攀渀挀攀⠀䴀Ⰰ 吀猀Ⰰ 嬀崀⤀⸀ഀഀ
sentence(spanish, M, Ts) :-਍  猀猀攀渀琀攀渀挀攀⠀䴀Ⰰ 吀猀Ⰰ 嬀崀⤀⸀ഀഀ
਍眀爀椀琀攀开猀攀渀琀攀渀挀攀⠀猀瀀愀渀椀猀栀Ⰰ 匀⤀ 㨀ⴀഀഀ
  !,਍  猀眀爀椀琀攀开猀攀渀琀攀渀挀攀⠀匀⤀⸀ഀഀ
write_sentence(_, S) :-਍  眀爀椀琀攀开猀攀渀琀攀渀挀攀⠀匀⤀⸀ഀഀ
਍ഀഀ
%---------------਍─ 唀琀椀氀椀琀椀攀猀ഀഀ
%਍ഀഀ
isupper(L) :-਍  䰀 㸀㴀 怀䄀Ⰰഀഀ
  L =< `Z.਍ഀഀ
islower(L) :-਍  䰀 㸀㴀 怀愀Ⰰഀഀ
  L =< `z.਍ഀഀ
uplow(U,L) :-਍  瘀愀爀⠀唀⤀Ⰰ 椀渀琀攀最攀爀⠀䰀⤀Ⰰ ℀Ⰰഀഀ
  U is L + (`A - `a).਍甀瀀氀漀眀⠀唀Ⰰ䰀⤀ 㨀ⴀഀഀ
  var(L), integer(U), !,਍  䰀 椀猀 唀 ⴀ ⠀怀䄀 ⴀ 怀愀⤀⸀ഀഀ
uplow(U,L) :-਍  椀渀琀攀最攀爀⠀䰀⤀Ⰰ 椀渀琀攀最攀爀⠀唀⤀Ⰰഀഀ
  U is L + (`A - `a).਍ഀഀ
iscapitalized(Word) :-਍  愀琀漀洀⠀圀漀爀搀⤀Ⰰഀഀ
  atom_codes(Word, [First|Rest]),਍  椀猀甀瀀瀀攀爀⠀䘀椀爀猀琀⤀⸀ഀഀ
਍挀愀瀀椀琀愀氀椀稀攀⠀圀漀爀搀Ⰰ 䌀愀瀀圀漀爀搀⤀ 㨀ⴀഀഀ
  var(CapWord), atom(Word), !,਍  愀琀漀洀开挀漀搀攀猀⠀圀漀爀搀Ⰰ 嬀䘀椀爀猀琀簀刀攀猀琀崀⤀Ⰰഀഀ
  uplow(CapFirst, First),਍  愀琀漀洀开挀漀搀攀猀⠀䌀愀瀀圀漀爀搀Ⰰ 嬀䌀愀瀀䘀椀爀猀琀簀刀攀猀琀崀⤀⸀ഀഀ
capitalize(Word, CapWord) :-਍  瘀愀爀⠀圀漀爀搀⤀Ⰰ 愀琀漀洀⠀䌀愀瀀圀漀爀搀⤀Ⰰ ℀Ⰰഀഀ
  atom_codes(CapWord, [CapFirst|Rest]),਍  甀瀀氀漀眀⠀䌀愀瀀䘀椀爀猀琀Ⰰ 䘀椀爀猀琀⤀Ⰰഀഀ
  atom_codes(Word, [First|Rest]).਍挀愀瀀椀琀愀氀椀稀攀⠀圀漀爀搀Ⰰ 䌀愀瀀圀漀爀搀⤀ 㨀ⴀഀഀ
  atom(Word), atom(CapWord),਍  愀琀漀洀开挀漀搀攀猀⠀圀漀爀搀Ⰰ 嬀䘀椀爀猀琀簀刀攀猀琀崀⤀Ⰰഀഀ
  atom_codes(CapWord, [CapFirst|Rest]),਍  甀瀀氀漀眀⠀䌀愀瀀䘀椀爀猀琀Ⰰ 䘀椀爀猀琀⤀⸀ഀഀ
਍搀椀挀琀⠀䐀Ⰰ 䴀Ⰰ 堀Ⰰ 倀愀爀洀猀⤀ 㨀ⴀഀഀ
  Q =.. [D, M, X, Attrs],਍  挀愀氀氀⠀儀⤀Ⰰഀഀ
  satisfy(Parms, Attrs).਍ഀഀ
% 5 argument form for dictionaries with roman਍─ 愀渀搀 渀愀琀椀瘀攀 挀栀愀爀愀挀琀攀爀 猀瀀攀氀氀椀渀最猀ഀഀ
dict(D, M, X, Y, Parms) :-਍  儀 㴀⸀⸀ 嬀䐀Ⰰ 䴀Ⰰ 堀Ⰰ 夀Ⰰ 䄀琀琀爀猀崀Ⰰഀഀ
  call(Q),਍  猀愀琀椀猀昀礀⠀倀愀爀洀猀Ⰰ 䄀琀琀爀猀⤀⸀ഀഀ
਍猀愀琀椀猀昀礀⠀嬀崀Ⰰ 开⤀⸀ഀഀ
satisfy([AV|Z], Attrs) :-਍  洀攀洀戀攀爀⠀䄀嘀Ⰰ 䄀琀琀爀猀⤀Ⰰഀഀ
  satisfy(Z, Attrs).਍ഀഀ
write_sentence([First|Rest]) :-਍  眀爀椀琀攀⠀䘀椀爀猀琀⤀Ⰰഀഀ
  write_sent(Rest).਍ഀഀ
write_sent([]).਍眀爀椀琀攀开猀攀渀琀⠀嬀✀⸀ ✀崀⤀ 㨀ⴀഀഀ
  write('. '), !.਍眀爀椀琀攀开猀攀渀琀⠀嬀✀㼀✀崀⤀ 㨀ⴀഀഀ
  write('?'), !.਍眀爀椀琀攀开猀攀渀琀⠀嬀堀簀夀崀⤀ 㨀ⴀഀഀ
  write($ $), write(X),਍  眀爀椀琀攀开猀攀渀琀⠀夀⤀⸀ഀഀ
਍昀椀爀猀琀开氀攀琀琀攀爀⠀圀漀爀搀Ⰰ 䰀攀琀琀攀爀䰀椀猀琀⤀ 㨀ⴀഀഀ
  atom_codes(Word, [First|_]),਍  洀攀洀戀攀爀⠀䘀椀爀猀琀Ⰰ 䰀攀琀琀攀爀䰀椀猀琀⤀⸀ഀഀ
਍�
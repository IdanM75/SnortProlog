% - - - - - - - - - - - - - - - -  
 %   G e r m a n  
 %  
  
 g s e n t e n c e ( M ,   [ C a p F i r s t | R e s t ] ,   [ ] )   : -  
     v a r ( M ) ,  
     c a p i t a l i z e ( F i r s t ,   C a p F i r s t ) ,  
     g s e n t ( M ,   [ F i r s t | R e s t ] ,   [ ] ) .  
 g s e n t e n c e ( M ,   S ,   [ ] )   : -  
     v a r ( S ) ,  
     g s e n t ( M ,   [ F i r s t | R e s t ] ,   [ ] ) ,  
     c a p i t a l i z e ( F i r s t ,   C a p F i r s t ) ,  
     S   =   [ C a p F i r s t | R e s t ] .  
  
 g s e n t (   i d e n t i t y ( s u b j ( S ) , o b j ( O ) )   )   - - >  
     g s u b j e c t ( S ) ,   g i s v e r b ( _ ) ,   g o b j e c t ( O ) ,   g p e r i o d .  
  
 g s u b j e c t ( S )   - - >   g a r t i c l e ( _ ) ,   g p r o n o u n ( S ) .  
  
 g o b j e c t ( n o u n ( O , [ ] ) )   - - >   g n o u n ( O ) .  
  
 g i s v e r b ( M )   - - >   [ X ] ,   {   d i c t ( g d i c t , M , X , [ p s = v e r b , i s ] )   } .  
  
 g p r o n o u n ( M )   - - >   [ X ] ,   {   d i c t ( g d i c t , M , X , [ p s = p r o n o u n ] )   } .  
  
 g n o u n ( M )   - - >   [ X ] ,   {   d i c t ( g d i c t , M , X , [ p s = n o u n ] )   } .  
  
 g a r t i c l e ( M )   - - >   [ X ] ,   {   d i c t ( g d i c t , M , X , [ p s = a r t i c l e ] )   } .  
  
 g p e r i o d   - - >   [ ' .   ' ] .  
  
 g d i c t ( a ,   e i n ,   [ p s = a r t i c l e ] ) .  
 g d i c t ( b l a c k ,   s c h w a r z e ,   [ p s = a d j ] ) .  
 g d i c t ( b o o k ,   ' B u c h ' ,   [ p s = n o u n ] ) .  
 g d i c t ( b o x ,   ' S c h a c h t e l ' ,   [ p s = n o u n ] ) .  
 g d i c t ( f a r t h a t ,   d a s ,   [ p s = p r o n o u n ] ) .  
 g d i c t ( i s ,   i s t ,   [ p s = v e r b , i s ] ) .  
 g d i c t ( r e d ,   r o t e ,   [ p s = a d j ] ) .  
 g d i c t ( w h a t ,   w a s ,   [ p s = p r o n o u n , i n t e r r o g a t i v e ] ) .  
 g d i c t ( p e n c i l ,   ' B l e i s t i f t ' ,   [ p s = n o u n ] ) .  
 g d i c t ( t h a t ,   d a s ,   [ p s = a d j ] ) .  
 g d i c t ( t h a t ,   d a s ,   [ p s = p r o n o u n ] ) .  
 g d i c t ( t h i s ,   d a s ,   [ p s = a d j ] ) .  
 g d i c t ( t h i s ,   d a s ,   [ p s = p r o n o u n ] ) .  
 
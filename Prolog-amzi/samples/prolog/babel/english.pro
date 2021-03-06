% - - - - - - - - - - -  
 %   E n g l i s h  
 %  
  
 e s e n t e n c e ( M ,   [ C a p F i r s t | R e s t ] ,   [ ] )   : -  
     v a r ( M ) ,  
     c a p i t a l i z e ( F i r s t ,   C a p F i r s t ) ,  
     e s e n t ( M ,   [ F i r s t | R e s t ] ,   [ ] ) .  
 e s e n t e n c e ( M ,   S ,   [ ] )   : -  
     v a r ( S ) ,  
     e s e n t ( M ,   [ F i r s t | R e s t ] ,   [ ] ) ,  
     c a p i t a l i z e ( F i r s t ,   C a p F i r s t ) ,  
     S   =   [ C a p F i r s t | R e s t ] .  
  
 e s e n t (   i d e n t i t y ( s u b j ( S ) , o b j ( O ) )   )   - - >  
     e s u b j e c t ( S ) ,   e i s v e r b ( _ ) ,   e o b j e c t ( O ) ,   e p e r i o d .  
 e s e n t (   i d e n t i t y _ q u e s t i o n ( s u b j ( S ) , o b j ( O ) )   )   - - >  
     e p r o n o u n ( O , i n t e r r o g a t i v e ) ,   e i s v e r b ( _ ) ,   e s u b j e c t ( S ) ,   e q u e s t i o n m a r k .  
 e s e n t (   i d e n t i t y _ q u e s t i o n ( s u b j ( S ) , o b j ( O ) )   )   - - >  
     e i s v e r b ( _ ) ,   e s u b j e c t ( S ) ,   e o b j e c t ( O ) ,   e q u e s t i o n m a r k .  
 e s e n t (   i d e n t i t y ( n o t , s u b j ( S ) , o b j ( O ) )   )   - - >  
     e s u b j e c t ( S ) ,   e i s v e r b ( _ ) ,   [ n o t ] ,   e o b j e c t ( O ) ,   e p e r i o d .  
 e s e n t (   a t t r i b u t e ( s u b j ( S ) , a t t r ( A ) )   )   - - >  
     e s u b j e c t ( S ) ,   e i s v e r b ( _ ) ,   e a d j l i s t ( A ) ,   e p e r i o d .  
 e s e n t (   a t t r i b u t e ( n o t , s u b j ( S ) , a t t r ( A ) )   )   - - >  
     e s u b j e c t ( S ) ,   e i s v e r b ( _ ) ,   [ n o t ] ,   e a d j l i s t ( A ) ,   e p e r i o d .  
 e s e n t (   a t t r i b u t e _ q u e s t i o n ( s u b j ( S ) , a t t r ( A ) )   )   - - >  
     e i s v e r b ( _ ) ,   e s u b j e c t ( S ) ,   e a d j l i s t ( A ) ,   e q u e s t i o n m a r k .  
  
 e s u b j e c t ( S )   - - >   e p r o n o u n ( S ) .  
 e s u b j e c t ( S )   - - >   e n o u n p h r a s e ( S ) .  
  
 e o b j e c t ( O )   - - >   e n o u n p h r a s e ( O ) .  
  
 e n o u n p h r a s e ( N )   - - >   e t h _ a d j s _ n o u n ( N ) .  
 e n o u n p h r a s e ( N )   - - >  
     e a r t i c l e ( _ , i n d e f i n i t e , F i r s t L e t t e r ) ,  
     e a d j s _ n o u n ( N ) ,  
     {   e f i r s t _ l e t t e r ( N ,   F i r s t L e t t e r )   } .  
  
 e t h _ a d j s _ n o u n ( n o u n ( N , [ T H | M O D s ] ) )   - - >   e t h a d j ( T H ) ,   e a d j s _ n o u n ( n o u n ( N , M O D s ) ) .  
  
 e a d j s _ n o u n ( n o u n ( N , M O D s ) )   - - >   e a d j l i s t ( M O D s ) ,   e n o u n ( N ) .  
  
 e i s v e r b ( M )   - - >   [ X ] ,   {   d i c t ( e d i c t , M , X , [ p s = v e r b , i s ] )   } .  
  
 e p r o n o u n ( M )   - - >   [ X ] ,   {   d i c t ( e d i c t , M , X , [ p s = p r o n o u n ] )   } .  
  
 e p r o n o u n ( M , i n t e r r o g a t i v e )   - - >   [ X ] ,  
     {   d i c t ( e d i c t , M , X , [ p s = p r o n o u n , i n t e r r o g a t i v e ] )   } .  
  
 e n o u n ( M )   - - >   [ X ] ,   {   d i c t ( e d i c t , M , X , [ p s = n o u n ] )   } .  
 e n o u n ( M ,   I n ,   O u t )   : -  
     d i c t ( e d i c t , M , [ X | Y ] , [ p s = n o u n ] ) ,  
     a p p e n d ( [ X | Y ] ,   O u t ,   I n ) .  
  
 e a d j l i s t ( [ A | X ] )   - - >   e a d j ( A ) ,   e a d j l i s t ( X ) .  
 e a d j l i s t ( [ ] )   - - >   [ ] .  
  
 e t h a d j ( M )   - - >   [ X ] ,   {   d i c t ( e d i c t , M , X , [ p s = t h a d j ] )   } .  
  
 e a d j ( M )   - - >   [ X ] ,   {   d i c t ( e d i c t , M , X , [ p s = a d j ] )   } .  
  
 e a r t i c l e ( M , i n d e f i n i t e , F L )   - - >  
     [ X ] ,   {   d i c t ( e d i c t , M , X , [ p s = a r t i c l e , i n d e f i n i t e , f i r s t _ l e t t e r = F L ] )   } .  
  
 e p e r i o d   - - >   [ ' .   ' ] .  
  
 e q u e s t i o n m a r k   - - >   [ ' ? ' ] .  
  
 e f i r s t _ l e t t e r ( n o u n ( N , [ ] ) ,   T y p e )   : -  
     e l e t t e r 1 ( N ,   T y p e ) .  
 e f i r s t _ l e t t e r ( n o u n ( N , [ M o d 1 | _ ] ) ,   T y p e )   : -  
     e l e t t e r 1 ( M o d 1 ,   T y p e ) .  
  
 e l e t t e r 1 ( W o r d ,   v o w e l )   : -  
     a t o m _ c o d e s ( W o r d ,   [ F i r s t | _ ] ) ,  
     m e m b e r ( F i r s t ,   [ ` a , ` e , ` i , ` o , ` u , ` A , ` E , ` I , ` O , ` U ] ) .  
 e l e t t e r 1 ( W o r d ,   c o n s o n a n t )   : -  
     a t o m _ c o d e s ( W o r d ,   [ F i r s t | _ ] ) ,  
     n o t   m e m b e r ( F i r s t ,   [ ` a , ` e , ` i , ` o , ` u , ` A , ` E , ` I , ` O , ` U ] ) .  
  
 e d i c t ( i n d e f _ a r t ,   a ,   [ p s = a r t i c l e , i n d e f i n i t e , f i r s t _ l e t t e r = c o n s o n a n t ] ) .  
 e d i c t ( i n d e f _ a r t ,   a n ,   [ p s = a r t i c l e , i n d e f i n i t e , f i r s t _ l e t t e r = v o w e l ] ) .  
 e d i c t ( b l a c k ,   b l a c k ,   [ p s = a d j ] ) .  
 e d i c t ( b o o k ,   b o o k ,   [ p s = n o u n ] ) .  
 e d i c t ( b o x ,   b o x ,   [ p s = n o u n ] ) .  
 e d i c t ( d i c t i o n a r y ,   d i c t i o n a r y ,   [ p s = n o u n ] ) .  
 e d i c t ( f a r t h a t ,   t h a t ,   [ p s = p r o n o u n ] ) .  
 e d i c t ( i s ,   i s ,   [ p s = v e r b , i s ] ) .  
 e d i c t ( i t ,   i t ,   [ p s = p r o n o u n ] ) .  
 e d i c t ( r e d ,   r e d ,   [ p s = a d j ] ) .  
 e d i c t ( w h a t ,   w h a t ,   [ p s = p r o n o u n , i n t e r r o g a t i v e ] ) .  
 e d i c t ( p e n c i l ,   p e n c i l ,   [ p s = n o u n ] ) .  
 e d i c t ( t h a t ,   t h a t ,   [ p s = t h a d j ] ) .  
 e d i c t ( t h a t ,   t h a t ,   [ p s = p r o n o u n ] ) .  
 e d i c t ( t h i s ,   t h i s ,   [ p s = t h a d j ] ) .  
 e d i c t ( t h i s ,   t h i s ,   [ p s = p r o n o u n ] ) .  
 e d i c t ( u n i v e r s i t y ,   u n i v e r s i t y ,   [ p s = n o u n ] ) .  
  
 e d i c t ( w h i t e ,   w h i t e ,   [ p s = a d j ] ) .  
 e d i c t ( b l u e ,   b l u e ,   [ p s = a d j ] ) .  
 e d i c t ( s c h o o l ,   s c h o o l ,   [ p s = n o u n ] ) .  
 e d i c t ( u n i v e r s i t y ,   u n i v e r s i t y ,   [ p s = n o u n ] ) .  
 e d i c t ( s e n i o r ,   s e n i o r ,   [ p s = a d j ] ) .  
 e d i c t ( j u n i o r ,   j u n i o r ,   [ p s = a d j ] ) .  
 e d i c t ( h i g h ,   h i g h ,   [ p s = a d j ] ) .  
 e d i c t ( g r a d e ,   g r a d e ,   [ p s = a d j ] ) .  
 e d i c t ( f a r t h a t ,   t h a t ,   [ p s = a d j ] ) .  
 e d i c t ( l e t t e r ,   l e t t e r ,   [ p s = n o u n ] ) .  
 e d i c t ( w i n d o w ,   w i n d o w ,   [ p s = n o u n ] ) .  
 e d i c t ( b i g ,   b i g ,   [ p s = a d j ] ) .  
 e d i c t ( b i g ,   l a r g e ,   [ p s = a d j ] ) .  
 e d i c t ( s m a l l ,   s m a l l ,   [ p s = a d j ] ) .  
 e d i c t ( d e s k ,   d e s k ,   [ p s = n o u n ] ) .  
 e d i c t ( c h a i r ,   c h a i r ,   [ p s = n o u n ] ) .  
 e d i c t ( o l d ,   o l d ,   [ p s = a d j ] ) .  
 e d i c t ( n e w ,   n e w ,   [ p s = a d j ] ) .  
  
 